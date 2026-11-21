import 'dart:async';

import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/data/services/analytics_service.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/ui/features/paywall/view_models/paywall_state.dart';
import 'package:provai/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paywall_view_model.g.dart';

@riverpod
class PaywallViewModel extends _$PaywallViewModel {
  @override
  PaywallState build(PaywallPlacement placement) {
    ref.read(analyticsServiceProvider).track(AnalyticsEvents.paywallViewed, {
      'placement': placement.name,
    });
    unawaited(_loadPlans());
    return PaywallState(
      placement: placement,
      profile: ref.read(profileRepositoryProvider).getProfile(),
    );
  }

  Future<void> _loadPlans() async {
    final result = await ref.read(subscriptionRepositoryProvider).fetchPlans();
    if (!ref.mounted) return;
    switch (result) {
      case Success(:final data):
        // Varsayılan seçim: deneme süreli plan (dönüşümde en güçlü seçenek).
        final preferred =
            data.where((p) => p.hasTrial).firstOrNull ?? data.first;
        state = state.copyWith(plans: data, selectedPlanId: preferred.id);
      case Failure():
        state = state.copyWith(effect: const PaywallEffect.failed());
    }
  }

  void selectPlan(String planId) {
    if (state.isBusy) return;
    state = state.copyWith(selectedPlanId: planId);
    _track(AnalyticsEvents.paywallPlanSelected, {'plan': planId});
  }

  Future<void> purchase() async {
    final plan = state.selectedPlan;
    if (plan == null || state.isBusy) return;
    _track(AnalyticsEvents.purchaseTapped, {'plan': plan.id});
    state = state.copyWith(isPurchasing: true);

    final result = await ref
        .read(subscriptionRepositoryProvider)
        .purchase(plan);
    if (!ref.mounted) return;
    state = switch (result) {
      Success() => state.copyWith(
        isPurchasing: false,
        effect: const PaywallEffect.unlocked(),
      ),
      Failure() => state.copyWith(
        isPurchasing: false,
        effect: const PaywallEffect.failed(),
      ),
    };
    if (result is Success) {
      _track(AnalyticsEvents.purchaseCompleted, {'plan': plan.id});
    }
  }

  Future<void> restore() async {
    if (state.isBusy) return;
    _track(AnalyticsEvents.restoreTapped);
    state = state.copyWith(isRestoring: true);

    final result = await ref.read(subscriptionRepositoryProvider).restore();
    if (!ref.mounted) return;
    state = state.copyWith(
      isRestoring: false,
      effect: switch (result) {
        Success(:final data) when data.isPro => const PaywallEffect.unlocked(),
        Success() => const PaywallEffect.nothingToRestore(),
        Failure() => const PaywallEffect.failed(),
      },
    );
  }

  void dismiss() {
    if (state.isBusy) return;
    _track(AnalyticsEvents.paywallDismissed);
    state = state.copyWith(effect: const PaywallEffect.dismissed());
  }

  void consumeEffect() => state = state.copyWith(effect: null);

  void _track(String event, [Map<String, Object?> props = const {}]) {
    ref.read(analyticsServiceProvider).track(event, {
      'placement': state.placement.name,
      ...props,
    });
  }
}
