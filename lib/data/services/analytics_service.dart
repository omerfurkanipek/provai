import 'package:provai/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_service.g.dart';

/// Analytics facade'ı. ViewModel'ler SDK'lara doğrudan dokunmaz, yalnızca bunu
/// çağırır. Şu an log'a yazar; Firebase/Amplitude eklemek yeni bir
/// implementasyon ve provider değişikliğidir.
abstract interface class AnalyticsService {
  void track(String event, [Map<String, Object?> properties = const {}]);
}

class DebugAnalyticsService implements AnalyticsService {
  const DebugAnalyticsService();

  @override
  void track(String event, [Map<String, Object?> properties = const {}]) {
    appLogger.d('[analytics] $event $properties');
  }
}

/// Dönüşüm hunisi event adları (snake_case, analytics panellerine uygun).
abstract final class AnalyticsEvents {
  static const onboardingStepViewed = 'onboarding_step_viewed';
  static const onboardingCompleted = 'onboarding_completed';
  static const paywallViewed = 'paywall_viewed';
  static const paywallPlanSelected = 'paywall_plan_selected';
  static const purchaseTapped = 'purchase_tapped';
  static const purchaseCompleted = 'purchase_completed';
  static const restoreTapped = 'restore_tapped';
  static const paywallDismissed = 'paywall_dismissed';
}

@Riverpod(keepAlive: true)
AnalyticsService analyticsService(Ref ref) => const DebugAnalyticsService();
