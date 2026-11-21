import 'package:material_ui/material_ui.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/extensions/profile_labels.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/app_button.dart';
import 'package:provai/ui/core/widgets/paper_text_field.dart';

/// İsim, hedef pozisyon ve seviyeyi düzenleme. Kaydedilirse yeni profili döner.
Future<UserProfile?> showEditProfileSheet({
  required BuildContext context,
  required UserProfile profile,
}) {
  return showModalBottomSheet<UserProfile>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: context.colors.paper,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => _EditProfileForm(profile: profile),
  );
}

class _EditProfileForm extends StatefulWidget {
  const _EditProfileForm({required this.profile});

  final UserProfile profile;

  @override
  State<_EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<_EditProfileForm> {
  late final _name = TextEditingController(text: widget.profile.name);
  late final _role = TextEditingController(text: widget.profile.targetRole);
  late Seniority _seniority = widget.profile.seniority;

  @override
  void dispose() {
    _name.dispose();
    _role.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final styles = context.textStyles;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        0,
        AppSpacing.lg,
        AppSpacing.lg + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.profileEdit, style: styles.titleSmall),
            const SizedBox(height: AppSpacing.md),
            Text(l10n.profileNameLabel, style: styles.label),
            const SizedBox(height: AppSpacing.xs),
            PaperTextField(
              controller: _name,
              hint: l10n.onbNameHint,
              autofocus: false,
              textCapitalization: TextCapitalization.words,
              onChanged: (_) {},
            ),
            const SizedBox(height: AppSpacing.md),
            Text(l10n.profileRole, style: styles.label),
            const SizedBox(height: AppSpacing.xs),
            PaperTextField(
              controller: _role,
              hint: l10n.onbRoleHint,
              autofocus: false,
              textCapitalization: TextCapitalization.words,
              onChanged: (_) {},
            ),
            const SizedBox(height: AppSpacing.md),
            Text(l10n.profileSeniority, style: styles.label),
            const SizedBox(height: AppSpacing.xs),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final level in Seniority.values)
                  ChoiceChip(
                    label: Text(level.title(l10n)),
                    selected: level == _seniority,
                    onSelected: (_) => setState(() => _seniority = level),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              label: l10n.profileSave,
              onPressed: () => Navigator.of(context).pop(
                widget.profile.copyWith(
                  name: _name.text,
                  targetRole: _role.text,
                  seniority: _seniority,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
