import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/utils/string_x.dart';

/// 1. değer sayfası: ilan → sesli cevap → kırmızı kalem düzeltmesi.
/// Üç eğik kart ürünün döngüsünü tek bakışta anlatır.
class ValueStoryPage extends StatelessWidget {
  const ValueStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return _ValueLayout(
      title: l10n.onbValue1Title,
      body: l10n.onbValue1Body,
      illustration: const _StoryCards(),
    );
  }
}

/// 2. değer sayfası: provanın neyi ölçtüğü.
class ValueHowPage extends StatelessWidget {
  const ValueHowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final points = [
      (PenIcons.mic, l10n.onbValue2Point1),
      (PenIcons.criteria, l10n.onbValue2Point2),
      (PenIcons.pen, l10n.onbValue2Point3),
    ];
    return _ValueLayout(
      title: l10n.onbValue2Title,
      body: l10n.onbValue2Body,
      illustration: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final (i, (icon, text)) in points.indexed)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _PointRow(icon: icon, text: text)
                  .animate()
                  .fadeIn(delay: (120 * i).ms, duration: 320.ms)
                  .slideY(begin: 0.15, curve: Curves.easeOutCubic),
            ),
        ],
      ),
    );
  }
}

class _ValueLayout extends StatelessWidget {
  const _ValueLayout({
    required this.title,
    required this.body,
    required this.illustration,
  });

  final String title;
  final String body;
  final Widget illustration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: illustration),
          const SizedBox(height: AppSpacing.lg),
          Text(title, style: context.textStyles.display),
          const SizedBox(height: AppSpacing.sm),
          Text(
            body,
            style: context.textStyles.body.copyWith(
              color: context.colors.inkMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryCards extends StatelessWidget {
  const _StoryCards();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;

    Widget card({
      required Widget child,
      required double angle,
      required int order,
      Color? background,
    }) {
      return Transform.rotate(
            angle: angle,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: background ?? colors.surface,
                borderRadius: BorderRadius.circular(18),
                border: background == null
                    ? Border.all(color: colors.line)
                    : null,
              ),
              child: child,
            ),
          )
          .animate()
          .fadeIn(delay: (140 * order).ms, duration: 360.ms)
          .slideY(begin: 0.12, curve: Curves.easeOutCubic);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: AppSpacing.md,
              width: w * 0.72,
              child: card(
                angle: -0.05,
                order: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.onbValue1PostingLabel.toUpperCaseFor(l10n.localeName),
                      style: styles.caption.copyWith(color: colors.inkMuted),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      l10n.onbValue1PostingTitle,
                      style: styles.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      l10n.onbValue1PostingBody,
                      style: styles.label.copyWith(color: colors.inkMuted),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: constraints.maxHeight * 0.36,
              width: w * 0.66,
              child: card(
                angle: 0.035,
                order: 1,
                background: colors.ink,
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: colors.pen,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(PenIcons.mic, color: colors.onInk, size: 20),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        l10n.onbValue1Answer,
                        style: styles.bodySmall.copyWith(color: colors.onInk),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: AppSpacing.md,
              bottom: AppSpacing.xs,
              width: w * 0.78,
              child: card(
                angle: -0.018,
                order: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: l10n.onbValue1MarkedBefore),
                          TextSpan(
                            text: l10n.onbValue1MarkedPhrase,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: colors.pen,
                              decorationThickness: 2,
                            ),
                          ),
                          TextSpan(text: l10n.onbValue1MarkedAfter),
                        ],
                      ),
                      style: styles.bodySmall,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      l10n.onbValue1Fix,
                      style: styles.label.copyWith(
                        color: colors.pen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PointRow extends StatelessWidget {
  const _PointRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.card,
        border: Border.all(color: colors.line),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors.penSoft,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Icon(icon, color: colors.pen, size: 20),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              text,
              style: context.textStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
