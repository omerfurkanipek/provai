import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/option_tile.dart';

/// Soru sayfalarının ortak iskeleti: başlık, alt başlık ve içerik.
class QuestionLayout extends StatelessWidget {
  const QuestionLayout({
    required this.title,
    required this.subtitle,
    required this.child,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textStyles.titleLarge),
          const SizedBox(height: AppSpacing.xs),
          Text(
            subtitle,
            style: context.textStyles.body.copyWith(
              color: context.colors.inkMuted,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          child,
        ],
      ),
    );
  }
}

/// Enum değerlerinden oluşan tek seçimli soru.
class ChoiceQuestion<T> extends StatelessWidget {
  const ChoiceQuestion({
    required this.title,
    required this.subtitle,
    required this.values,
    required this.selected,
    required this.labelOf,
    required this.descriptionOf,
    required this.onSelect,
    super.key,
  });

  final String title;
  final String subtitle;
  final List<T> values;
  final T selected;
  final String Function(T value) labelOf;
  final String Function(T value) descriptionOf;
  final ValueChanged<T> onSelect;

  @override
  Widget build(BuildContext context) {
    return QuestionLayout(
      title: title,
      subtitle: subtitle,
      child: Column(
        children: [
          for (final value in values)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs + 2),
              child: OptionTile(
                title: labelOf(value),
                description: descriptionOf(value),
                selected: value == selected,
                onTap: () => onSelect(value),
              ),
            ),
        ],
      ),
    );
  }
}
