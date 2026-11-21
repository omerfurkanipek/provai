import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/extensions/profile_labels.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';

/// "Planın hazırlanıyor": kullanıcının cevaplarını geri yansıtır.
/// Paywall öncesi kişiselleştirmenin işe yaradığını hissettiren geçiş.
class PreparingPage extends StatelessWidget {
  const PreparingPage({required this.profile, super.key});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final role = profile.targetRole.isEmpty
        ? l10n.onbRoleFallback
        : profile.targetRole;
    final steps = [
      l10n.onbPreparingStepRole(role),
      l10n.onbPreparingStepSeniority(profile.seniority.title(l10n)),
      l10n.onbPreparingStepStruggle(profile.struggle.title(l10n)),
    ];

    return Padding(
      padding: AppSpacing.screen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.onbPreparingTitle, style: context.textStyles.display),
          const SizedBox(height: AppSpacing.xl),
          for (final (i, text) in steps.indexed)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: _StepRow(text: text, index: i),
            ),
        ],
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({required this.text, required this.index});

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // Her madde sırayla belirir, ardından işareti "kalemle" atılır.
    final appear = (700 * index).ms;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colors.pen, width: 2),
          ),
          child: Icon(PenIcons.check, size: 16, color: colors.pen)
              .animate()
              .scale(
                delay: appear + 450.ms,
                duration: 220.ms,
                curve: Curves.easeOutBack,
                begin: Offset.zero,
              ),
        ).animate().fadeIn(delay: appear, duration: 250.ms),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(text, style: context.textStyles.bodyLarge)
              .animate()
              .fadeIn(delay: appear, duration: 300.ms)
              .slideX(begin: 0.05, curve: Curves.easeOutCubic),
        ),
      ],
    );
  }
}
