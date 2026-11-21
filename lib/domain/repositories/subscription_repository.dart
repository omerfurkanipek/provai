import 'package:provai/domain/models/subscription.dart';
import 'package:provai/utils/result.dart';

/// Abonelik işlemleri. Aktif implementasyon mock'tur (brief statik paywall istiyor);
/// prod'da RevenueCat implementasyonu bu arayüze takılır, UI değişmez.
abstract interface class SubscriptionRepository {
  SubscriptionStatus get currentStatus;
  Stream<SubscriptionStatus> watchStatus();

  Future<Result<List<SubscriptionPlan>>> fetchPlans();
  Future<Result<SubscriptionStatus>> purchase(SubscriptionPlan plan);

  /// Önceki satın alımı geri yükler. Bulunamazsa `isPro: false` döner.
  Future<Result<SubscriptionStatus>> restore();
}
