import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';

/// Kâğıt kart görünümlü metin alanı.
class PaperTextField extends StatelessWidget {
  const PaperTextField({
    required this.controller,
    required this.hint,
    required this.onChanged,
    this.onSubmitted,
    this.textCapitalization = TextCapitalization.none,
    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    OutlineInputBorder border(Color color) => OutlineInputBorder(
      borderRadius: AppRadius.button,
      borderSide: BorderSide(color: color, width: 1.5),
    );
    return TextField(
      controller: controller,
      autofocus: true,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.next,
      textCapitalization: textCapitalization,
      style: context.textStyles.bodyLarge,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: context.textStyles.bodyLarge.copyWith(
          color: colors.inkSubtle,
        ),
        filled: true,
        fillColor: colors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        enabledBorder: border(colors.lineStrong),
        focusedBorder: border(colors.ink),
      ),
    );
  }
}
