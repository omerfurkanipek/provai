import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';

/// 44px yuvarlak, çerçeveli ikon butonu (geri, kapat, paylaş).
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    required this.icon,
    required this.semanticLabel,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final String semanticLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      label: semanticLabel,
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: AppSpacing.minTouch,
        child: Material(
          color: colors.surface,
          shape: CircleBorder(side: BorderSide(color: colors.lineStrong)),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onPressed,
            child: Icon(icon, size: 22, color: colors.inkMuted),
          ),
        ),
      ),
    );
  }
}
