import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/data/services/analytics_service.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/domain/repositories/profile_repository.dart';
import 'package:provai/domain/repositories/subscription_repository.dart';
import 'package:provai/ui/features/paywall/views/paywall_screen.dart';
import 'package:provai/utils/result.dart';

import '../../../helpers/pump_app.dart';

class _MockSubscriptions extends Mock implements SubscriptionRepository;

class _MockProfiles extends Mock implements ProfileRepository;

void main() {
  late _MockSubscriptions subscriptions;
  late _MockProfiles profiles;

  setUp(() {
    subscriptions = _MockSubscriptions();
    profiles = _MockProfiles();
    when(profiles.getProfile).thenReturn(null);
    when(
      subscriptions.fetchPlans,
    ).thenAnswer((_) async => const Success(MockSubscriptionRepository.plans));
    when(() => subscriptions.currentStatus)
        .thenReturn(const SubscriptionStatus());
  });

  Future<void> pumpPaywall(
    WidgetTester tester,
    PaywallPlacement placement,
  ) async {
    await tester.pumpApp(
      PaywallScreen(placement: placement),
      overrides: [
        subscriptionRepositoryProvider.overrideWithValue(subscriptions),
        profileRepositoryProvider.overrideWithValue(profiles),
        analyticsServiceProvider.overrideWithValue(
          const DebugAnalyticsService(),
        ),
      ],
    );
    // Planların yüklenmesi ve giriş animasyonları.
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
  }

  testWidgets("brief'in istediği tüm paywall öğeleri görünür", (tester) async {
    await pumpPaywall(tester, PaywallPlacement.freeLimit);

    expect(find.text('Yıllık'), findsOneWidget);
    expect(find.text('Haftalık'), findsOneWidget);
    expect(find.textContaining('₺1.499,99'), findsOneWidget);
    expect(find.textContaining('₺149,99'), findsOneWidget);
    expect(find.text('%80 tasarruf'), findsOneWidget);
    expect(find.text('Ücretsiz denemeyi başlat'), findsOneWidget); // satın al
    expect(find.text('Geri yükle'), findsOneWidget);
    expect(find.text('Kullanım Koşulları'), findsOneWidget);
    expect(find.text('Gizlilik'), findsOneWidget);
    // "Önce ücretsiz dene" yalnızca onboarding paywall'ında.
    expect(find.text('Önce ücretsiz dene'), findsNothing);
  });

  testWidgets('haftalık plan seçilince buton metni değişir', (tester) async {
    await pumpPaywall(tester, PaywallPlacement.freeLimit);

    await tester.ensureVisible(find.text('Haftalık'));
    await tester.tap(find.text('Haftalık'));
    await tester.pump();

    expect(find.text('Haftalık planla devam et'), findsOneWidget);
    expect(find.text('Ücretsiz denemeyi başlat'), findsNothing);
  });

  testWidgets("onboarding paywall'ında ücretsiz deneme seçeneği vardır", (
    tester,
  ) async {
    await pumpPaywall(tester, PaywallPlacement.onboarding);

    expect(find.text('Önce ücretsiz dene'), findsOneWidget);
  });
}
