import 'dart:async';

import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoDialogAction;
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
          unawaited(_showPurchaseFailed(context));
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
                      // Onboarding'de kapat butonu kısa bir gecikmeyle belirir;
                      // "Önce ücretsiz dene" seçeneği ise baştan görünür.
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child:
                            CircleIconButton(
                              icon: PenIcons.close,
                              semanticLabel: l10n.commonClose,
                              onPressed: viewModel.dismiss,
                            ).animate().fadeIn(
                              delay: _isOnboarding ? 1500.ms : Duration.zero,
                              duration: 300.ms,
                            ),
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
                      _FooterLinks(
                        isRestoring: state.isRestoring,
                        onRestore: state.isBusy ? null : viewModel.restore,
                      ),
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

/// Alt satır: Geri yükle · Kullanım Koşulları · Gizlilik (mağaza paywall'larındaki
/// alışılmış yerleşim).
class _FooterLinks extends StatelessWidget {
  const _FooterLinks({required this.isRestoring, required this.onRestore});

  final bool isRestoring;
  final VoidCallback? onRestore;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final style = context.textStyles.label.copyWith(color: colors.inkMuted);

    Widget link(String label, VoidCallback? onTap, {bool loading = false}) =>
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            foregroundColor: colors.inkMuted,
            minimumSize: const Size(AppSpacing.minTouch, AppSpacing.minTouch),
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
          ),
          child: loading
              ? SizedBox.square(
                  dimension: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colors.inkMuted,
                  ),
                )
              : Text(label, style: style),
        );
    final dot = Text('·', style: style);

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        link(l10n.paywallRestore, onRestore, loading: isRestoring),
        dot,
        link(
          l10n.paywallTerms,
          () => launchUrl(AppLinks.terms, mode: LaunchMode.inAppBrowserView),
        ),
        dot,
        link(
          l10n.paywallPrivacy,
          () => launchUrl(AppLinks.privacy, mode: LaunchMode.inAppBrowserView),
        ),
      ],
    );
  }
}

/// Platformun yerel uyarı penceresi (Android'de Material, iOS'ta Cupertino).
Future<void> _showPurchaseFailed(BuildContext context) {
  final l10n = context.l10n;
  return showAdaptiveDialog<void>(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      title: Text(l10n.paywallPurchaseFailedTitle),
      content: Text(l10n.paywallPurchaseFailedBody),
      actions: [
        adaptiveDialogAction(
          context: context,
          label: l10n.commonOk,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}

/// AlertDialog.adaptive içinde iOS'ta CupertinoDialogAction, diğerlerinde TextButton.
Widget adaptiveDialogAction({
  required BuildContext context,
  required String label,
  required VoidCallback onPressed,
}) {
  final platform = Theme.of(context).platform;
  if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
    return CupertinoDialogAction(onPressed: onPressed, child: Text(label));
  }
  return TextButton(onPressed: onPressed, child: Text(label));
}
