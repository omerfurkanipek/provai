import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/router/routes.dart';
import 'package:provai/config/app_links.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/l10n/gen/app_localizations.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/app_button.dart';
import 'package:provai/ui/core/widgets/circle_icon_button.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/features/paywall/view_models/paywall_state.dart';
import 'package:provai/ui/features/paywall/view_models/paywall_view_model.dart';
import 'package:provai/ui/features/paywall/views/widgets/marked_answer_card.dart';
import 'package:provai/ui/features/paywall/views/widgets/plan_selector.dart';
import 'package:url_launcher/url_launcher.dart';

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({required this.placement, super.key});

  final PaywallPlacement placement;

  bool get _isOnboarding => placement == PaywallPlacement.onboarding;

  void _leave(BuildContext context, {required bool unlocked}) {
    // Onboarding paywall'ı akışın sonu: geri dönülecek ekran yok, Home'a geçilir.
    // Diğer girişlerde paywall modaldır ve sonucu çağırana döner.
    if (_isOnboarding || !context.canPop()) {
      const HomeRoute().go(context);
    } else {
      context.pop(unlocked);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = paywallViewModelProvider(placement);
    ref.listen(provider.select((s) => s.effect), (_, effect) {
      if (effect == null) return;
      final l10n = context.l10n;
      switch (effect) {
        case PaywallEffectUnlocked():
          context.showMessage(l10n.paywallUnlocked);
          _leave(context, unlocked: true);
        case PaywallEffectDismissed():
          _leave(context, unlocked: false);
        case PaywallEffectNothingToRestore():
          context.showMessage(l10n.paywallNothingToRestore);
        case PaywallEffectFailed():
          context.showMessage(l10n.paywallPurchaseFailed);
      }
      ref.read(provider.notifier).consumeEffect();
    });

    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;

    return PopScope(
      canPop: !_isOnboarding,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) viewModel.dismiss();
      },
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.xs,
                AppSpacing.lg,
                AppSpacing.md,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      constraints.maxHeight - AppSpacing.xs - AppSpacing.md,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _TopBar(
                        // Onboarding'de kapat butonu kısa bir gecikmeyle belirir;
                        // "Önce ücretsiz dene" seçeneği ise baştan görünür.
                        closeDelay: _isOnboarding ? 1500.ms : Duration.zero,
                        isRestoring: state.isRestoring,
                        onClose: viewModel.dismiss,
                        onRestore: viewModel.restore,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(_title(l10n, state), style: styles.display),
                      const SizedBox(height: AppSpacing.lg),
                      const MarkedAnswerCard(),
                      const SizedBox(height: AppSpacing.lg),
                      for (final feature in [
                        l10n.paywallFeature1,
                        l10n.paywallFeature2,
                        l10n.paywallFeature3,
                      ])
                        _FeatureRow(text: feature),
                      const Spacer(),
                      const SizedBox(height: AppSpacing.lg),
                      if (state.plans.isNotEmpty)
                        PlanSelector(
                          plans: state.plans,
                          selectedPlanId: state.selectedPlanId,
                          savingsPercentOf: state.savingsPercentFor,
                          onSelect: viewModel.selectPlan,
                        ),
                      const SizedBox(height: AppSpacing.md),
                      AppButton(
                        label: _cta(l10n, state.selectedPlan),
                        isLoading: state.isPurchasing,
                        onPressed:
                            state.selectedPlan == null || state.isRestoring
                            ? null
                            : viewModel.purchase,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        _finePrint(l10n, state.selectedPlan),
                        textAlign: TextAlign.center,
                        style: styles.label.copyWith(color: colors.inkMuted),
                      ),
                      if (_isOnboarding)
                        TextButton(
                          onPressed: state.isBusy ? null : viewModel.dismiss,
                          style: TextButton.styleFrom(
                            foregroundColor: colors.ink,
                            minimumSize: const Size.fromHeight(
                              AppSpacing.minTouch,
                            ),
                          ),
                          child: Text(
                            l10n.paywallContinueFree,
                            style: styles.bodySmall.copyWith(
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      _LegalLinks(l10n: l10n),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _title(AppLocalizations l10n, PaywallState state) {
    final role = state.profile?.targetRole ?? '';
    return switch (placement) {
      PaywallPlacement.onboarding when role.isNotEmpty => switch (state
          .profile!
          .interviewTiming) {
        InterviewTiming.thisWeek => l10n.paywallTitleOnboardingThisWeek(role),
        InterviewTiming.thisMonth => l10n.paywallTitleOnboardingThisMonth(role),
        InterviewTiming.notScheduled => l10n.paywallTitleOnboardingLater(role),
      },
      PaywallPlacement.freeLimit => l10n.paywallTitleFreeLimit,
      _ => l10n.paywallTitleDefault,
    };
  }

  String _cta(AppLocalizations l10n, SubscriptionPlan? plan) => switch (plan) {
    SubscriptionPlan(hasTrial: true) => l10n.paywallCtaTrial,
    SubscriptionPlan(period: PlanPeriod.weekly) => l10n.paywallCtaWeekly,
    _ => l10n.paywallCtaYearly,
  };

  String _finePrint(AppLocalizations l10n, SubscriptionPlan? plan) =>
      plan != null && plan.hasTrial
      ? l10n.paywallFinePrintTrial(plan.trialDays)
      : l10n.paywallFinePrint;
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.closeDelay,
    required this.isRestoring,
    required this.onClose,
    required this.onRestore,
  });

  final Duration closeDelay;
  final bool isRestoring;
  final VoidCallback onClose;
  final VoidCallback onRestore;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        CircleIconButton(
          icon: PenIcons.close,
          semanticLabel: context.l10n.commonClose,
          onPressed: onClose,
        ).animate().fadeIn(delay: closeDelay, duration: 300.ms),
        const Spacer(),
        TextButton(
          onPressed: isRestoring ? null : onRestore,
          style: TextButton.styleFrom(
            foregroundColor: colors.inkMuted,
            minimumSize: const Size(AppSpacing.minTouch, AppSpacing.minTouch),
          ),
          child: isRestoring
              ? SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colors.inkMuted,
                  ),
                )
              : Text(
                  context.l10n.paywallRestore,
                  style: context.textStyles.bodySmall.copyWith(
                    color: colors.inkMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ],
    );
  }
}

class _FeatureRow extends StatelessWidget {
  const _FeatureRow({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm - 2),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: colors.pen,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(text, style: context.textStyles.bodySmall)),
        ],
      ),
    );
  }
}

class _LegalLinks extends StatelessWidget {
  const _LegalLinks({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    Widget link(String label, Uri uri) => TextButton(
      onPressed: () => launchUrl(uri, mode: LaunchMode.inAppBrowserView),
      style: TextButton.styleFrom(
        foregroundColor: context.colors.inkMuted,
        minimumSize: const Size(AppSpacing.minTouch, AppSpacing.minTouch),
      ),
      child: Text(
        label,
        style: context.textStyles.label.copyWith(
          color: context.colors.inkMuted,
        ),
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        link(l10n.paywallTerms, AppLinks.terms),
        link(l10n.paywallPrivacy, AppLinks.privacy),
      ],
    );
  }
}
