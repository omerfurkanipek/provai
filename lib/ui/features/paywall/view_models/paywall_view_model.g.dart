// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paywall_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaywallViewModel)
final paywallViewModelProvider = PaywallViewModelFamily._();

final class PaywallViewModelProvider
    extends $NotifierProvider<PaywallViewModel, PaywallState> {
  PaywallViewModelProvider._({
    required PaywallViewModelFamily super.from,
    required PaywallPlacement super.argument,
  }) : super(
         retry: null,
         name: r'paywallViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paywallViewModelHash();

  @override
  String toString() {
    return r'paywallViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PaywallViewModel create() => PaywallViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaywallState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaywallState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PaywallViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paywallViewModelHash() => r'089d337eef78e34ce091303257fe5194705df2de';

final class PaywallViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          PaywallViewModel,
          PaywallState,
          PaywallState,
          PaywallState,
          PaywallPlacement
        > {
  PaywallViewModelFamily._()
    : super(
        retry: null,
        name: r'paywallViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PaywallViewModelProvider call(PaywallPlacement placement) =>
      PaywallViewModelProvider._(argument: placement, from: this);

  @override
  String toString() => r'paywallViewModelProvider';
}

abstract class _$PaywallViewModel extends $Notifier<PaywallState> {
  late final _$args = ref.$arg as PaywallPlacement;
  PaywallPlacement get placement => _$args;

  PaywallState build(PaywallPlacement placement);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PaywallState, PaywallState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaywallState, PaywallState>,
              PaywallState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
