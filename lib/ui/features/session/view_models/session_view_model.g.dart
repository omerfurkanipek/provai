// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SessionViewModel)
final sessionViewModelProvider = SessionViewModelFamily._();

final class SessionViewModelProvider
    extends $NotifierProvider<SessionViewModel, SessionState> {
  SessionViewModelProvider._({
    required SessionViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionViewModelHash();

  @override
  String toString() {
    return r'sessionViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SessionViewModel create() => SessionViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SessionViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionViewModelHash() => r'f97be0bdb4e8ed898f5f945329cb3520845490f9';

final class SessionViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          SessionViewModel,
          SessionState,
          SessionState,
          SessionState,
          String
        > {
  SessionViewModelFamily._()
    : super(
        retry: null,
        name: r'sessionViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionViewModelProvider call(String sessionId) =>
      SessionViewModelProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'sessionViewModelProvider';
}

abstract class _$SessionViewModel extends $Notifier<SessionState> {
  late final _$args = ref.$arg as String;
  String get sessionId => _$args;

  SessionState build(String sessionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SessionState, SessionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SessionState, SessionState>,
              SessionState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
