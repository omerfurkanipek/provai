import 'package:provai/data/repositories/interview_repository_impl.dart';
import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/data/services/analytics_service.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/repositories/interview_repository.dart';
import 'package:provai/ui/features/home/view_models/home_state.dart';
import 'package:provai/utils/app_exception.dart';
import 'package:provai/utils/cancel_handle.dart';
import 'package:provai/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  CancelHandle? _cancel;

  @override
  HomeState build() {
    final profile =
        ref.read(profileRepositoryProvider).getProfile() ?? const UserProfile();
    final isPro = ref.read(subscriptionRepositoryProvider).currentStatus.isPro;
    // Abonelik değişince (paywall'dan dönüş) yalnızca Pro alanları güncellenir;
    // watch kullanılsaydı state baştan kurulur ve yazılan ilan metni kaybolurdu.
    ref
      ..listen(subscriptionStatusProvider, (_, next) {
        final pro = next.value?.isPro ?? false;
        if (pro == state.isPro) return;
        state = state.copyWith(
          isPro: pro,
          questionCount: pro ? 5 : FreeTier.questionsPerSession,
        );
      })
      ..onDispose(() => _cancel?.cancel());

    final interviews = ref.read(interviewRepositoryProvider);
    return HomeState(
      profile: profile,
      language: profile.interviewLanguage,
      questionCount: isPro ? 5 : FreeTier.questionsPerSession,
      isPro: isPro,
      startedSessions: interviews.startedSessionCount,
      recentSessions: interviews.getSessions().take(5).toList(),
    );
  }

  /// Ekrana dönüldüğünde (prova bitince) geçmişi ve sayaçları tazeler.
  void refresh() {
    final interviews = ref.read(interviewRepositoryProvider);
    state = state.copyWith(
      profile:
          ref.read(profileRepositoryProvider).getProfile() ?? state.profile,
      startedSessions: interviews.startedSessionCount,
      recentSessions: interviews.getSessions().take(5).toList(),
    );
  }

  void onPostingChanged(String value) =>
      state = state.copyWith(jobPosting: value);

  void selectLanguage(InterviewLanguage language) =>
      state = state.copyWith(language: language);

  /// Ücretsiz kullanıcı soru sayısını değiştiremez; denerse paywall açılır.
  void selectQuestionCount(int count) {
    if (!state.isPro) {
      state = state.copyWith(effect: const HomeEffect.openPaywall());
      return;
    }
    state = state.copyWith(questionCount: count);
  }

  Future<void> startSession() async {
    if (!state.canSubmit) return;
    // Girdi yoksa sunucuya istek gönderilmez.
    if (state.isPostingEmpty) {
      state = state.copyWith(effect: const HomeEffect.postingRequired());
      return;
    }
    if (!state.canStartSession) {
      state = state.copyWith(effect: const HomeEffect.openPaywall());
      return;
    }

    final cancel = _cancel = CancelHandle();
    state = state.copyWith(isGenerating: true);
    final result = await ref
        .read(interviewRepositoryProvider)
        .createSession(
          profile: state.profile,
          jobPosting: state.jobPosting.trim(),
          questionCount: state.questionCount,
          language: state.language,
          cancel: cancel,
        );
    if (!ref.mounted) return;
    _cancel = null;

    switch (result) {
      case Success(:final data):
        ref.read(analyticsServiceProvider).track('session_started', {
          'questions': data.questions.length,
          'language': state.language.name,
        });
        refresh();
        state = state.copyWith(
          isGenerating: false,
          effect: HomeEffect.openSession(data.id),
        );
      case Failure(error: CancelledException()):
        state = state.copyWith(isGenerating: false);
      case Failure(:final error):
        state = state.copyWith(
          isGenerating: false,
          effect: HomeEffect.showError(error),
        );
    }
  }

  void cancelGeneration() => _cancel?.cancel();

  void consumeEffect() => state = state.copyWith(effect: null);
}
