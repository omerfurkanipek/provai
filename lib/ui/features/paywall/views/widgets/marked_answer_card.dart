import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/core/widgets/ruled_paper.dart';
import 'package:provai/utils/string_x.dart';

/// Paywall'daki örnek: kullanıcının zayıf ifadesinin altı kırmızı kalemle çizili,
/// altında koçun notu. Satın almadan önce ürünün ne yaptığını gösterir.
class MarkedAnswerCard extends StatelessWidget {
  const MarkedAnswerCard({super.key});

  static const double _lineHeight = 28;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: RuledPaper(
        lineSpacing: _lineHeight,
        offset: AppSpacing.md + 2,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.paywallExampleLabel.toUpperCaseFor(l10n.localeName),
                style: styles.caption.copyWith(color: colors.inkMuted),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: l10n.paywallExampleBefore),
                    TextSpan(
                      text: l10n.paywallExamplePhrase,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: colors.pen,
                        decorationThickness: 2,
                      ),
                    ),
                    TextSpan(text: l10n.paywallExampleAfter),
                  ],
                ),
                style: styles.body.copyWith(height: _lineHeight / 16),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(PenIcons.pen, size: 20, color: colors.pen),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      l10n.paywallExampleFix,
                      style: styles.bodySmall.copyWith(
                        color: colors.pen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
