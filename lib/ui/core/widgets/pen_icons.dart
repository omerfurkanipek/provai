import 'package:material_ui/material_ui.dart';

/// Uygulamanın ikon seti tek yerde. Ekranlar `Icons.x` yerine bunu kullanır;
/// ileride özel bir ikon setine geçmek bu dosyayı değiştirmekle biter.
abstract final class PenIcons {
  static const IconData mic = Icons.mic_none_rounded;
  static const IconData stop = Icons.stop_rounded;
  static const IconData keyboard = Icons.keyboard_alt_outlined;
  static const IconData pen = Icons.edit_outlined;
  static const IconData criteria = Icons.checklist_rounded;
  static const IconData check = Icons.check_rounded;
  static const IconData close = Icons.close_rounded;
  static const IconData back = Icons.chevron_left_rounded;
  static const IconData forward = Icons.chevron_right_rounded;
  static const IconData share = Icons.ios_share_rounded;
  static const IconData paste = Icons.content_paste_rounded;
  static const IconData retry = Icons.refresh_rounded;
}
