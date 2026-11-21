import 'package:material_ui/material_ui.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';

/// Selamlama, başlık, profil avatarı ve plan durumu satırı.
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    required this.profile,
    required this.isPro,
    required this.freeSessionsLeft,
    required this.onProfileTap,
    super.key,
  });

  final UserProfile profile;
  final bool isPro;
  final int freeSessionsLeft;
  final VoidCallback onProfileTap;

  static String initialsOf(String name) {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty);
    if (parts.isEmpty) return '';
    return parts.take(2).map((p) => p.characters.first.toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    final firstName = profile.name.trim().split(' ').first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firstName.isEmpty
                        ? l10n.homeGreetingAnonymous
                        : l10n.homeGreeting(firstName),
                    style: styles.bodySmall.copyWith(color: colors.inkMuted),
                  ),
                  const SizedBox(height: 2),
                  Text(l10n.homeTitle, style: styles.titleMedium),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Semantics(
              button: true,
              label: l10n.homeProfile,
              excludeSemantics: true,
              child: Material(
                color: colors.ink,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: onProfileTap,
                  child: SizedBox.square(
                    dimension: AppSpacing.minTouch,
                    child: Center(
                      child: initialsOf(profile.name).isEmpty
                          ? Icon(
                              Icons.person_outline_rounded,
                              color: colors.onInk,
                            )
                          : Text(
                              initialsOf(profile.name),
                              style: styles.bodySmall.copyWith(
                                color: colors.onInk,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: isPro ? colors.success : colors.pen,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              isPro ? l10n.homePro : l10n.homeFreeLeft(freeSessionsLeft),
              style: styles.label.copyWith(color: colors.inkMuted),
            ),
          ],
        ),
      ],
    );
  }
}
