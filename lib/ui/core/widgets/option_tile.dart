import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/pen_radio.dart';

/// Tek seçimli kart: başlık, açıklama ve kırmızı kalemli radyo işareti.
/// Onboarding sorularında ve profil düzenlemede kullanılır.
class OptionTile extends StatelessWidget {
  const OptionTile({
    required this.title,
    required this.selected,
    required this.onTap,
    this.description,
    super.key,
  });

  final String title;
  final String? description;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    return Semantics(
      selected: selected,
      inMutuallyExclusiveGroup: true,
      button: true,
      child: Material(
        color: selected ? colors.surface : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.button,
          side: BorderSide(
            color: selected ? colors.ink : colors.lineStrong,
            width: 1.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 68),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: styles.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                            height: 1.3,
                          ),
                        ),
                        if (description != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            description!,
                            style: styles.bodySmall.copyWith(
                              color: colors.inkMuted,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  PenRadio(selected: selected),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
