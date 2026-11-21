import 'dart:async';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/router/routes.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/l10n/gen/app_localizations.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/extensions/error_message.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/app_button.dart';
import 'package:provai/ui/core/widgets/circle_icon_button.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/core/widgets/score_stamp.dart';
import 'package:provai/ui/features/result/view_models/result_state.dart';
import 'package:provai/ui/features/result/view_models/result_view_model.dart';
import 'package:provai/ui/features/result/views/widgets/answer_detail_sheet.dart';
import 'package:provai/ui/features/result/views/widgets/criteria_table.dart';
import 'package:provai/utils/string_x.dart';
import 'package:share_plus/share_plus.dart';

extension CriterionLabel on Criterion {
  String label(AppLocalizations l10n) => switch (this) {
    Criterion.structure => l10n.criteriaStructure,
    Criterion.relevance => l10n.criteriaRelevance,
    Criterion.specificity => l10n.criteriaSpecificity,
    Criterion.clarity => l10n.criteriaClarity,
  };
}

class ResultScreen extends ConsumerWidget {
  const ResultScreen({required this.sessionId, super.key});

  final String sessionId;

  void _goHome(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      const HomeRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = resultViewModelProvider(sessionId);
    final viewModel = ref.read(provider.notifier);

    ref.listen(provider.select((s) => s.effect), (_, effect) {
      if (effect == null) return;
      switch (effect) {
        case ResultEffectOpenSession(:final sessionId):
          SessionRoute(sessionId: sessionId).pushReplacement(context);
        case ResultEffectOpenPaywall():
          unawaited(
            const PaywallRoute(placement: PaywallPlacement.freeLimit)
                .push<bool>(context),
          );
        case ResultEffectShowError(:final error):
          context.showMessage(error.message(context.l10n));
      }
      viewModel.consumeEffect();
    });

    final state = ref.watch(provider);
    final session = state.session;
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;

    if (session == null || session.overallScore == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.sessionNotFound)),
      );
    }
    final score = session.overallScore!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.xs,
                AppSpacing.lg,
                0,
              ),
              child: Row(
                children: [
                  CircleIconButton(
                    icon: PenIcons.back,
                    semanticLabel: l10n.commonBack,
                    onPressed: () => _goHome(context),
                  ),
                  const Spacer(),
                  CircleIconButton(
                    icon: PenIcons.share,
                    semanticLabel: l10n.resultShare,
                    onPressed: () => SharePlus.instance.share(
                      ShareParams(
                        text: l10n.resultShareText(score, session.targetRole),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.md,
                  AppSpacing.lg,
                  AppSpacing.lg,
                ),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${l10n.resultTitle} · ${session.targetRole}'
                                  .toUpperCaseFor(l10n.localeName),
                              style: styles.caption.copyWith(
                                color: colors.inkMuted,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              _headline(l10n, score, state.weakest),
                              style: styles.titleLarge,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      ScoreStamp(
                            score: score,
                            outOf: l10n.scoreOutOf100,
                            size: 92,
                            tilt: -6,
                          )
                          .animate()
                          .scale(
                            begin: const Offset(1.5, 1.5),
                            duration: 320.ms,
                            curve: Curves.easeOutBack,
                          )
                          .fadeIn(duration: 220.ms),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  CriteriaTable(
                    criteria: state.criteria,
                    weakest: state.weakest,
                  ),
                  if (state.practiceItems.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xl),
                    _Caption(l10n.resultPractice),
                    const SizedBox(height: AppSpacing.sm),
                    for (final (i, item) in state.practiceItems.indexed)
                      _PracticeItem(number: i + 1, text: item),
                  ],
                  const SizedBox(height: AppSpacing.lg),
                  _Caption(l10n.resultQuestions),
                  const SizedBox(height: AppSpacing.xs),
                  for (final question in session.questions)
                    if (session.answerFor(question.id) case final answer?)
                      _QuestionRow(
                        question: question,
                        answer: answer,
                        onTap: () => showAnswerDetailSheet(
                          context: context,
                          question: question,
                          answer: answer,
                        ),
                      ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.xs,
                AppSpacing.lg,
                AppSpacing.md,
              ),
              child: Column(
                children: [
                  AppButton(
                    label: l10n.resultRetry,
                    isLoading: state.isRetrying,
                    onPressed: viewModel.retry,
                  ),
                  TextButton(
                    onPressed: () => _goHome(context),
                    style: TextButton.styleFrom(
                      foregroundColor: colors.ink,
                      minimumSize: const Size.fromHeight(AppSpacing.minTouch),
                    ),
                    child: Text(l10n.resultHome),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _headline(AppLocalizations l10n, int score, Criterion? weakest) {
    final weakestLabel = weakest?.label(l10n) ?? '';
    if (score >= 80 || weakest == null) return l10n.resultHeadlineGreat;
    if (score >= 60) return l10n.resultHeadlineGood(weakestLabel);
    return l10n.resultHeadlineWeak(weakestLabel);
  }
}

class _Caption extends StatelessWidget {
  const _Caption(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text.toUpperCaseFor(context.l10n.localeName),
    style: context.textStyles.caption.copyWith(color: context.colors.inkMuted),
  );
}

class _PracticeItem extends StatelessWidget {
  const _PracticeItem({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            child: Text(
              '$number',
              style: context.textStyles.titleSmall.copyWith(
                color: context.colors.pen,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Expanded(child: Text(text, style: context.textStyles.bodySmall)),
        ],
      ),
    );
  }
}

class _QuestionRow extends StatelessWidget {
  const _QuestionRow({
    required this.question,
    required this.answer,
    required this.onTap,
  });

  final InterviewQuestion question;
  final InterviewAnswer answer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 56),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colors.line)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 44,
              child: Text(
                '${answer.feedback.score}',
                style: context.textStyles.titleSmall.copyWith(
                  color: colors.pen,
                ),
              ),
            ),
            Expanded(
              child: Text(
                question.text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.bodySmall,
              ),
            ),
            Icon(PenIcons.forward, color: colors.inkSubtle),
          ],
        ),
      ),
    );
  }
}
