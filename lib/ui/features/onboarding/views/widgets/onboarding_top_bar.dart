import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/circle_icon_button.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/features/onboarding/view_models/onboarding_state.dart';

/// Değer sayfalarında nokta göstergesi + "Atla"; soru adımlarında geri butonu +
/// ilerleme çubuğu; hazırlanıyor adımında boş.
class OnboardingTopBar extends StatelessWidget {
  const OnboardingTopBar({
    required this.step,
    required this.onBack,
    required this.onSkip,
    super.key,
  });

  final OnboardingStep step;
  final VoidCallback onBack;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xs,
        AppSpacing.lg,
        0,
      ),
      child: SizedBox(
        height: AppSpacing.minTouch,
        child: switch (step) {
          OnboardingStep.preparing => const SizedBox.shrink(),
          _ when step.isIntro => Row(
            children: [
              _Dots(active: step.index),
              const Spacer(),
              TextButton(
                onPressed: onSkip,
                style: TextButton.styleFrom(foregroundColor: colors.inkMuted),
                child: Text(
                  context.l10n.onbSkip,
                  style: context.textStyles.bodySmall.copyWith(
                    color: colors.inkMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          _ => Row(
            children: [
              CircleIconButton(
                icon: PenIcons.back,
                semanticLabel: context.l10n.commonBack,
                onPressed: onBack,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _Progress(
                  value: step.questionNumber / OnboardingStep.questionCount,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                context.l10n.onbProgress(
                  step.questionNumber,
                  OnboardingStep.questionCount,
                ),
                style: context.textStyles.label.copyWith(
                  color: colors.inkMuted,
                ),
              ),
            ],
          ),
        },
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.active});

  final int active;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        for (var i = 0; i < 2; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            margin: const EdgeInsets.only(right: 6),
            width: i == active ? 22 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: i == active ? colors.ink : colors.radioOff,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
      ],
    );
  }
}

class _Progress extends StatelessWidget {
  const _Progress({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: value),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        builder: (context, v, _) => LinearProgressIndicator(
          value: v,
          minHeight: 4,
          color: colors.ink,
          backgroundColor: colors.line,
        ),
      ),
    );
  }
}
