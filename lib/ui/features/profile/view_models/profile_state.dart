import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/repositories/interview_repository.dart';

part 'profile_state.freezed.dart';

@freezed
sealed class ProfileEffect with _$ProfileEffect {
  const factory ProfileEffect.restored({required bool found}) =
      ProfileEffectRestored;
  const factory ProfileEffect.updated() = ProfileEffectUpdated;
}

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    required UserProfile profile,
    required SubscriptionStatus subscription,
    required int startedSessions,
    required int completedSessions,
    int? averageScore,
    @Default('') String version,
    @Default(false) bool isRestoring,
    ProfileEffect? effect,
  }) = _ProfileState;

  const ProfileState._();

  int get freeSessionsLeft =>
      (FreeTier.sessions - startedSessions).clamp(0, FreeTier.sessions);
}
