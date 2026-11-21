import 'dart:async';

import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/data/services/analytics_service.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/ui/features/onboarding/view_models/onboarding_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_view_model.g.dart';

@riverpod
class OnboardingViewModel extends _$OnboardingViewModel {
  /// "Planın hazırlanıyor" ekranının süresi; maddelerin sırayla belirmesine yeter.
  static const preparingDuration = Duration(milliseconds: 2800);

  @override
  OnboardingState build() {
    // Taslak her adımda kaydedilir; yarıda bırakılıp dönülürse cevaplar dolu gelir.
    final saved = ref.read(profileRepositoryProvider).getProfile();
    _trackStep(OnboardingStep.valueStory);
    return OnboardingState(profile: saved ?? const UserProfile());
  }

  void next() {
    if (!state.canContinue) return;
    final nextStep = OnboardingStep.values[state.step.index + 1];
    state = state.copyWith(
      step: nextStep,
      profile: state.profile.copyWith(
        targetRole: state.profile.targetRole.trim(),
        name: state.profile.name.trim(),
      ),
    );
    _trackStep(nextStep);
    if (nextStep == OnboardingStep.preparing) {
      unawaited(_finish());
    } else if (!nextStep.isIntro) {
      unawaited(ref.read(profileRepositoryProvider).saveProfile(state.profile));
    }
  }

  void _trackStep(OnboardingStep step) => ref
      .read(analyticsServiceProvider)
      .track(AnalyticsEvents.onboardingStepViewed, {'step': step.name});

  /// Geri gidilebildiyse true döner; ilk adımda false (sistem geri tuşu çalışsın).
  bool back() {
    if (state.step.index == 0 || state.step == OnboardingStep.preparing) {
      return false;
    }
    state = state.copyWith(step: OnboardingStep.values[state.step.index - 1]);
    return true;
  }

  void skipIntro() => state = state.copyWith(step: OnboardingStep.name);

  void setName(String value) =>
      state = state.copyWith(profile: state.profile.copyWith(name: value));

  void setRole(String value) => state = state.copyWith(
    profile: state.profile.copyWith(targetRole: value),
  );

  void setSeniority(Seniority value) =>
      state = state.copyWith(profile: state.profile.copyWith(seniority: value));

  void setLanguage(InterviewLanguage value) => state = state.copyWith(
    profile: state.profile.copyWith(interviewLanguage: value),
  );

  void setStruggle(Struggle value) =>
      state = state.copyWith(profile: state.profile.copyWith(struggle: value));

  void setTiming(InterviewTiming value) => state = state.copyWith(
    profile: state.profile.copyWith(interviewTiming: value),
  );

  void consumeEffect() => state = state.copyWith(effect: null);

  Future<void> _finish() async {
    final repository = ref.read(profileRepositoryProvider);
    await Future.wait([
      repository.completeOnboarding(state.profile),
      Future<void>.delayed(preparingDuration),
    ]);
    if (!ref.mounted) return;
    ref.read(analyticsServiceProvider).track(
      AnalyticsEvents.onboardingCompleted,
      {
        'role': state.profile.targetRole,
        'seniority': state.profile.seniority.name,
        'language': state.profile.interviewLanguage.name,
      },
    );
    state = state.copyWith(effect: const OnboardingEffect.finished());
  }
}
