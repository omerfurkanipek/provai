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

  /// Değerlendir'e basıldı ama cevap asgari kelime sayısının altında.
  const factory SessionEffect.answerTooShort() = SessionEffectAnswerTooShort;
}

@freezed
abstract class SessionState with _$SessionState {
  const factory SessionState({
    required InterviewSession? session,
    @Default(0) int currentIndex,
    @Default(SessionPhase.answering) SessionPhase phase,
    @Default(RecordingState.idle) RecordingState recording,
    @Default(MicAvailability.unknown) MicAvailability mic,

    /// Cevabın kesinleşmiş metni: yazılan ve sesle tanınıp kesinleşen kısımlar.
    @Default('') String answer,

    /// Konuşurken henüz kesinleşmemiş son parça (yalnızca dinlerken dolu).
    @Default('') String partialTranscript,

    /// Bu cevapta mikrofon kullanıldı mı? Değerlendirmede cevap türünü belirler.
    @Default(false) bool usedVoice,
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

  /// Alanda görünen metin: kesinleşmiş cevap + dinlerken gelen kısmi parça.
  String get displayText => [
    answer.trim(),
    partialTranscript.trim(),
  ].where((part) => part.isNotEmpty).join(' ');

  AnswerInputMode get inputMode =>
      usedVoice ? AnswerInputMode.voice : AnswerInputMode.text;

  int get answerWordCount =>
      displayText.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;

  /// Buton yalnızca değerlendirme sürerken kapalıdır; diğer durumlarda basılır
  /// ve eksik varsa kullanıcıya nedeni söylenir.
  bool get isAnswerLongEnough => answerWordCount >= minWords;
}
