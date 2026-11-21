import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:provai/data/repositories/interview_repository_impl.dart';
import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/data/services/auth_service.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/ui/core/theme/locale_controller.dart';
import 'package:provai/ui/core/theme/theme_mode_controller.dart';
import 'package:provai/ui/features/profile/view_models/profile_state.dart';
import 'package:provai/utils/logger.dart';
import 'package:provai/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_view_model.g.dart';

@riverpod
class ProfileViewModel extends _$ProfileViewModel {
  @override
  ProfileState build() {
    final subscription =
        ref.watch(subscriptionStatusProvider).value ??
        ref.read(subscriptionRepositoryProvider).currentStatus;
    final interviews = ref.read(interviewRepositoryProvider);
    final completed = interviews
        .getSessions()
        .where((s) => s.isCompleted)
        .toList();
    final scores = [for (final s in completed) ?s.overallScore];
    unawaited(_loadVersion());

    return ProfileState(
      profile:
          ref.read(profileRepositoryProvider).getProfile() ??
          const UserProfile(),
      subscription: subscription,
      startedSessions: interviews.startedSessionCount,
      completedSessions: completed.length,
      averageScore: scores.isEmpty
          ? null
          : (scores.reduce((a, b) => a + b) / scores.length).round(),
    );
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    if (!ref.mounted) return;
    state = state.copyWith(version: info.version);
  }

  Future<void> updateProfile(UserProfile profile) async {
    final cleaned = profile.copyWith(
      name: profile.name.trim(),
      targetRole: profile.targetRole.trim().isEmpty
          ? state.profile.targetRole
          : profile.targetRole.trim(),
    );
    await ref.read(profileRepositoryProvider).saveProfile(cleaned);
    if (!ref.mounted) return;
    state = state.copyWith(
      profile: cleaned,
      effect: const ProfileEffect.updated(),
    );
  }

  Future<void> restore() async {
    if (state.isRestoring) return;
    state = state.copyWith(isRestoring: true);
    final result = await ref.read(subscriptionRepositoryProvider).restore();
    if (!ref.mounted) return;
    state = state.copyWith(
      isRestoring: false,
      effect: ProfileEffect.restored(
        found: result is Success<SubscriptionStatus> && result.data.isPro,
      ),
    );
  }

  /// Cihazdaki tüm verileri siler ve anonim oturumu kapatır. Bitince ekran
  /// uygulamayı baştan başlatır (provider'lar yeniden kurulduğu için effect yok).
  Future<void> resetData() async {
    await ref.read(profileRepositoryProvider).reset();
    try {
      await ref.read(authServiceProvider).signOut();
    } on Object catch (error) {
      // Çevrimdışıysa yerel veriler yine de silinmiş olur.
      appLogger.w('Oturum kapatılamadı', error: error);
    }
    // Saklanan değerleri okuyan provider'lar yeniden kurulsun.
    ref
      ..invalidate(subscriptionRepositoryProvider)
      ..invalidate(themeModeControllerProvider)
      ..invalidate(localeControllerProvider);
  }

  void consumeEffect() => state = state.copyWith(effect: null);
}
