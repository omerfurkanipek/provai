import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provai/domain/models/user_profile.dart';

part 'interview.freezed.dart';
part 'interview.g.dart';

// Not: Bu modeller cihazda JSON olarak saklandığı için JSON serileştirmesi var;
// sunucu sözleşmesi ayrı DTO'larla (data/models) tanımlıdır.

enum QuestionType { motivation, behavioral, technical, situational }

enum AnswerInputMode { voice, text }

@freezed
abstract class InterviewQuestion with _$InterviewQuestion {
  const factory InterviewQuestion({
    required String id,
    required String text,
    required QuestionType type,
    @Default('') String focus,
  }) = _InterviewQuestion;

  factory InterviewQuestion.fromJson(Map<String, dynamic> json) =>
      _$InterviewQuestionFromJson(json);
}

@freezed
abstract class CriteriaScores with _$CriteriaScores {
  const factory CriteriaScores({
    required int structure,
    required int relevance,
    required int specificity,
    required int clarity,
  }) = _CriteriaScores;

  factory CriteriaScores.fromJson(Map<String, dynamic> json) =>
      _$CriteriaScoresFromJson(json);
}

/// Kırmızı kalem düzeltmesi. [quote] cevapta birebir geçen ifade (altı çizilir)
/// ya da eksik bir şey söyleniyorsa boştur.
@freezed
abstract class Improvement with _$Improvement {
  const factory Improvement({required String fix, @Default('') String quote}) =
      _Improvement;

  factory Improvement.fromJson(Map<String, dynamic> json) =>
      _$ImprovementFromJson(json);
}

@freezed
abstract class AnswerFeedback with _$AnswerFeedback {
  const factory AnswerFeedback({
    required int score,
    required CriteriaScores criteria,
    required String summary,
    required List<String> strengths,
    required List<Improvement> improvements,
    required String improvedAnswer,
    required String followUpQuestion,
  }) = _AnswerFeedback;

  factory AnswerFeedback.fromJson(Map<String, dynamic> json) =>
      _$AnswerFeedbackFromJson(json);
}

@freezed
abstract class InterviewAnswer with _$InterviewAnswer {
  const factory InterviewAnswer({
    required String questionId,
    required String transcript,
    required AnswerInputMode inputMode,
    required AnswerFeedback feedback,
    int? durationSeconds,
    int? fillerWordCount,
  }) = _InterviewAnswer;

  factory InterviewAnswer.fromJson(Map<String, dynamic> json) =>
      _$InterviewAnswerFromJson(json);
}

/// Bir prova oturumu: üretilen sorular ve verilen cevaplar.
@freezed
abstract class InterviewSession with _$InterviewSession {
  const factory InterviewSession({
    required String id,
    required DateTime createdAt,
    required String targetRole,
    required Seniority seniority,
    required InterviewLanguage language,
    required String roleSummary,
    required List<InterviewQuestion> questions,
    @Default('') String jobPosting,
    @Default([]) List<InterviewAnswer> answers,
  }) = _InterviewSession;

  const InterviewSession._();

  factory InterviewSession.fromJson(Map<String, dynamic> json) =>
      _$InterviewSessionFromJson(json);

  bool get isCompleted => answers.length >= questions.length;

  InterviewAnswer? answerFor(String questionId) =>
      answers.where((a) => a.questionId == questionId).firstOrNull;

  /// İlk cevaplanmamış sorunun sırası; hepsi cevaplandıysa soru sayısı.
  int get nextQuestionIndex {
    final index = questions.indexWhere((q) => answerFor(q.id) == null);
    return index == -1 ? questions.length : index;
  }

  /// 0–100 arası genel puan (cevap puanlarının ortalaması × 10).
  int? get overallScore {
    if (answers.isEmpty) return null;
    final total = answers.fold<int>(0, (sum, a) => sum + a.feedback.score);
    return (total * 10 / answers.length).round();
  }

  /// Kriter ortalamaları (1–10, ondalıklı).
  ({double structure, double relevance, double specificity, double clarity})?
  get averageCriteria {
    if (answers.isEmpty) return null;
    double avg(int Function(CriteriaScores c) pick) =>
        answers.fold<int>(0, (sum, a) => sum + pick(a.feedback.criteria)) /
        answers.length;
    return (
      structure: avg((c) => c.structure),
      relevance: avg((c) => c.relevance),
      specificity: avg((c) => c.specificity),
      clarity: avg((c) => c.clarity),
    );
  }
}
