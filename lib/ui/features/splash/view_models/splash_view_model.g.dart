// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Açılışta nereye gidileceğine karar verir. Marka ekranı en az [minDuration]
/// görünür; kısa bir an titreyip kaybolmasın diye.

@ProviderFor(SplashViewModel)
final splashViewModelProvider = SplashViewModelProvider._();

/// Açılışta nereye gidileceğine karar verir. Marka ekranı en az [minDuration]
/// görünür; kısa bir an titreyip kaybolmasın diye.
final class SplashViewModelProvider
    extends $AsyncNotifierProvider<SplashViewModel, SplashDestination> {
  /// Açılışta nereye gidileceğine karar verir. Marka ekranı en az [minDuration]
  /// görünür; kısa bir an titreyip kaybolmasın diye.
  SplashViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashViewModelHash();

  @$internal
  @override
  SplashViewModel create() => SplashViewModel();
}

String _$splashViewModelHash() => r'7c120b63167405a8f919cce41cc7aa1ce8520b2f';

/// Açılışta nereye gidileceğine karar verir. Marka ekranı en az [minDuration]
/// görünür; kısa bir an titreyip kaybolmasın diye.

abstract class _$SplashViewModel extends $AsyncNotifier<SplashDestination> {
  FutureOr<SplashDestination> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SplashDestination>, SplashDestination>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SplashDestination>, SplashDestination>,
              AsyncValue<SplashDestination>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
