import 'package:cupertino_ui/cupertino_ui.dart'
    show GlobalCupertinoLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/app.dart';
import 'package:provai/l10n/gen/app_localizations.dart';
import 'package:provai/ui/core/theme/app_theme.dart';

/// Widget'ı uygulamanın teması ve Türkçe çevirileriyle, verilen provider
/// override'larıyla birlikte pompalar.
extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget child, {
    List<Override> overrides = const [],
    // Mantıksal ekran boyutu; varsayılan orta boy bir Android telefon.
    Size size = const Size(393, 873),
  }) async {
    view
      ..physicalSize = size * 3
      ..devicePixelRatio = 3;
    addTearDown(view.reset);

    await pumpWidget(
      ProviderScope(
        overrides: overrides,
        child: MaterialApp(
          theme: AppTheme.light(),
          locale: const Locale('tr'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) => AppFrame(child: child!),
          home: child,
        ),
      ),
    );
  }
}
