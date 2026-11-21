import 'package:material_ui/material_ui.dart';

/// Tip ölçeği: başlıklar Bricolage Grotesque, gövde Inter.
/// Renk içermez; renk `AppTheme` içinde tema rengine göre uygulanır.
@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.display,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.body,
    required this.bodySmall,
    required this.label,
    required this.caption,
    required this.button,
  });

  factory AppTypography.withColor(Color color) {
    TextStyle d(double size, double height, double tracking) => TextStyle(
      fontFamily: _display,
      fontSize: size,
      height: height,
      fontWeight: FontWeight.w700,
      letterSpacing: size * tracking,
      color: color,
    );
    TextStyle b(double size, double height, FontWeight weight) => TextStyle(
      fontFamily: _body,
      fontSize: size,
      height: height,
      fontWeight: weight,
      color: color,
    );
    return AppTypography(
      display: d(34, 1.06, -0.025),
      titleLarge: d(30, 1.1, -0.02),
      titleMedium: d(24, 1.18, -0.015),
      titleSmall: d(20, 1.2, -0.01),
      bodyLarge: b(17, 1.5, FontWeight.w400),
      body: b(16, 1.5, FontWeight.w400),
      bodySmall: b(15, 1.45, FontWeight.w400),
      label: b(13, 1.35, FontWeight.w500),
      caption: b(12, 1.3, FontWeight.w600).copyWith(letterSpacing: 0.96),
      button: b(17, 1.2, FontWeight.w600),
    );
  }

  static const _display = 'BricolageGrotesque';
  static const _body = 'Inter';

  final TextStyle display;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle body;
  final TextStyle bodySmall;
  final TextStyle label;

  /// Büyük harfle kullanılan küçük bölüm etiketi ("SENİN CEVABIN").
  final TextStyle caption;
  final TextStyle button;

  @override
  AppTypography copyWith({
    TextStyle? display,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? body,
    TextStyle? bodySmall,
    TextStyle? label,
    TextStyle? caption,
    TextStyle? button,
  }) {
    return AppTypography(
      display: display ?? this.display,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      body: body ?? this.body,
      bodySmall: bodySmall ?? this.bodySmall,
      label: label ?? this.label,
      caption: caption ?? this.caption,
      button: button ?? this.button,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;
    return AppTypography(
      display: TextStyle.lerp(display, other.display, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
    );
  }
}
