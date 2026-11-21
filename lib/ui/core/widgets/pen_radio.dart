import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';

/// Kırmızı kalemli radyo işareti (tek seçimli listelerde).
class PenRadio extends StatelessWidget {
  const PenRadio({required this.selected, super.key});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 160),
      width: 22,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? colors.pen : colors.radioOff,
          width: 2,
        ),
      ),
      child: AnimatedScale(
        scale: selected ? 1 : 0,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutBack,
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: colors.pen, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
