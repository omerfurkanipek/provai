import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';

/// Kırmızı kalemle daire içine alınmış puan; hafif eğik, öğretmen notu gibi.
class ScoreStamp extends StatelessWidget {
  const ScoreStamp({
    required this.score,
    this.outOf,
    this.size = 64,
    this.tilt = -8,
    super.key,
  });

  final int score;

  /// "/10" gibi küçük ek; null ise yalnızca sayı.
  final String? outOf;
  final double size;

  /// Derece cinsinden eğim.
  final double tilt;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      label: '$score${outOf ?? ''}',
      excludeSemantics: true,
      child: Transform.rotate(
        angle: tilt * math.pi / 180,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.surface,
            border: Border.all(color: colors.pen, width: size > 50 ? 2.5 : 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$score',
                style: context.textStyles.titleMedium.copyWith(
                  color: colors.pen,
                  fontSize: size * 0.38,
                  height: 1,
                ),
              ),
              if (outOf != null)
                Text(
                  outOf!,
                  style: context.textStyles.label.copyWith(
                    color: colors.pen,
                    fontSize: size * 0.17,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
