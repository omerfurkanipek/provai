import 'dart:async';

import 'package:provai/data/services/local_storage_service.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/domain/repositories/subscription_repository.dart';
import 'package:provai/utils/app_exception.dart';
import 'package:provai/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mock_subscription_repository.g.dart';

/// Mağaza bağlantısı olmayan demo: planlar sabit, satın alma her zaman başarısız
/// döner (brief statik paywall istiyor). "Geri yükle" yerelde kayıtlı bir satın alım
/// arar; demo'da böyle bir kayıt oluşmadığı için "bulunamadı" sonucu verir.
class MockSubscriptionRepository implements SubscriptionRepository {
  MockSubscriptionRepository(this._storage) : _status = _read(_storage);

  /// Sabit planlar. Prod'da mağazadan (RevenueCat offerings) gelir.
  static const plans = [
    SubscriptionPlan(
      id: 'provai_pro_yearly',
      period: PlanPeriod.yearly,
      price: 1499.99,
      currencyCode: 'TRY',
      trialDays: 3,
    ),
    SubscriptionPlan(
      id: 'provai_pro_weekly',
      period: PlanPeriod.weekly,
      price: 149.99,
      currencyCode: 'TRY',
    ),
  ];

  /// Ağ gecikmesini hissettirmek için; anında dönen satın alma gerçekçi görünmez.
  static const _latency = Duration(milliseconds: 1200);

  final LocalStorageService _storage;
  final _controller = StreamController<SubscriptionStatus>.broadcast();
  SubscriptionStatus _status;

  @override
  SubscriptionStatus get currentStatus => _status;

  @override
  Stream<SubscriptionStatus> watchStatus() => _controller.stream;

  @override
  Future<Result<List<SubscriptionPlan>>> fetchPlans() async =>
      const Success(plans);

  /// Brief statik paywall istiyor: satın alma gerçekleşmez. Gecikmeden sonra
  /// mağazanın işlemi tamamlamadığı durum döner; UI bunu yerel uyarı penceresiyle
  /// gösterir. Prod'da RevenueCat `Purchases.purchasePackage` buraya gelir.
  @override
  Future<Result<SubscriptionStatus>> purchase(SubscriptionPlan plan) async {
    await Future<void>.delayed(_latency);
    return const Failure(
      PurchaseFailedException('Store is not connected in the demo build'),
    );
  }

  @override
  Future<Result<SubscriptionStatus>> restore() async {
    await Future<void>.delayed(_latency);
    _emit(_read(_storage));
    return Success(_status);
  }

  void _emit(SubscriptionStatus status) {
    _status = status;
    _controller.add(status);
  }

  void dispose() => unawaited(_controller.close());

  static SubscriptionStatus _read(LocalStorageService storage) {
    final planId = storage.getString(StorageKeys.purchasedPlanId);
    final plan = plans.where((p) => p.id == planId).firstOrNull;
    if (plan == null) return const SubscriptionStatus();
    final renewsAtMs = storage.getInt(StorageKeys.subscriptionRenewsAt);
    final renewsAt = renewsAtMs == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(renewsAtMs);
    return SubscriptionStatus(
      isPro: true,
      period: plan.period,
      renewsAt: renewsAt,
      isInTrial: plan.hasTrial,
    );
  }
}

@Riverpod(keepAlive: true)
SubscriptionRepository subscriptionRepository(Ref ref) {
  final repository = MockSubscriptionRepository(
    ref.watch(localStorageServiceProvider),
  );
  ref.onDispose(repository.dispose);
  return repository;
}

/// Uygulama genelinde abonelik durumu. Satın alma/geri yükleme sonrası güncellenir.
@Riverpod(keepAlive: true)
Stream<SubscriptionStatus> subscriptionStatus(Ref ref) async* {
  final repository = ref.watch(subscriptionRepositoryProvider);
  yield repository.currentStatus;
  yield* repository.watchStatus();
}
