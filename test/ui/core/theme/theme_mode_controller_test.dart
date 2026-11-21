import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provai/data/services/local_storage_service.dart';
import 'package:provai/ui/core/theme/theme_mode_controller.dart';

class _MockStorage extends Mock implements LocalStorageService;

void main() {
  late _MockStorage storage;

  ProviderContainer makeContainer() {
    final container = ProviderContainer(
      overrides: [localStorageServiceProvider.overrideWithValue(storage)],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUp(() {
    storage = _MockStorage();
    when(() => storage.setString(any(), any())).thenAnswer((_) async {});
  });

  test('kayıtlı tercih yoksa sistem temasını kullanır', () {
    when(() => storage.getString(StorageKeys.themeMode)).thenReturn(null);

    expect(makeContainer().read(themeModeControllerProvider), ThemeMode.system);
  });

  test('kayıtlı tercihi okur', () {
    when(() => storage.getString(StorageKeys.themeMode)).thenReturn('dark');

    expect(makeContainer().read(themeModeControllerProvider), ThemeMode.dark);
  });

  test('bilinmeyen değer sistem temasına düşer', () {
    when(() => storage.getString(StorageKeys.themeMode)).thenReturn('neon');

    expect(makeContainer().read(themeModeControllerProvider), ThemeMode.system);
  });

  test("seçimi state'e yazar ve saklar", () async {
    when(() => storage.getString(StorageKeys.themeMode)).thenReturn(null);
    final container = makeContainer();

    await container
        .read(themeModeControllerProvider.notifier)
        .select(ThemeMode.light);

    expect(container.read(themeModeControllerProvider), ThemeMode.light);
    verify(() => storage.setString(StorageKeys.themeMode, 'light')).called(1);
  });
}
