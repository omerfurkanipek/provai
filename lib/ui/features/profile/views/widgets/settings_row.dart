import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';

/// Profil ayar satırı: etiket, opsiyonel değer ve ok.
class SettingsRow extends StatelessWidget {
  const SettingsRow({
    required this.label,
    required this.onTap,
    this.value,
    this.destructive = false,
    this.isLoading = false,
    super.key,
  });

  final String label;
  final String? value;
  final VoidCallback? onTap;
  final bool destructive;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 54),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colors.line)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: styles.body.copyWith(
                  fontWeight: FontWeight.w500,
                  color: destructive ? colors.pen : colors.ink,
                ),
              ),
            ),
            if (value != null) ...[
              Text(
                value!,
                style: styles.bodySmall.copyWith(color: colors.inkMuted),
              ),
              const SizedBox(width: AppSpacing.xs),
            ],
            if (isLoading)
              SizedBox.square(
                dimension: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colors.inkMuted,
                ),
              )
            else
              Icon(PenIcons.forward, color: colors.inkSubtle),
          ],
        ),
      ),
    );
  }
}
