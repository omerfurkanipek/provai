import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';

/// "provAi" logosu ve altındaki kırmızı kalem çizgisi.
/// [progress] 0→1 arası çizginin çizilme oranı (splash animasyonu için).
class BrandWordmark extends StatelessWidget {
  const BrandWordmark({this.size = 56, this.progress = 1, super.key});

  final double size;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final style = context.textStyles.display.copyWith(
      fontSize: size,
      height: 1,
      letterSpacing: size * -0.04,
    );
    return Semantics(
      label: 'provAi',
      excludeSemantics: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'prov'),
                TextSpan(
                  text: 'Ai',
                  style: TextStyle(color: colors.pen),
                ),
              ],
            ),
            style: style,
          ),
          SizedBox(height: size * 0.12),
          CustomPaint(
            size: Size(size * 3.4, size * 0.32),
            painter: _PenStrokePainter(color: colors.pen, progress: progress),
          ),
        ],
      ),
    );
  }
}

class _PenStrokePainter extends CustomPainter {
  const _PenStrokePainter({required this.color, required this.progress});

  final Color color;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    // Hafif dalgalı, elle çekilmiş bir alt çizgi.
    final path = Path()
      ..moveTo(w * 0.02, h * 0.62)
      ..cubicTo(w * 0.21, h * 0.22, w * 0.47, h * 0.17, w * 0.68, h * 0.39)
      ..cubicTo(w * 0.80, h * 0.55, w * 0.92, h * 0.62, w * 0.98, h * 0.33);
    final metric = path.computeMetrics().first;
    final visible = metric.extractPath(0, metric.length * progress);
    canvas.drawPath(
      visible,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = h * 0.2
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_PenStrokePainter old) =>
      old.progress != progress || old.color != color;
}
