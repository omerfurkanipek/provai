import 'dart:async';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/router/routes.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/extensions/error_message.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/app_button.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/features/session/view_models/session_state.dart';
import 'package:provai/ui/features/session/view_models/session_view_model.dart';
import 'package:provai/ui/features/session/views/widgets/answer_composer.dart';
import 'package:provai/ui/features/session/views/widgets/feedback_view.dart';
import 'package:provai/ui/features/session/views/widgets/question_header.dart';

class SessionScreen extends ConsumerWidget {
  const SessionScreen({required this.sessionId, super.key});

  final String sessionId;

  Future<void> _confirmExit(BuildContext context) async {
    final l10n = context.l10n;
    final leave = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.sessionExitTitle),
        content: Text(l10n.sessionExitBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.sessionExitCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.sessionExitConfirm),
          ),
        ],
      ),
    );
    if ((leave ?? false) && context.mounted) context.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = sessionViewModelProvider(sessionId);
    final viewModel = ref.read(provider.notifier);

    ref.listen(provider.select((s) => s.effect), (_, effect) {
      if (effect == null) return;
      switch (effect) {
        case SessionEffectShowError(:final error):
          context.showMessage(error.message(context.l10n));
        case SessionEffectOpenResult(:final sessionId):
          // Rapor, provanın yerini alır: geri tuşu Home'a döner.
          ResultRoute(sessionId: sessionId).pushReplacement(context);
        case SessionEffectOpenPaywall():
          unawaited(
            const PaywallRoute(placement: PaywallPlacement.freeLimit)
                .push<bool>(context)
                .then((_) => viewModel.refreshEntitlement()),
          );
      }
      viewModel.consumeEffect();
    });

    final state = ref.watch(provider);
    final session = state.session;
    final question = state.question;

    if (session == null || question == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(context.l10n.sessionNotFound)),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) unawaited(_confirmExit(context));
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.xs,
              AppSpacing.lg,
              AppSpacing.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SessionTopBar(
                  current: state.currentIndex,
                  total: state.totalQuestions,
                  onExit: () => _confirmExit(context),
                ),
                const SizedBox(height: AppSpacing.lg),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    layoutBuilder: (current, previous) => Stack(
                      alignment: Alignment.topCenter,
                      children: [...previous, ?current],
                    ),
                    child: KeyedSubtree(
                      key: ValueKey('${state.currentIndex}-${state.phase}'),
                      child: switch (state.phase) {
                        SessionPhase.answering => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            QuestionCard(question: question),
                            const SizedBox(height: AppSpacing.lg),
                            Expanded(
                              child: AnswerComposer(
                                state: state,
                                language: session.language,
                                onToggleRecording: viewModel.toggleRecording,
                                onRestart: viewModel.restartAnswer,
                                onModeChanged: viewModel.setInputMode,
                                onTypedChanged: viewModel.onTypedAnswerChanged,
                              ),
                            ),
                          ],
                        ),
                        SessionPhase.evaluating => _Evaluating(
                          questionCard: QuestionCard(question: question),
                          onCancel: viewModel.cancelEvaluation,
                        ),
                        SessionPhase.feedback => SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              QuestionCard(question: question),
                              const SizedBox(height: AppSpacing.xl),
                              if (state.currentAnswer != null)
                                FeedbackView(
                                  answer: state.currentAnswer!,
                                  isPro: state.isPro,
                                  onUnlockImproved:
                                      viewModel.requestImprovedAnswer,
                                ),
                              const SizedBox(height: AppSpacing.md),
                            ],
                          ),
                        ),
                      },
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                switch (state.phase) {
                  SessionPhase.answering => AppButton(
                    label: context.l10n.sessionSubmit,
                    onPressed: state.canSubmit ? viewModel.submit : null,
                  ),
                  SessionPhase.evaluating => const SizedBox.shrink(),
                  SessionPhase.feedback => AppButton(
                    label: state.isLastQuestion
                        ? context.l10n.sessionFinish
                        : context.l10n.sessionNext,
                    onPressed: viewModel.next,
                  ),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Evaluating extends StatelessWidget {
  const _Evaluating({required this.questionCard, required this.onCancel});

  final Widget questionCard;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        questionCard,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Kalem sağa sola "yazıyor": değerlendirme sürerken bekleme hissi.
              Icon(PenIcons.pen, size: 40, color: colors.pen)
                  .animate(onPlay: (c) => c.repeat(reverse: true))
                  .moveX(
                    begin: -14,
                    end: 14,
                    duration: 700.ms,
                    curve: Curves.easeInOut,
                  )
                  .rotate(begin: -0.02, end: 0.02, duration: 700.ms),
              const SizedBox(height: AppSpacing.md),
              Text(
                context.l10n.sessionEvaluating,
                textAlign: TextAlign.center,
                style: context.textStyles.bodyLarge.copyWith(
                  color: colors.inkMuted,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              TextButton(
                onPressed: onCancel,
                style: TextButton.styleFrom(foregroundColor: colors.ink),
                child: Text(context.l10n.homeCancel),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
