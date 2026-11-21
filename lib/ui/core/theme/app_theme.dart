import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/theme/app_colors.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/theme/app_typography.dart';

/// Material temasını token'lardan üretir. Dynamic color kullanılmaz.
abstract final class AppTheme {
  static ThemeData light() => _build(AppColors.light, Brightness.light);
  static ThemeData dark() => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors c, Brightness brightness) {
    final type = AppTypography.withColor(c.ink);
    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.ink,
      onPrimary: c.onInk,
      secondary: c.pen,
      onSecondary: c.onInk,
      error: c.pen,
      onError: c.onInk,
      surface: c.paper,
      onSurface: c.ink,
      outline: c.lineStrong,
      outlineVariant: c.line,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.paper,
      fontFamily: 'Inter',
      extensions: [c, type],
      splashFactory: InkSparkle.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: c.paper,
        foregroundColor: c.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: type.bodyLarge.copyWith(fontWeight: FontWeight.w600),
        systemOverlayStyle: brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: c.ink,
        contentTextStyle: type.bodySmall.copyWith(color: c.onInk),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
        ),
      ),
      dividerTheme: DividerThemeData(color: c.line, thickness: 1, space: 1),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: c.pen,
        selectionColor: c.penSoft,
        selectionHandleColor: c.pen,
      ),
    );
  }
}
