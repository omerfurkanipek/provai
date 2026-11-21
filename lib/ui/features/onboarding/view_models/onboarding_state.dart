import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provai/domain/models/user_profile.dart';

part 'onboarding_state.freezed.dart';

/// Onboarding adımları sırasıyla. İlk ikisi değer anlatımı, sonra kişiselleştirme
/// soruları, en sonda "planın hazırlanıyor" geçişi.
enum OnboardingStep {
  valueStory,
  valueHow,
  name,
  role,
  seniority,
  language,
  struggle,
  timing,
  preparing;

  bool get isIntro => this == valueStory || this == valueHow;
  bool get isQuestion => !isIntro && this != preparing;

  /// Soru adımları içindeki sıra (ilerleme çubuğu için, 1'den başlar).
  int get questionNumber => index - OnboardingStep.name.index + 1;
  static int get questionCount => timing.index - name.index + 1;
}

@freezed
sealed class OnboardingEffect with _$OnboardingEffect {
  /// Profil kaydedildi; onboarding paywall'ına geçilecek.
  const factory OnboardingEffect.finished() = OnboardingEffectFinished;
}

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(OnboardingStep.valueStory) OnboardingStep step,
    @Default(UserProfile()) UserProfile profile,
    OnboardingEffect? effect,
  }) = _OnboardingState;

  const OnboardingState._();

  /// Pozisyon boş geçilemez; AI soruları ona göre üretir. Diğer adımlarda
  /// her zaman seçili bir değer olduğu için devam edilebilir.
  bool get canContinue => switch (step) {
    OnboardingStep.role => profile.targetRole.trim().isNotEmpty,
    OnboardingStep.preparing => false,
    _ => true,
  };
}
