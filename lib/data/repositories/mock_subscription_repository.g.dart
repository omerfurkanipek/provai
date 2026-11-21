// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mock_subscription_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subscriptionRepository)
final subscriptionRepositoryProvider = SubscriptionRepositoryProvider._();

final class SubscriptionRepositoryProvider
    extends
        $FunctionalProvider<
          SubscriptionRepository,
          SubscriptionRepository,
          SubscriptionRepository
        >
    with $Provider<SubscriptionRepository> {
  SubscriptionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subscriptionRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subscriptionRepositoryHash();

  @$internal
  @override
  $ProviderElement<SubscriptionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubscriptionRepository create(Ref ref) {
    return subscriptionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubscriptionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubscriptionRepository>(value),
    );
  }
}

String _$subscriptionRepositoryHash() =>
    r'e663b9e6ad4e61c7102ce34fc072e574d83a39e9';

/// Uygulama genelinde abonelik durumu. Satın alma/geri yükleme sonrası güncellenir.

@ProviderFor(subscriptionStatus)
final subscriptionStatusProvider = SubscriptionStatusProvider._();

/// Uygulama genelinde abonelik durumu. Satın alma/geri yükleme sonrası güncellenir.

final class SubscriptionStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<SubscriptionStatus>,
          SubscriptionStatus,
          Stream<SubscriptionStatus>
        >
    with
        $FutureModifier<SubscriptionStatus>,
        $StreamProvider<SubscriptionStatus> {
  /// Uygulama genelinde abonelik durumu. Satın alma/geri yükleme sonrası güncellenir.
  SubscriptionStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subscriptionStatusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subscriptionStatusHash();

  @$internal
  @override
  $StreamProviderElement<SubscriptionStatus> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<SubscriptionStatus> create(Ref ref) {
    return subscriptionStatus(ref);
  }
}

String _$subscriptionStatusHash() =>
    r'0fd18a4200c3fa0ae117d3f39d580daea8b4b1c9';
