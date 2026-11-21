import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/option_tile.dart';

/// Alttan açılan tek seçim listesi. Seçilen değeri döner, kapatılırsa null.
Future<T?> showChoiceSheet<T>({
  required BuildContext context,
  required String title,
  required List<T> values,
  required T selected,
  required String Function(T value) labelOf,
  String Function(T value)? descriptionOf,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: context.colors.paper,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          0,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.textStyles.titleSmall),
            const SizedBox(height: AppSpacing.md),
            for (final value in values)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs + 2),
                child: OptionTile(
                  title: labelOf(value),
                  description: descriptionOf?.call(value),
                  selected: value == selected,
                  onTap: () => Navigator.of(context).pop(value),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
