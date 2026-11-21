import 'package:provai/data/repositories/interview_repository_impl.dart';
import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/repositories/interview_repository.dart';
import 'package:provai/ui/features/result/view_models/result_state.dart';
import 'package:provai/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_view_model.g.dart';

@riverpod
class ResultViewModel extends _$ResultViewModel {
  @override
  ResultState build(String sessionId) => ResultState(
    session: ref.read(interviewRepositoryProvider).getSession(sessionId),
  );

  /// Aynı ilan ve dil ile yeni bir prova üretir. Hak yoksa paywall.
  Future<void> retry() async {
    final session = state.session;
    if (session == null || state.isRetrying) return;

    final interviews = ref.read(interviewRepositoryProvider);
    final isPro = ref.read(subscriptionRepositoryProvider).currentStatus.isPro;
    if (!isPro && interviews.startedSessionCount >= FreeTier.sessions) {
      state = state.copyWith(effect: const ResultEffect.openPaywall());
      return;
    }

    state = state.copyWith(isRetrying: true);
    final profile =
        ref.read(profileRepositoryProvider).getProfile() ?? const UserProfile();
    final result = await interviews.createSession(
      profile: profile,
      jobPosting: session.jobPosting,
      questionCount: session.questions.length,
      language: session.language,
    );
    if (!ref.mounted) return;
    state = switch (result) {
      Success(:final data) => state.copyWith(
        isRetrying: false,
        effect: ResultEffect.openSession(data.id),
      ),
      Failure(:final error) => state.copyWith(
        isRetrying: false,
        effect: ResultEffect.showError(error),
      ),
    };
  }

  void consumeEffect() => state = state.copyWith(effect: null);
}
