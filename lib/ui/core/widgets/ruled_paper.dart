import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';

/// Defter çizgisi arka planı. Kırmızı Kalem dilinin imza dokusu:
/// splash zemininde ve cevap/ilan alanlarının arkasında kullanılır.
class RuledPaper extends StatelessWidget {
  const RuledPaper({
    required this.child,
    this.lineSpacing = 40,
    this.lineColor,
    this.offset = 0,
    super.key,
  });

  final Widget child;
  final double lineSpacing;
  final Color? lineColor;

  /// İlk çizginin dikey kayması; metnin satırlarıyla hizalamak için.
  final double offset;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RuledPainter(
        spacing: lineSpacing,
        color: lineColor ?? context.colors.ruled,
        offset: offset,
      ),
      child: child,
    );
  }
}

class _RuledPainter extends CustomPainter {
  const _RuledPainter({
    required this.spacing,
    required this.color,
    required this.offset,
  });

  final double spacing;
  final Color color;
  final double offset;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    for (var y = offset + spacing; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_RuledPainter old) =>
      old.spacing != spacing || old.color != color || old.offset != offset;
}
