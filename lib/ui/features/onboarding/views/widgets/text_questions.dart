import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/paper_text_field.dart';
import 'package:provai/ui/features/onboarding/views/widgets/question_layout.dart';

/// İsim sorusu (opsiyonel).
class NameQuestion extends StatefulWidget {
  const NameQuestion({
    required this.initialValue,
    required this.onChanged,
    required this.onSubmitted,
    super.key,
  });

  final String initialValue;
  final ValueChanged<String> onChanged;
  final VoidCallback onSubmitted;

  @override
  State<NameQuestion> createState() => _NameQuestionState();
}

class _NameQuestionState extends State<NameQuestion> {
  late final _controller = TextEditingController(text: widget.initialValue);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return QuestionLayout(
      title: l10n.onbNameTitle,
      subtitle: l10n.onbNameSubtitle,
      child: PaperTextField(
        controller: _controller,
        hint: l10n.onbNameHint,
        textCapitalization: TextCapitalization.words,
        onChanged: widget.onChanged,
        onSubmitted: (_) => widget.onSubmitted(),
      ),
    );
  }
}

/// Hedef pozisyon sorusu: serbest metin + hızlı seçim etiketleri.
class RoleQuestion extends StatefulWidget {
  const RoleQuestion({
    required this.initialValue,
    required this.onChanged,
    required this.onSubmitted,
    super.key,
  });

  final String initialValue;
  final ValueChanged<String> onChanged;
  final VoidCallback onSubmitted;

  @override
  State<RoleQuestion> createState() => _RoleQuestionState();
}

class _RoleQuestionState extends State<RoleQuestion> {
  late final _controller = TextEditingController(text: widget.initialValue);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _pick(String role) {
    _controller.value = TextEditingValue(
      text: role,
      selection: TextSelection.collapsed(offset: role.length),
    );
    widget.onChanged(role);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final suggestions = [
      l10n.onbRoleMobile,
      l10n.onbRoleBackend,
      l10n.onbRoleFrontend,
      l10n.onbRoleProduct,
      l10n.onbRoleData,
      l10n.onbRoleDesign,
    ];
    return QuestionLayout(
      title: l10n.onbRoleTitle,
      subtitle: l10n.onbRoleSubtitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaperTextField(
            controller: _controller,
            hint: l10n.onbRoleHint,
            textCapitalization: TextCapitalization.words,
            onChanged: widget.onChanged,
            onSubmitted: (_) => widget.onSubmitted(),
          ),
          const SizedBox(height: AppSpacing.md),
          ListenableBuilder(
            listenable: _controller,
            builder: (context, _) => Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final role in suggestions)
                  _RoleChip(
                    label: role,
                    selected: _controller.text.trim() == role,
                    onTap: () => _pick(role),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RoleChip extends StatelessWidget {
  const _RoleChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        color: selected ? colors.ink : Colors.transparent,
        shape: StadiumBorder(
          side: BorderSide(color: selected ? colors.ink : colors.lineStrong),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: AppSpacing.minTouch),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Center(
                widthFactor: 1,
                child: Text(
                  label,
                  style: context.textStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: selected ? colors.onInk : colors.ink,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
