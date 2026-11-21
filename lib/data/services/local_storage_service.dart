import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_service.g.dart';

/// Basit anahtar-değer saklama. Önbellekli instance bootstrap'te oluşturulur,
/// böylece okumalar senkron yapılabilir (ilk karede tema/onboarding kararı için).
class LocalStorageService {
  const LocalStorageService(this._prefs);

  final SharedPreferencesWithCache _prefs;

  String? getString(String key) => _prefs.getString(key);
  Future<void> setString(String key, String value) =>
      _prefs.setString(key, value);

  bool? getBool(String key) => _prefs.getBool(key);
  Future<void> setBool(String key, {required bool value}) =>
      _prefs.setBool(key, value);

  int? getInt(String key) => _prefs.getInt(key);
  Future<void> setInt(String key, int value) => _prefs.setInt(key, value);

  Future<void> remove(String key) => _prefs.remove(key);
  Future<void> clear() => _prefs.clear();
}

/// Bootstrap'te `overrideWithValue` ile gerçek instance verilir.
@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) =>
    throw UnimplementedError('bootstrap içinde override edilmeli');

/// Saklanan anahtarlar tek yerde.
abstract final class StorageKeys {
  static const themeMode = 'theme_mode';
}
