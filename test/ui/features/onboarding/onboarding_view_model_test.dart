import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/data/services/analytics_service.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/repositories/profile_repository.dart';
import 'package:provai/ui/features/onboarding/view_models/onboarding_state.dart';
import 'package:provai/ui/features/onboarding/view_models/onboarding_view_model.dart';

class _MockProfileRepository extends Mock implements ProfileRepository;

void main() {
  late _MockProfileRepository repository;
  late ProviderContainer container;

  setUpAll(() => registerFallbackValue(const UserProfile()));

  setUp(() {
    repository = _MockProfileRepository();
    when(() => repository.getProfile()).thenReturn(null);
    when(() => repository.completeOnboarding(any())).thenAnswer((_) async {});
    when(() => repository.saveProfile(any())).thenAnswer((_) async {});
    container = ProviderContainer(
      overrides: [
        profileRepositoryProvider.overrideWithValue(repository),
        analyticsServiceProvider.overrideWithValue(
          const DebugAnalyticsService(),
        ),
      ],
    );
    addTearDown(container.dispose);
    // autoDispose provider'ı test boyunca canlı tut.
    container.listen(onboardingViewModelProvider, (_, _) {});
  });

  OnboardingViewModel vm() =>
      container.read(onboardingViewModelProvider.notifier);
  OnboardingState state() => container.read(onboardingViewModelProvider);

  test('ilk adımda geri gidilemez, sistem geri tuşuna bırakılır', () {
    expect(vm().back(), isFalse);
    expect(state().step, OnboardingStep.valueStory);
  });

  test('atla, değer sayfalarını geçip ilk soruya gider', () {
    vm().skipIntro();
    expect(state().step, OnboardingStep.name);
  });

  test('pozisyon boşken devam edilemez', () {
    vm()
      ..skipIntro()
      ..next(); // name -> role
    expect(state().step, OnboardingStep.role);
    expect(state().canContinue, isFalse);

    vm()
      ..setRole('   ')
      ..next();
    expect(state().step, OnboardingStep.role);

    vm()
      ..setRole('  Flutter Developer ')
      ..next();
    expect(state().step, OnboardingStep.seniority);
    expect(state().profile.targetRole, 'Flutter Developer');
  });

  test(
    'son sorudan sonra profili kaydeder ve finished effect üretir',
    () async {
      vm()
        ..skipIntro()
        ..setName('Ömer')
        ..next()
        ..setRole('Flutter Developer')
        ..next()
        ..setSeniority(Seniority.mid)
        ..next()
        ..setLanguage(InterviewLanguage.en)
        ..next()
        ..setStruggle(Struggle.behavioral)
        ..next()
        ..setTiming(InterviewTiming.thisWeek)
        ..next();

      expect(state().step, OnboardingStep.preparing);
      expect(vm().back(), isFalse, reason: 'hazırlanırken geri gidilmez');

      await Future<void>.delayed(
        OnboardingViewModel.preparingDuration +
            const Duration(milliseconds: 50),
      );

      expect(state().effect, const OnboardingEffect.finished());
      verify(
        () => repository.completeOnboarding(
          const UserProfile(
            name: 'Ömer',
            targetRole: 'Flutter Developer',
            seniority: Seniority.mid,
            interviewLanguage: InterviewLanguage.en,
            struggle: Struggle.behavioral,
            interviewTiming: InterviewTiming.thisWeek,
          ),
        ),
      ).called(1);
    },
  );
}
