import 'dart:convert';

import 'package:provai/data/models/ai_dtos.dart';
import 'package:provai/data/services/ai_service.dart';
import 'package:provai/data/services/local_storage_service.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/repositories/interview_repository.dart';
import 'package:provai/utils/cancel_handle.dart';
import 'package:provai/utils/logger.dart';
import 'package:provai/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'interview_repository_impl.g.dart';

class InterviewRepositoryImpl implements InterviewRepository {
  InterviewRepositoryImpl(this._ai, this._storage);

  final AiService _ai;
  final LocalStorageService _storage;
  static const _uuid = Uuid();

  /// Cihazda tutulan en fazla oturum sayısı.
  static const _maxStoredSessions = 30;

  @override
  Future<Result<InterviewSession>> createSession({
    required UserProfile profile,
    required String jobPosting,
    required int questionCount,
    required InterviewLanguage language,
    CancelHandle? cancel,
  }) async {
    final result = await _ai.generateQuestions(
      candidate: _candidate(profile, language),
      jobPosting: jobPosting,
      questionCount: questionCount,
      cancel: cancel,
    );
    switch (result) {
      case Failure(:final error):
        return Failure(error);
      case Success(:final data):
        final session = InterviewSession(
          id: _uuid.v4(),
          createdAt: DateTime.now(),
          targetRole: profile.targetRole,
          seniority: profile.seniority,
          language: language,
          roleSummary: data.roleSummary,
          jobPosting: jobPosting,
          questions: [
            for (final (i, q) in data.questions.indexed)
              q.toDomain('q${i + 1}'),
          ],
        );
        await _save(session);
        await _storage.setInt(
          StorageKeys.startedSessionCount,
          startedSessionCount + 1,
        );
        return Success(session);
    }
  }

  @override
  Future<Result<InterviewSession>> submitAnswer({
    required InterviewSession session,
    required InterviewQuestion question,
    required String transcript,
    required AnswerInputMode inputMode,
    required UserProfile profile,
    int? durationSeconds,
    int? fillerWordCount,
    CancelHandle? cancel,
  }) async {
    final result = await _ai.evaluateAnswer(
      candidate: _candidate(profile, session.language),
      roleSummary: session.roleSummary,
      question: question,
      answer: transcript,
      inputMode: inputMode,
      durationSeconds: durationSeconds,
      fillerWordCount: fillerWordCount,
      cancel: cancel,
    );
    switch (result) {
      case Failure(:final error):
        return Failure(error);
      case Success(:final data):
        final answer = InterviewAnswer(
          questionId: question.id,
          transcript: transcript,
          inputMode: inputMode,
          feedback: data,
          durationSeconds: durationSeconds,
          fillerWordCount: fillerWordCount,
        );
        final updated = session.copyWith(
          answers: [
            ...session.answers.where((a) => a.questionId != question.id),
            answer,
          ],
        );
        await _save(updated);
        return Success(updated);
    }
  }

  @override
  List<InterviewSession> getSessions() {
    final raw = _storage.getString(StorageKeys.sessions);
    if (raw == null) return const [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return [
        for (final item in list)
          InterviewSession.fromJson(item as Map<String, dynamic>),
      ];
    } on Object catch (error) {
      appLogger.w('Oturum geçmişi okunamadı', error: error);
      return const [];
    }
  }

  @override
  InterviewSession? getSession(String id) =>
      getSessions().where((s) => s.id == id).firstOrNull;

  @override
  int get startedSessionCount =>
      _storage.getInt(StorageKeys.startedSessionCount) ?? 0;

  Future<void> _save(InterviewSession session) async {
    final sessions = [
      session,
      ...getSessions().where((s) => s.id != session.id),
    ].take(_maxStoredSessions);
    await _storage.setString(
      StorageKeys.sessions,
      jsonEncode([for (final s in sessions) s.toJson()]),
    );
  }

  CandidateDto _candidate(UserProfile profile, InterviewLanguage language) =>
      CandidateDto(
        role: profile.targetRole,
        seniority: profile.seniority.name,
        language: language.name,
        struggle: profile.struggle.name,
      );
}

@Riverpod(keepAlive: true)
InterviewRepository interviewRepository(Ref ref) => InterviewRepositoryImpl(
  ref.watch(aiServiceProvider),
  ref.watch(localStorageServiceProvider),
);
