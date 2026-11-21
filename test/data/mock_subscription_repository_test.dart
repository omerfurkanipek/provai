import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/data/services/local_storage_service.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/utils/app_exception.dart';
import 'package:provai/utils/result.dart';

/// Bellekte çalışan depolama: mock'un yazdığını sonraki okumada geri verir.
class _MemoryStorage extends Mock implements LocalStorageService {
  final values = <String, Object>{};

  @override
  String? getString(String key) => values[key] as String?;

  @override
  int? getInt(String key) => values[key] as int?;

  @override
  Future<void> setString(String key, String value) async => values[key] = value;

  @override
  Future<void> setInt(String key, int value) async => values[key] = value;
}

void main() {
  late MockSubscriptionRepository repository;

  setUp(() => repository = MockSubscriptionRepository(_MemoryStorage()));
  tearDown(() => repository.dispose());

  final yearly = MockSubscriptionRepository.plans.firstWhere(
    (p) => p.period == PlanPeriod.yearly,
  );
  final weekly = MockSubscriptionRepository.plans.firstWhere(
    (p) => p.period == PlanPeriod.weekly,
  );

  test('yıllık plan satın alınamaz, Pro açılmaz', () async {
    final result = await repository.purchase(yearly);

    expect(result, isA<Failure<SubscriptionStatus>>());
    expect((result as Failure).error, isA<PurchaseFailedException>());
    expect(repository.currentStatus.isPro, isFalse);
  });

  test('haftalık plan satın alınır ve Pro açılır', () async {
    final result = await repository.purchase(weekly);

    expect(result, isA<Success<SubscriptionStatus>>());
    expect(repository.currentStatus.isPro, isTrue);
    expect(repository.currentStatus.period, PlanPeriod.weekly);
  });

  test('geri yükle yalnızca önceki satın alımı bulur', () async {
    final before = await repository.restore();
    expect((before as Success<SubscriptionStatus>).data.isPro, isFalse);

    await repository.purchase(weekly);
    final after = await repository.restore();
    expect((after as Success<SubscriptionStatus>).data.isPro, isTrue);
  });
}
