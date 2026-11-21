import 'package:material_ui/material_ui.dart';

/// 4'ün katlarıyla boşluk ölçeği. Widget'larda sihirli sayı yerine bunlar kullanılır.
abstract final class AppSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  /// Ekran kenar boşluğu (tasarımdaki 24px yatay padding).
  static const EdgeInsets screen = EdgeInsets.symmetric(horizontal: lg);

  /// Minimum dokunma alanı (erişilebilirlik).
  static const double minTouch = 44;
}

abstract final class AppRadius {
  static const double sm = 10;
  static const double md = 14;
  static const double lg = 16;
  static const double xl = 20;
  static const double pill = 999;

  static const BorderRadius button = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius card = BorderRadius.all(Radius.circular(xl));
}
