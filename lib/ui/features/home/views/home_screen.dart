import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/router/routes.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/extensions/error_message.dart';
import 'package:provai/ui/core/extensions/profile_labels.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/app_button.dart';
import 'package:provai/ui/core/widgets/choice_sheet.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/features/home/view_models/home_state.dart';
import 'package:provai/ui/features/home/view_models/home_view_model.dart';
import 'package:provai/ui/features/home/views/widgets/home_header.dart';
import 'package:provai/ui/features/home/views/widgets/posting_card.dart';
import 'package:provai/ui/features/home/views/widgets/recent_sessions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(homeViewModelProvider.notifier);

    Future<void> openSession(InterviewSession session) async {
      if (session.isCompleted) {
        await ResultRoute(sessionId: session.id).push<void>(context);
      } else {
        await SessionRoute(sessionId: session.id).push<void>(context);
      }
      // Prova veya rapordan dönünce geçmiş ve sayaçlar tazelenir.
      viewModel.refresh();
    }

    ref.listen(homeViewModelProvider.select((s) => s.effect), (_, effect) {
      if (effect == null) return;
      switch (effect) {
        case HomeEffectOpenSession(:final sessionId):
          final session = ref
              .read(homeViewModelProvider)
              .recentSessions
              .where((s) => s.id == sessionId)
              .firstOrNull;
          if (session != null) unawaited(openSession(session));
        case HomeEffectOpenPaywall():
          unawaited(
            const PaywallRoute(placement: PaywallPlacement.freeLimit)
                .push<bool>(context),
          );
        case HomeEffectPostingRequired():
          context.showMessage(context.l10n.homePostingRequired);
        case HomeEffectShowError(:final error):
          context.showMessage(error.message(context.l10n));
      }
      viewModel.consumeEffect();
    });

    final state = ref.watch(homeViewModelProvider);
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          // Klavyeyi boş alana dokununca kapat.
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.translucent,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.xl,
            ),
            children: [
              HomeHeader(
                profile: state.profile,
                isPro: state.isPro,
                freeSessionsLeft: state.freeSessionsLeft,
                onProfileTap: () async {
                  await const ProfileRoute().push<void>(context);
                  viewModel.refresh();
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              PostingCard(
                value: state.jobPosting,
                enabled: !state.isGenerating,
                showTooShort: state.isPostingTooShort,
                onChanged: viewModel.onPostingChanged,
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: _OptionButton(
                      label: l10n.homeLanguage,
                      value: state.language.title(l10n),
                      onTap: state.isGenerating
                          ? null
                          : () async {
                              final picked = await showChoiceSheet(
                                context: context,
                                title: l10n.homeLanguage,
                                values: InterviewLanguage.values,
                                selected: state.language,
                                labelOf: (v) => v.title(l10n),
                                descriptionOf: (v) => v.description(l10n),
                              );
                              if (picked != null) {
                                viewModel.selectLanguage(picked);
                              }
                            },
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: _OptionButton(
                      label: l10n.homeQuestionCount,
                      value: l10n.homeQuestionCountValue(state.questionCount),
                      locked: !state.isPro,
                      onTap: state.isGenerating
                          ? null
                          : () async {
                              if (!state.isPro) {
                                viewModel.selectQuestionCount(0);
                                return;
                              }
                              final picked = await showChoiceSheet(
                                context: context,
                                title: l10n.homeQuestionCount,
                                values: HomeState.proQuestionCounts,
                                selected: state.questionCount,
                                labelOf: l10n.homeQuestionCountValue,
                              );
                              if (picked != null) {
                                viewModel.selectQuestionCount(picked);
                              }
                            },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton(
                label: state.canStartSession
                    ? l10n.homeStart
                    : l10n.homeStartLocked,
                icon: const Icon(PenIcons.mic),
                isLoading: state.isGenerating,
                onPressed: state.canSubmit ? viewModel.startSession : null,
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: state.isGenerating
                    ? _GeneratingRow(onCancel: viewModel.cancelGeneration)
                    : const SizedBox(width: double.infinity),
              ),
              const SizedBox(height: AppSpacing.xl),
              RecentSessions(
                sessions: state.recentSessions,
                onOpen: openSession,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  const _OptionButton({
    required this.label,
    required this.value,
    required this.onTap,
    this.locked = false,
  });

  final String label;
  final String value;
  final VoidCallback? onTap;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        side: BorderSide(color: colors.lineStrong),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm + 2,
            vertical: AppSpacing.xs + 2,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: context.textStyles.label.copyWith(
                        color: colors.inkMuted,
                      ),
                    ),
                    Text(
                      value,
                      style: context.textStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (locked)
                Icon(Icons.lock_outline_rounded, size: 16, color: colors.pen),
            ],
          ),
        ),
      ),
    );
  }
}

class _GeneratingRow extends StatelessWidget {
  const _GeneratingRow({required this.onCancel});

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xs),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.l10n.homeGenerating,
              style: context.textStyles.label.copyWith(color: colors.inkMuted),
            ),
          ),
          TextButton(
            onPressed: onCancel,
            style: TextButton.styleFrom(foregroundColor: colors.ink),
            child: Text(context.l10n.homeCancel),
          ),
        ],
      ),
    );
  }
}
