import 'package:material_ui/material_ui.dart';

/// "Kırmızı Kalem" tasarım dilinin renk token'ları.
/// Widget'lar renkleri yalnızca `context.colors` üzerinden okur; hex yazmak yasak.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.paper,
    required this.surface,
    required this.ink,
    required this.inkMuted,
    required this.inkSubtle,
    required this.onInk,
    required this.line,
    required this.lineStrong,
    required this.ruled,
    required this.pen,
    required this.penSoft,
    required this.success,
    required this.radioOff,
  });

  /// Açık tema: kâğıt zemin, mürekkep metin, düzeltmeler için kırmızı kalem.
  static const light = AppColors(
    paper: Color(0xFFF3F1EC),
    surface: Color(0xFFFBFAF7),
    ink: Color(0xFF17171A),
    inkMuted: Color(0xFF5E5D59),
    inkSubtle: Color(0xFF8A877F),
    onInk: Color(0xFFFBFAF7),
    line: Color(0xFFE4E0D6),
    lineStrong: Color(0xFFDDD9CF),
    ruled: Color(0xFFECE8DF),
    pen: Color(0xFFC93C22),
    penSoft: Color(0x1AC93C22),
    success: Color(0xFF2F6B4F),
    radioOff: Color(0xFFBDB8AC),
  );

  /// Koyu tema: "karbon kâğıt". Kalem rengi koyu zeminde kontrast için açıldı.
  static const dark = AppColors(
    paper: Color(0xFF151517),
    surface: Color(0xFF1E1E21),
    ink: Color(0xFFF1EEE7),
    inkMuted: Color(0xFFA9A59C),
    inkSubtle: Color(0xFF7D7A73),
    onInk: Color(0xFF151517),
    line: Color(0xFF2C2C30),
    lineStrong: Color(0xFF38383D),
    ruled: Color(0xFF242427),
    pen: Color(0xFFE2674E),
    penSoft: Color(0x26E2674E),
    success: Color(0xFF6FB592),
    radioOff: Color(0xFF55534E),
  );

  final Color paper;
  final Color surface;
  final Color ink;
  final Color inkMuted;
  final Color inkSubtle;
  final Color onInk;
  final Color line;
  final Color lineStrong;
  final Color ruled;
  final Color pen;
  final Color penSoft;
  final Color success;
  final Color radioOff;

  @override
  AppColors copyWith({
    Color? paper,
    Color? surface,
    Color? ink,
    Color? inkMuted,
    Color? inkSubtle,
    Color? onInk,
    Color? line,
    Color? lineStrong,
    Color? ruled,
    Color? pen,
    Color? penSoft,
    Color? success,
    Color? radioOff,
  }) {
    return AppColors(
      paper: paper ?? this.paper,
      surface: surface ?? this.surface,
      ink: ink ?? this.ink,
      inkMuted: inkMuted ?? this.inkMuted,
      inkSubtle: inkSubtle ?? this.inkSubtle,
      onInk: onInk ?? this.onInk,
      line: line ?? this.line,
      lineStrong: lineStrong ?? this.lineStrong,
      ruled: ruled ?? this.ruled,
      pen: pen ?? this.pen,
      penSoft: penSoft ?? this.penSoft,
      success: success ?? this.success,
      radioOff: radioOff ?? this.radioOff,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      paper: Color.lerp(paper, other.paper, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      inkMuted: Color.lerp(inkMuted, other.inkMuted, t)!,
      inkSubtle: Color.lerp(inkSubtle, other.inkSubtle, t)!,
      onInk: Color.lerp(onInk, other.onInk, t)!,
      line: Color.lerp(line, other.line, t)!,
      lineStrong: Color.lerp(lineStrong, other.lineStrong, t)!,
      ruled: Color.lerp(ruled, other.ruled, t)!,
      pen: Color.lerp(pen, other.pen, t)!,
      penSoft: Color.lerp(penSoft, other.penSoft, t)!,
      success: Color.lerp(success, other.success, t)!,
      radioOff: Color.lerp(radioOff, other.radioOff, t)!,
    );
  }
}
