import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/domain/models/user_profile.dart';

part 'paywall_state.freezed.dart';

@freezed
sealed class PaywallEffect with _$PaywallEffect {
  /// Satın alma ya da geri yükleme başarılı; paywall kapanır.
  const factory PaywallEffect.unlocked() = PaywallEffectUnlocked;

  /// Kullanıcı satın almadan çıktı.
  const factory PaywallEffect.dismissed() = PaywallEffectDismissed;

  /// Geri yüklenecek satın alım bulunamadı.
  const factory PaywallEffect.nothingToRestore() =
      PaywallEffectNothingToRestore;

  const factory PaywallEffect.failed() = PaywallEffectFailed;
}

@freezed
abstract class PaywallState with _$PaywallState {
  const factory PaywallState({
    required PaywallPlacement placement,
    @Default([]) List<SubscriptionPlan> plans,
    String? selectedPlanId,
    UserProfile? profile,
    @Default(false) bool isPurchasing,
    @Default(false) bool isRestoring,
    PaywallEffect? effect,
  }) = _PaywallState;

  const PaywallState._();

  SubscriptionPlan? get selectedPlan =>
      plans.where((p) => p.id == selectedPlanId).firstOrNull;

  SubscriptionPlan? get weeklyPlan =>
      plans.where((p) => p.period == PlanPeriod.weekly).firstOrNull;

  bool get isBusy => isPurchasing || isRestoring;

  /// Yıllık planın haftalığa göre tasarruf oranı (0–100), aşağı yuvarlanır.
  int savingsPercentFor(SubscriptionPlan plan) {
    final weekly = weeklyPlan;
    if (weekly == null || plan.period == PlanPeriod.weekly) return 0;
    return ((1 - plan.weeklyPrice / weekly.price) * 100).floor();
  }
}
