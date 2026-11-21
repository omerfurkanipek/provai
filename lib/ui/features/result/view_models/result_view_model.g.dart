// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ResultViewModel)
final resultViewModelProvider = ResultViewModelFamily._();

final class ResultViewModelProvider
    extends $NotifierProvider<ResultViewModel, ResultState> {
  ResultViewModelProvider._({
    required ResultViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'resultViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$resultViewModelHash();

  @override
  String toString() {
    return r'resultViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ResultViewModel create() => ResultViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResultState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResultState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ResultViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$resultViewModelHash() => r'20f430219d66d5fd9dadaa7f6bfa008c71942d36';

final class ResultViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ResultViewModel,
          ResultState,
          ResultState,
          ResultState,
          String
        > {
  ResultViewModelFamily._()
    : super(
        retry: null,
        name: r'resultViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ResultViewModelProvider call(String sessionId) =>
      ResultViewModelProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'resultViewModelProvider';
}

abstract class _$ResultViewModel extends $Notifier<ResultState> {
  late final _$args = ref.$arg as String;
  String get sessionId => _$args;

  ResultState build(String sessionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ResultState, ResultState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ResultState, ResultState>,
              ResultState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
