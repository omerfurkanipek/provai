import 'dart:convert';

import 'package:provai/data/services/local_storage_service.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/repositories/profile_repository.dart';
import 'package:provai/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository_impl.g.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._storage);

  final LocalStorageService _storage;

  @override
  UserProfile? getProfile() {
    final raw = _storage.getString(StorageKeys.userProfile);
    if (raw == null) return null;
    try {
      return UserProfile.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } on Object catch (error) {
      // Bozuk kayıt uygulamayı kilitlemesin; kullanıcı onboarding'e döner.
      appLogger.w('Profil okunamadı', error: error);
      return null;
    }
  }

  @override
  Future<void> saveProfile(UserProfile profile) =>
      _storage.setString(StorageKeys.userProfile, jsonEncode(profile.toJson()));

  @override
  bool get isOnboardingCompleted =>
      _storage.getBool(StorageKeys.onboardingCompleted) ?? false;

  @override
  Future<void> completeOnboarding(UserProfile profile) async {
    await saveProfile(profile);
    await _storage.setBool(StorageKeys.onboardingCompleted, value: true);
  }

  @override
  Future<void> reset() => _storage.clear();
}

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) =>
    ProfileRepositoryImpl(ref.watch(localStorageServiceProvider));
