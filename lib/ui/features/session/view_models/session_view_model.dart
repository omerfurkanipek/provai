import 'dart:async';

import 'package:provai/data/repositories/interview_repository_impl.dart';
import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/data/services/analytics_service.dart';
import 'package:provai/data/services/speech_service.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/use_cases/speech_metrics.dart';
import 'package:provai/ui/features/session/view_models/session_state.dart';
import 'package:provai/utils/app_exception.dart';
import 'package:provai/utils/cancel_handle.dart';
import 'package:provai/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_view_model.g.dart';

@riverpod
class SessionViewModel extends _$SessionViewModel {
  Timer? _timer;
  CancelHandle? _cancel;
  final _subscriptions = <StreamSubscription<String>>[];

  /// Kullanıcı durdurdu mu? Tanıyıcı kendiliğinden durursa yeniden başlatılır.
  bool _userStopped = true;

  SpeechService get _speech => ref.read(speechServiceProvider);

  @override
  SessionState build(String sessionId) {
    final session = ref.read(interviewRepositoryProvider).getSession(sessionId);
    final isPro = ref.read(subscriptionRepositoryProvider).currentStatus.isPro;

    _subscriptions
      ..add(_speech.statusStream.listen(_onSpeechStatus))
      ..add(_speech.errorStream.listen(_onSpeechError));
    ref.onDispose(() {
      _timer?.cancel();
      _cancel?.cancel();
      for (final sub in _subscriptions) {
        unawaited(sub.cancel());
      }
      unawaited(_speech.cancel());
    });

    // Yarım kalan provaya dönülürse ilk cevaplanmamış sorudan devam edilir.
    final index = session?.nextQuestionIndex ?? 0;
    return SessionState(
      session: session,
      isPro: isPro,
      currentIndex: session == null
          ? 0
          : index.clamp(0, session.questions.length - 1),
      phase: session != null && session.isCompleted
          ? SessionPhase.feedback
          : SessionPhase.answering,
    );
  }

  // --- Ses ---------------------------------------------------------------

  Future<void> toggleRecording() async {
    if (state.recording == RecordingState.listening) {
      await _pause();
    } else {
      await _startListening();
    }
  }

  Future<void> _startListening() async {
    if (state.mic == MicAvailability.unknown) {
      final ready = await _speech.ensureReady();
      if (!ref.mounted) return;
      if (!ready) {
        // initialize false: izin reddedildi ya da cihazda tanıyıcı yok.
        if (state.mic == MicAvailability.unknown) {
          state = state.copyWith(
            mic: MicAvailability.unavailable,
            inputMode: AnswerInputMode.text,
          );
        }
        return;
      }
      state = state.copyWith(mic: MicAvailability.available);
    }
    if (state.mic != MicAvailability.available) return;

    _userStopped = false;
    state = state.copyWith(recording: RecordingState.listening);
    _startTimer();
    await _listen();
  }

  Future<void> _listen() => _speech.start(
    localeId: state.session?.language == InterviewLanguage.en
        ? 'en_US'
        : 'tr_TR',
    onResult: (words, {required isFinal}) {
      if (!ref.mounted) return;
      if (isFinal) {
        state = state.copyWith(
          committedTranscript: [
            state.committedTranscript,
            words,
          ].where((p) => p.trim().isNotEmpty).join(' '),
          partialTranscript: '',
        );
      } else {
        state = state.copyWith(partialTranscript: words);
      }
    },
  );

  Future<void> _pause() async {
    _userStopped = true;
    _timer?.cancel();
    await _speech.stop();
    if (!ref.mounted) return;
    state = state.copyWith(
      recording: RecordingState.paused,
      // Son kısmi sonucu kaybetme.
      committedTranscript: state.spokenTranscript,
      partialTranscript: '',
    );
  }

  void _onSpeechStatus(String status) {
    final stopped = status == 'done' || status == 'notListening';
    if (!stopped || _userStopped || !ref.mounted) return;
    if (state.recording != RecordingState.listening) return;
    // Android tanıyıcısı sessizlikte durdu; kullanıcı hâlâ konuşuyor sayılır.
    state = state.copyWith(
      committedTranscript: state.spokenTranscript,
      partialTranscript: '',
    );
    unawaited(_listen());
  }

  void _onSpeechError(String error) {
    if (!ref.mounted) return;
    if (error == 'error_permission' ||
        error == 'error_insufficient_permissions') {
      _userStopped = true;
      _timer?.cancel();
      state = state.copyWith(
        mic: MicAvailability.denied,
        recording: RecordingState.idle,
        inputMode: AnswerInputMode.text,
      );
    }
    // error_no_match / error_speech_timeout: sessizlik; status akışı yeniden başlatır.
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!ref.mounted) return;
      state = state.copyWith(elapsedSeconds: state.elapsedSeconds + 1);
    });
  }

  Future<void> restartAnswer() async {
    if (state.recording == RecordingState.listening) await _pause();
    state = state.copyWith(
      committedTranscript: '',
      partialTranscript: '',
      typedAnswer: '',
      elapsedSeconds: 0,
      recording: RecordingState.idle,
    );
  }

  // --- Yazılı cevap ------------------------------------------------------

  /// Ses ve yazı aynı cevabın iki giriş yolu: moda geçerken metin taşınır,
  /// kullanıcı sesle başlayıp klavyeyle düzeltebilir (veya tersi).
  Future<void> setInputMode(AnswerInputMode mode) async {
    if (mode == state.inputMode) return;
    if (state.recording == RecordingState.listening) await _pause();
    if (mode == AnswerInputMode.text) {
      final merged = [
        state.typedAnswer.trim(),
        state.spokenTranscript,
      ].where((part) => part.isNotEmpty).join(' ');
      state = state.copyWith(
        inputMode: mode,
        typedAnswer: merged,
        committedTranscript: '',
        partialTranscript: '',
      );
    } else {
      state = state.copyWith(
        inputMode: mode,
        committedTranscript: state.typedAnswer.trim(),
        partialTranscript: '',
        typedAnswer: '',
      );
    }
  }

  void onTypedAnswerChanged(String value) =>
      state = state.copyWith(typedAnswer: value);

  // --- Değerlendirme -----------------------------------------------------

  Future<void> submit() async {
    final session = state.session;
    final question = state.question;
    if (session == null || question == null || !state.canSubmit) return;

    final profile =
        ref.read(profileRepositoryProvider).getProfile() ?? const UserProfile();
    final isVoice = state.inputMode == AnswerInputMode.voice;
    final transcript = state.answerText;
    final cancel = _cancel = CancelHandle();
    state = state.copyWith(phase: SessionPhase.evaluating);

    final result = await ref
        .read(interviewRepositoryProvider)
        .submitAnswer(
          session: session,
          question: question,
          transcript: transcript,
          inputMode: state.inputMode,
          profile: profile,
          durationSeconds: isVoice ? state.elapsedSeconds : null,
          fillerWordCount: isVoice
              ? SpeechMetrics.fillerCount(transcript, session.language)
              : null,
          cancel: cancel,
        );
    if (!ref.mounted) return;
    _cancel = null;

    switch (result) {
      case Success(:final data):
        ref.read(analyticsServiceProvider).track('answer_submitted', {
          'input': state.inputMode.name,
          'score': data.answerFor(question.id)?.feedback.score,
        });
        state = state.copyWith(session: data, phase: SessionPhase.feedback);
      case Failure(error: CancelledException()):
        state = state.copyWith(phase: SessionPhase.answering);
      case Failure(:final error):
        state = state.copyWith(
          phase: SessionPhase.answering,
          effect: SessionEffect.showError(error),
        );
    }
  }

  void cancelEvaluation() => _cancel?.cancel();

  /// Sonraki soruya geçer; son sorudaysa rapora yönlendirir.
  void next() {
    final session = state.session;
    if (session == null) return;
    if (state.isLastQuestion) {
      ref.read(analyticsServiceProvider).track('session_completed', {
        'score': session.overallScore,
      });
      state = state.copyWith(effect: SessionEffect.openResult(session.id));
      return;
    }
    state = state.copyWith(
      currentIndex: state.currentIndex + 1,
      phase: SessionPhase.answering,
      recording: RecordingState.idle,
      committedTranscript: '',
      partialTranscript: '',
      typedAnswer: '',
      elapsedSeconds: 0,
      // Mikrofon kullanılabiliyorsa yeni soruda sesli moda dön.
      inputMode:
          state.mic == MicAvailability.available ||
              state.mic == MicAvailability.unknown
          ? AnswerInputMode.voice
          : AnswerInputMode.text,
    );
  }

  void requestImprovedAnswer() {
    if (!state.isPro) {
      state = state.copyWith(effect: const SessionEffect.openPaywall());
    }
  }

  /// Paywall'dan Pro olarak dönülünce kilitli içerik açılır.
  void refreshEntitlement() => state = state.copyWith(
    isPro: ref.read(subscriptionRepositoryProvider).currentStatus.isPro,
  );

  void consumeEffect() => state = state.copyWith(effect: null);
}
