import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/data/services/analytics_service.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/domain/repositories/profile_repository.dart';
import 'package:provai/domain/repositories/subscription_repository.dart';
import 'package:provai/ui/features/paywall/view_models/paywall_state.dart';
import 'package:provai/ui/features/paywall/view_models/paywall_view_model.dart';
import 'package:provai/utils/app_exception.dart';
import 'package:provai/utils/result.dart';

class _MockSubscriptionRepository extends Mock
    implements SubscriptionRepository;

class _MockProfileRepository extends Mock implements ProfileRepository;

class _MockAnalytics extends Mock implements AnalyticsService;

void main() {
  late _MockSubscriptionRepository subscriptions;
  late _MockAnalytics analytics;
  late ProviderContainer container;
  const placement = PaywallPlacement.freeLimit;
  final provider = paywallViewModelProvider(placement);
  const yearly = SubscriptionPlan(
    id: 'yearly',
    period: PlanPeriod.yearly,
    price: 1499.99,
    currencyCode: 'TRY',
    trialDays: 3,
  );
  const weekly = SubscriptionPlan(
    id: 'weekly',
    period: PlanPeriod.weekly,
    price: 149.99,
    currencyCode: 'TRY',
  );

  setUpAll(() => registerFallbackValue(yearly));

  setUp(() async {
    subscriptions = _MockSubscriptionRepository();
    analytics = _MockAnalytics();
    final profiles = _MockProfileRepository();
    when(profiles.getProfile).thenReturn(null);
    when(subscriptions.fetchPlans)
        .thenAnswer((_) async => const Success([weekly, yearly]));

    container = ProviderContainer(
      overrides: [
        subscriptionRepositoryProvider.overrideWithValue(subscriptions),
        profileRepositoryProvider.overrideWithValue(profiles),
        analyticsServiceProvider.overrideWithValue(analytics),
      ],
    );
    addTearDown(container.dispose);
    container.listen(provider, (_, _) {});
    await Future<void>.delayed(Duration.zero); // planların yüklenmesini bekle
  });

  PaywallViewModel vm() => container.read(provider.notifier);
  PaywallState state() => container.read(provider);

  test(
    'açılışta görüntülenme event i gönderir ve deneme süreli planı seçer',
    () {
      verify(
        () => analytics.track(AnalyticsEvents.paywallViewed, {
          'placement': placement.name,
        }),
      ).called(1);
      expect(state().selectedPlanId, 'yearly');
    },
  );

  test('yıllık planın tasarruf oranını haftalığa göre hesaplar', () {
    expect(state().savingsPercentFor(yearly), 80);
    expect(state().savingsPercentFor(weekly), 0);
  });

  test('başarılı satın alma unlocked effect üretir', () async {
    when(
      () => subscriptions.purchase(any()),
    ).thenAnswer((_) async => const Success(SubscriptionStatus(isPro: true)));

    final future = vm().purchase();
    expect(state().isPurchasing, isTrue);
    await future;

    expect(state().isPurchasing, isFalse);
    expect(state().effect, const PaywallEffect.unlocked());
    verify(() => subscriptions.purchase(yearly)).called(1);
  });

  test('başarısız satın alma failed effect üretir', () async {
    when(() => subscriptions.purchase(any()))
        .thenAnswer((_) async => const Failure(UnknownException()));

    await vm().purchase();

    expect(state().effect, const PaywallEffect.failed());
  });

  test('geri yüklenecek satın alım yoksa bunu bildirir', () async {
    when(subscriptions.restore)
        .thenAnswer((_) async => const Success(SubscriptionStatus()));

    await vm().restore();

    expect(state().effect, const PaywallEffect.nothingToRestore());
  });

  test('işlem sürerken plan değiştirilemez', () async {
    when(
      () => subscriptions.purchase(any()),
    ).thenAnswer((_) async => const Success(SubscriptionStatus(isPro: true)));

    final future = vm().purchase();
    vm().selectPlan('weekly');
    await future;

    expect(state().selectedPlanId, 'yearly');
  });
}
