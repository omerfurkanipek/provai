import 'dart:ui';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/core/widgets/ruled_paper.dart';
import 'package:provai/ui/core/widgets/score_stamp.dart';
import 'package:provai/ui/features/session/views/widgets/marked_text.dart';
import 'package:provai/utils/string_x.dart';

/// Bir cevabın değerlendirmesi: işaretli cevap + puan mührü, güçlü yanlar,
/// düzeltmeler, örnek cevap (ücretsizde kilitli) ve takip sorusu.
class FeedbackView extends StatelessWidget {
  const FeedbackView({
    required this.answer,
    required this.isPro,
    required this.onUnlockImproved,
    super.key,
  });

  final InterviewAnswer answer;
  final bool isPro;
  final VoidCallback onUnlockImproved;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    final feedback = answer.feedback;

    Widget section(String title, int order, Widget child) => Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCaseFor(l10n.localeName),
            style: styles.caption.copyWith(color: colors.inkMuted),
          ),
          const SizedBox(height: AppSpacing.sm),
          child,
        ],
      ).animate().fadeIn(delay: (120 * order).ms, duration: 300.ms),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _AnswerCard(answer: answer),
        const SizedBox(height: AppSpacing.md),
        Text(feedback.summary, style: styles.body),
        if (feedback.strengths.isNotEmpty)
          section(
            l10n.sessionStrengths,
            1,
            Column(
              children: [
                for (final strength in feedback.strengths)
                  _Point(
                    icon: PenIcons.check,
                    color: colors.success,
                    text: strength,
                  ),
              ],
            ),
          ),
        if (feedback.improvements.isNotEmpty)
          section(
            l10n.sessionImprovements,
            2,
            Column(
              children: [
                for (final item in feedback.improvements)
                  _Point(icon: PenIcons.pen, color: colors.pen, text: item.fix),
              ],
            ),
          ),
        section(
          l10n.sessionImprovedAnswer,
          3,
          _ImprovedAnswer(
            text: feedback.improvedAnswer,
            locked: !isPro,
            onUnlock: onUnlockImproved,
          ),
        ),
        section(
          l10n.sessionFollowUp,
          4,
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: colors.ink,
              borderRadius: AppRadius.card,
            ),
            child: Text(
              feedback.followUpQuestion,
              style: styles.bodySmall.copyWith(color: colors.onInk),
            ),
          ),
        ),
      ],
    );
  }
}

class _AnswerCard extends StatelessWidget {
  const _AnswerCard({required this.answer});

  final InterviewAnswer answer;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    final label = [
      l10n.sessionYourAnswer,
      if (answer.durationSeconds != null)
        l10n.sessionDuration(answer.durationSeconds!),
    ].join(' · ');

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: AppRadius.card,
            border: Border.all(color: colors.line),
          ),
          clipBehavior: Clip.antiAlias,
          child: RuledPaper(
            lineSpacing: 28,
            offset: AppSpacing.md - 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.xl + AppSpacing.lg,
                AppSpacing.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label.toUpperCaseFor(l10n.localeName),
                    style: styles.caption.copyWith(
                      color: colors.inkMuted,
                      height: 28 / 12,
                    ),
                  ),
                  MarkedText(
                    text: answer.transcript,
                    quotes: [
                      for (final item in answer.feedback.improvements)
                        item.quote,
                    ],
                    penColor: colors.pen,
                    style: styles.body.copyWith(height: 28 / 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -14,
          right: AppSpacing.md,
          child:
              ScoreStamp(score: answer.feedback.score, outOf: l10n.scoreOutOf)
                  .animate()
                  .scale(
                    begin: const Offset(1.6, 1.6),
                    duration: 280.ms,
                    curve: Curves.easeOutBack,
                  )
                  .fadeIn(duration: 200.ms),
        ),
      ],
    );
  }
}

class _Point extends StatelessWidget {
  const _Point({required this.icon, required this.color, required this.text});

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(text, style: context.textStyles.bodySmall)),
        ],
      ),
    );
  }
}

class _ImprovedAnswer extends StatelessWidget {
  const _ImprovedAnswer({
    required this.text,
    required this.locked,
    required this.onUnlock,
  });

  final String text;
  final bool locked;
  final VoidCallback onUnlock;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final body = Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.card,
        border: Border.all(color: colors.line),
      ),
      child: Text(text, style: context.textStyles.bodySmall),
    );
    if (!locked) return body;

    // Ücretsizde metin bulanık görünür: ne kaçırdığını hissettirir, okutmaz.
    return Semantics(
      button: true,
      label: context.l10n.sessionImprovedLocked,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onUnlock,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 140),
              child: ClipRRect(
                borderRadius: AppRadius.card,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: body,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: colors.ink,
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lock_outline_rounded,
                    size: 16,
                    color: colors.onInk,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    context.l10n.sessionImprovedLocked,
                    style: context.textStyles.label.copyWith(
                      color: colors.onInk,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
