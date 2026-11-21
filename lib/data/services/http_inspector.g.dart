// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_inspector.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Debug build'e özel HTTP inspector (Android'deki Chucker'ın Flutter karşılığı).
/// Edge Function istek ve cevaplarını uygulama içinde gösterir: yüzen balona
/// dokunarak, telefonu sallayarak ya da Profil > "Ağ istekleri" ile açılır.
/// Release build'de null döner; hiçbir istek kaydedilmez.

@ProviderFor(httpInspector)
final httpInspectorProvider = HttpInspectorProvider._();

/// Debug build'e özel HTTP inspector (Android'deki Chucker'ın Flutter karşılığı).
/// Edge Function istek ve cevaplarını uygulama içinde gösterir: yüzen balona
/// dokunarak, telefonu sallayarak ya da Profil > "Ağ istekleri" ile açılır.
/// Release build'de null döner; hiçbir istek kaydedilmez.

final class HttpInspectorProvider
    extends $FunctionalProvider<Alice?, Alice?, Alice?>
    with $Provider<Alice?> {
  /// Debug build'e özel HTTP inspector (Android'deki Chucker'ın Flutter karşılığı).
  /// Edge Function istek ve cevaplarını uygulama içinde gösterir: yüzen balona
  /// dokunarak, telefonu sallayarak ya da Profil > "Ağ istekleri" ile açılır.
  /// Release build'de null döner; hiçbir istek kaydedilmez.
  HttpInspectorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpInspectorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpInspectorHash();

  @$internal
  @override
  $ProviderElement<Alice?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Alice? create(Ref ref) {
    return httpInspector(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Alice? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Alice?>(value),
    );
  }
}

String _$httpInspectorHash() => r'eb3914b7b347afdfb9b7826900028e7c76ef9988';
