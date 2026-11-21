import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/utils/app_exception.dart';

part 'session_state.freezed.dart';

/// Sorunun yaşam döngüsü: cevaplanıyor → değerlendiriliyor → geri bildirim.
enum SessionPhase { answering, evaluating, feedback }

enum RecordingState { idle, listening, paused }

/// Mikrofon/konuşma tanıma durumu. Kullanılamıyorsa yazılı cevaba geçilir.
enum MicAvailability { unknown, available, denied, unavailable }

@freezed
sealed class SessionEffect with _$SessionEffect {
  const factory SessionEffect.showError(AppException error) =
      SessionEffectShowError;
  const factory SessionEffect.openResult(String sessionId) =
      SessionEffectOpenResult;
  const factory SessionEffect.openPaywall() = SessionEffectOpenPaywall;
}

@freezed
abstract class SessionState with _$SessionState {
  const factory SessionState({
    required InterviewSession? session,
    @Default(0) int currentIndex,
    @Default(SessionPhase.answering) SessionPhase phase,
    @Default(AnswerInputMode.voice) AnswerInputMode inputMode,
    @Default(RecordingState.idle) RecordingState recording,
    @Default(MicAvailability.unknown) MicAvailability mic,
    @Default('') String committedTranscript,
    @Default('') String partialTranscript,
    @Default('') String typedAnswer,
    @Default(0) int elapsedSeconds,
    @Default(false) bool isPro,
    SessionEffect? effect,
  }) = _SessionState;

  const SessionState._();

  /// Değerlendirme için gereken asgari kelime sayısı.
  static const minWords = 5;

  InterviewQuestion? get question {
    final s = session;
    if (s == null || currentIndex >= s.questions.length) return null;
    return s.questions[currentIndex];
  }

  InterviewAnswer? get currentAnswer {
    final q = question;
    return q == null ? null : session?.answerFor(q.id);
  }

  int get totalQuestions => session?.questions.length ?? 0;
  bool get isLastQuestion => currentIndex >= totalQuestions - 1;

  String get spokenTranscript => [
    committedTranscript,
    partialTranscript,
  ].where((part) => part.trim().isNotEmpty).join(' ').trim();

  String get answerText => inputMode == AnswerInputMode.voice
      ? spokenTranscript
      : typedAnswer.trim();

  int get answerWordCount =>
      answerText.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;

  bool get canSubmit =>
      phase == SessionPhase.answering &&
      recording != RecordingState.listening &&
      answerWordCount >= minWords;
}
