import 'package:material_ui/material_ui.dart';
import 'package:provai/data/services/local_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_controller.g.dart';

/// Uygulama dili: null = cihaz dili. Profil'den Türkçe veya İngilizce seçilebilir.
@Riverpod(keepAlive: true)
class LocaleController extends _$LocaleController {
  static const supported = ['tr', 'en'];

  @override
  Locale? build() {
    final saved = ref
        .watch(localStorageServiceProvider)
        .getString(StorageKeys.appLocale);
    return supported.contains(saved) ? Locale(saved!) : null;
  }

  Future<void> select(Locale? locale) async {
    state = locale;
    final storage = ref.read(localStorageServiceProvider);
    if (locale == null) {
      await storage.remove(StorageKeys.appLocale);
    } else {
      await storage.setString(StorageKeys.appLocale, locale.languageCode);
    }
  }
}
