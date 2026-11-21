// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(interviewRepository)
final interviewRepositoryProvider = InterviewRepositoryProvider._();

final class InterviewRepositoryProvider
    extends
        $FunctionalProvider<
          InterviewRepository,
          InterviewRepository,
          InterviewRepository
        >
    with $Provider<InterviewRepository> {
  InterviewRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'interviewRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$interviewRepositoryHash();

  @$internal
  @override
  $ProviderElement<InterviewRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InterviewRepository create(Ref ref) {
    return interviewRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InterviewRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InterviewRepository>(value),
    );
  }
}

String _$interviewRepositoryHash() =>
    r'3e770e4b893c6b3d7446bf3e142a3512449e7f03';
