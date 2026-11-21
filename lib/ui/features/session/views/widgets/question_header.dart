import 'package:material_ui/material_ui.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/l10n/gen/app_localizations.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/circle_icon_button.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/utils/string_x.dart';

extension QuestionTypeLabel on QuestionType {
  String label(AppLocalizations l10n) => switch (this) {
    QuestionType.motivation => l10n.questionTypeMotivation,
    QuestionType.behavioral => l10n.questionTypeBehavioral,
    QuestionType.technical => l10n.questionTypeTechnical,
    QuestionType.situational => l10n.questionTypeSituational,
  };
}

/// Çıkış butonu, bölümlü ilerleme çubuğu ve soru sayacı.
class SessionTopBar extends StatelessWidget {
  const SessionTopBar({
    required this.current,
    required this.total,
    required this.onExit,
    super.key,
  });

  /// 0'dan başlayan aktif soru sırası.
  final int current;
  final int total;
  final VoidCallback onExit;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        CircleIconButton(
          icon: PenIcons.close,
          semanticLabel: context.l10n.sessionExit,
          onPressed: onExit,
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Row(
            children: [
              for (var i = 0; i < total; i++) ...[
                if (i > 0) const SizedBox(width: 6),
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 4,
                    decoration: BoxDecoration(
                      color: i <= current ? colors.ink : colors.line,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Text(
          context.l10n.sessionProgress(current + 1, total),
          style: context.textStyles.label.copyWith(color: colors.inkMuted),
        ),
      ],
    );
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({required this.question, super.key});

  final InterviewQuestion question;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.type.label(l10n).toUpperCaseFor(l10n.localeName),
          style: context.textStyles.caption.copyWith(color: context.colors.pen),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(question.text, style: context.textStyles.titleMedium),
      ],
    );
  }
}
