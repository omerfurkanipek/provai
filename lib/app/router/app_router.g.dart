// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Uygulama router'ı. Yönlendirme kararı (onboarding mi, home mu) Splash
/// ViewModel'inde verilir; burada yalnızca route tablosu tanımlanır.

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

/// Uygulama router'ı. Yönlendirme kararı (onboarding mi, home mu) Splash
/// ViewModel'inde verilir; burada yalnızca route tablosu tanımlanır.

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Uygulama router'ı. Yönlendirme kararı (onboarding mi, home mu) Splash
  /// ViewModel'inde verilir; burada yalnızca route tablosu tanımlanır.
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'dde3faebf60b36fd92ec518106420efa1e1cb53f';
