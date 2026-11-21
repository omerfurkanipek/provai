import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/features/result/view_models/result_state.dart';
import 'package:provai/ui/features/result/views/result_screen.dart';

/// Kriter ortalamaları, noktalı çizgiyle sağa yaslı puanlar (karne düzeni).
/// En zayıf kriter kırmızı kalemle işaretlenir.
class CriteriaTable extends StatelessWidget {
  const CriteriaTable({
    required this.criteria,
    required this.weakest,
    super.key,
  });

  final Map<Criterion, double> criteria;
  final Criterion? weakest;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    return Column(
      children: [
        for (final entry in criteria.entries)
          Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: colors.line)),
            ),
            child: Row(
              children: [
                Text(entry.key.label(l10n), style: styles.body),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CustomPaint(
                      painter: _DottedLine(color: colors.lineStrong),
                      size: const Size.fromHeight(2),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  entry.value.toStringAsFixed(1),
                  style: styles.titleSmall.copyWith(
                    color: entry.key == weakest ? colors.pen : colors.ink,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _DottedLine extends CustomPainter {
  const _DottedLine({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    for (var x = 0.0; x < size.width; x += 6) {
      canvas.drawCircle(Offset(x, size.height / 2), 1, paint);
    }
  }

  @override
  bool shouldRepaint(_DottedLine old) => old.color != color;
}
