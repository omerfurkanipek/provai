import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/domain/repositories/interview_repository.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/app_button.dart';
import 'package:provai/utils/string_x.dart';

/// Abonelik durumu: ücretsizde kalan hak + Pro'ya geç, Pro'da plan ve yenilenme.
class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    required this.status,
    required this.freeSessionsLeft,
    required this.dateFormat,
    required this.onUpgrade,
    super.key,
  });

  final SubscriptionStatus status;
  final int freeSessionsLeft;
  final DateFormat dateFormat;
  final VoidCallback onUpgrade;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    final renewsAt = status.renewsAt;

    final title = status.isPro ? l10n.profileProPlan : l10n.profileFreePlan;
    final detail = switch (status) {
      SubscriptionStatus(isPro: false) => l10n.profileFreeLeft(
        freeSessionsLeft,
        FreeTier.sessions,
      ),
      SubscriptionStatus(isInTrial: true) when renewsAt != null =>
        l10n.profileTrialUntil(dateFormat.format(renewsAt)),
      _ when renewsAt != null => l10n.profileRenewsOn(
        dateFormat.format(renewsAt),
      ),
      _ => '',
    };
    final planName = switch (status.period) {
      PlanPeriod.yearly => l10n.profileProYearly,
      PlanPeriod.weekly => l10n.profileProWeekly,
      null => null,
    };

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md + 2),
      decoration: BoxDecoration(
        color: colors.ink,
        borderRadius: AppRadius.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.profileSubscription.toUpperCaseFor(l10n.localeName),
            style: styles.caption.copyWith(
              color: colors.onInk.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: styles.titleSmall.copyWith(color: colors.onInk),
                ),
              ),
              if (planName != null)
                Text(
                  planName,
                  style: styles.label.copyWith(
                    color: colors.onInk.withValues(alpha: 0.8),
                  ),
                ),
            ],
          ),
          if (detail.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.xxs),
            Text(
              detail,
              style: styles.label.copyWith(
                color: colors.onInk.withValues(alpha: 0.8),
              ),
            ),
          ],
          if (!status.isPro) ...[
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: l10n.profileUpgrade,
              variant: AppButtonVariant.accent,
              height: 48,
              onPressed: onUpgrade,
            ),
          ],
        ],
      ),
    );
  }
}
