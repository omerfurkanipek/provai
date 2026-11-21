import 'package:material_ui/material_ui.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/l10n/gen/app_localizations.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/extensions/price_format.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/pen_radio.dart';

/// Planların tek kart içinde, satır satır listesi. Seçili satır kırmızı radyo ile.
class PlanSelector extends StatelessWidget {
  const PlanSelector({
    required this.plans,
    required this.selectedPlanId,
    required this.savingsPercentOf,
    required this.onSelect,
    super.key,
  });

  final List<SubscriptionPlan> plans;
  final String? selectedPlanId;
  final int Function(SubscriptionPlan plan) savingsPercentOf;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.lineStrong),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (final (i, plan) in plans.indexed) ...[
            if (i > 0) Divider(color: colors.line),
            _PlanRow(
              plan: plan,
              selected: plan.id == selectedPlanId,
              savingsPercent: savingsPercentOf(plan),
              onTap: () => onSelect(plan.id),
            ),
          ],
        ],
      ),
    );
  }
}

class _PlanRow extends StatelessWidget {
  const _PlanRow({
    required this.plan,
    required this.selected,
    required this.savingsPercent,
    required this.onTap,
  });

  final SubscriptionPlan plan;
  final bool selected;
  final int savingsPercent;
  final VoidCallback onTap;

  String _subtitle(AppLocalizations l10n) {
    final price = l10n.formatPrice(plan.price, plan.currencyCode);
    return switch (plan.period) {
      PlanPeriod.yearly when plan.hasTrial => l10n.paywallYearlyTrialSubtitle(
        plan.trialDays,
        price,
      ),
      PlanPeriod.yearly => l10n.paywallYearlySubtitle(price),
      PlanPeriod.weekly => l10n.paywallWeeklySubtitle,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    final title = plan.period == PlanPeriod.yearly
        ? l10n.paywallPlanYearly
        : l10n.paywallPlanWeekly;

    return Semantics(
      selected: selected,
      inMutuallyExclusiveGroup: true,
      button: true,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 60),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs + 2,
            ),
            child: Row(
              children: [
                PenRadio(selected: selected),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Wrap: büyük yazı boyutunda tasarruf etiketi alt satıra iner.
                      Wrap(
                        spacing: AppSpacing.xs,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            title,
                            style: styles.body.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (savingsPercent > 0)
                            Text(
                              l10n.paywallSavings(savingsPercent),
                              style: styles.label.copyWith(
                                color: colors.pen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _subtitle(l10n),
                        style: styles.bodySmall.copyWith(
                          color: colors.inkMuted,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  l10n.paywallPerWeek(
                    l10n.formatPrice(plan.weeklyPrice, plan.currencyCode),
                  ),
                  style: styles.bodySmall.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
