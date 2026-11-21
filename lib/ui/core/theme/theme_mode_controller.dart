import 'package:material_ui/material_ui.dart';
import 'package:provai/data/services/local_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_controller.g.dart';

/// Tema tercihi: varsayılan sistem teması, profilden açık/koyu seçilebilir.
@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeMode build() {
    final saved = ref
        .watch(localStorageServiceProvider)
        .getString(StorageKeys.themeMode);
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == saved,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> select(ThemeMode mode) async {
    state = mode;
    await ref
        .read(localStorageServiceProvider)
        .setString(StorageKeys.themeMode, mode.name);
  }
}
