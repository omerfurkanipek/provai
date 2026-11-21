import 'package:cupertino_ui/cupertino_ui.dart'
    show GlobalCupertinoLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/router/app_router.dart';
import 'package:provai/l10n/gen/app_localizations.dart';
import 'package:provai/ui/core/theme/app_theme.dart';
import 'package:provai/ui/core/theme/locale_controller.dart';
import 'package:provai/ui/core/theme/theme_mode_controller.dart';

class ProvaiApp extends ConsumerWidget {
  const ProvaiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ref.watch(themeModeControllerProvider),
      locale: ref.watch(localeControllerProvider),
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) => AppFrame(child: child!),
    );
  }
}

/// Tüm ekranları saran çerçeve:
/// - Cihazın yazı boyutu ayarı uygulanmaz; tasarım her cihazda aynı ölçekte kalır
///   (büyük yazılı telefonlarda düzen bozulmasın diye bilinçli tercih).
/// - Tablet ve yatay ekranda içerik okunabilir genişlikte ortalanır; kenarlar
///   kâğıt rengiyle dolar.
class AppFrame extends StatelessWidget {
  const AppFrame({required this.child, super.key});

  final Widget child;

  /// Telefon tasarımının taşınabileceği en geniş içerik genişliği.
  static const maxContentWidth = 600.0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return MediaQuery(
      data: media.copyWith(textScaler: TextScaler.noScaling),
      child: ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxContentWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}
