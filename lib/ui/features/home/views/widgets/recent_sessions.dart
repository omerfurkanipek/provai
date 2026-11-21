import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/extensions/profile_labels.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/core/widgets/score_stamp.dart';
import 'package:provai/utils/string_x.dart';

class RecentSessions extends StatelessWidget {
  const RecentSessions({
    required this.sessions,
    required this.onOpen,
    super.key,
  });

  final List<InterviewSession> sessions;
  final ValueChanged<InterviewSession> onOpen;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.homeRecent.toUpperCaseFor(l10n.localeName),
          style: context.textStyles.caption.copyWith(color: colors.inkMuted),
        ),
        const SizedBox(height: AppSpacing.xs),
        if (sessions.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Text(
              l10n.homeRecentEmpty,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.inkSubtle,
              ),
            ),
          )
        else
          for (final session in sessions)
            _SessionRow(session: session, onTap: () => onOpen(session)),
      ],
    );
  }
}

class _SessionRow extends StatelessWidget {
  const _SessionRow({required this.session, required this.onTap});

  final InterviewSession session;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    final score = session.overallScore;
    final date = DateFormat.MMMd(l10n.localeName).format(session.createdAt);
    final subtitle = session.isCompleted
        ? l10n.homeSessionMeta(
            date,
            session.questions.length,
            session.language.title(l10n),
          )
        : l10n.homeSessionInProgress(
            session.answers.length,
            session.questions.length,
          );

    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 64),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colors.line)),
        ),
        child: Row(
          children: [
            if (score != null && session.isCompleted)
              ScoreStamp(score: score, size: 42, tilt: 0)
            else
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.lineStrong, width: 2),
                ),
                child: Icon(PenIcons.mic, size: 18, color: colors.inkMuted),
              ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    session.targetRole,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: styles.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: styles.label.copyWith(color: colors.inkMuted),
                  ),
                ],
              ),
            ),
            Icon(PenIcons.forward, color: colors.inkSubtle),
          ],
        ),
      ),
    );
  }
}
