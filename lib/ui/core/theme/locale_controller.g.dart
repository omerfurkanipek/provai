// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Uygulama dili: null = cihaz dili. Profil'den Türkçe veya İngilizce seçilebilir.

@ProviderFor(LocaleController)
final localeControllerProvider = LocaleControllerProvider._();

/// Uygulama dili: null = cihaz dili. Profil'den Türkçe veya İngilizce seçilebilir.
final class LocaleControllerProvider
    extends $NotifierProvider<LocaleController, Locale?> {
  /// Uygulama dili: null = cihaz dili. Profil'den Türkçe veya İngilizce seçilebilir.
  LocaleControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeControllerHash();

  @$internal
  @override
  LocaleController create() => LocaleController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale?>(value),
    );
  }
}

String _$localeControllerHash() => r'40bf78a1a7bd1c5027c72706a9d13631cf4533d0';

/// Uygulama dili: null = cihaz dili. Profil'den Türkçe veya İngilizce seçilebilir.

abstract class _$LocaleController extends $Notifier<Locale?> {
  Locale? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Locale?, Locale?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale?, Locale?>,
              Locale?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
