import 'package:provai/domain/models/user_profile.dart';

/// Kullanıcı profili ve onboarding durumu.
abstract interface class ProfileRepository {
  UserProfile? getProfile();
  Future<void> saveProfile(UserProfile profile);

  bool get isOnboardingCompleted;
  Future<void> completeOnboarding(UserProfile profile);

  /// Profil, onboarding durumu ve yerel verileri siler (Profil > Verilerimi sıfırla).
  Future<void> reset();
}
