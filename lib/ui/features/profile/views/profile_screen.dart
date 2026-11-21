import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/router/routes.dart';
import 'package:provai/config/app_links.dart';
import 'package:provai/data/services/http_inspector.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/extensions/profile_labels.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/theme/locale_controller.dart';
import 'package:provai/ui/core/theme/theme_mode_controller.dart';
import 'package:provai/ui/core/widgets/choice_sheet.dart';
import 'package:provai/ui/core/widgets/circle_icon_button.dart';
import 'package:provai/ui/core/widgets/pen_icons.dart';
import 'package:provai/ui/features/home/views/widgets/home_header.dart';
import 'package:provai/ui/features/profile/view_models/profile_state.dart';
import 'package:provai/ui/features/profile/view_models/profile_view_model.dart';
import 'package:provai/ui/features/profile/views/widgets/edit_profile_sheet.dart';
import 'package:provai/ui/features/profile/views/widgets/settings_row.dart';
import 'package:provai/ui/features/profile/views/widgets/subscription_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Future<void> _confirmReset(
    BuildContext context,
    ProfileViewModel viewModel,
  ) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.profileResetTitle),
        content: Text(l10n.profileResetBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.profileCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: context.colors.pen),
            child: Text(l10n.profileResetConfirm),
          ),
        ],
      ),
    );
    if (!(confirmed ?? false)) return;
    await viewModel.resetData();
    if (context.mounted) const SplashRoute().go(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(profileViewModelProvider.notifier);
    ref.listen(profileViewModelProvider.select((s) => s.effect), (_, effect) {
      if (effect == null) return;
      final l10n = context.l10n;
      switch (effect) {
        case ProfileEffectRestored(:final found):
          context.showMessage(
            found ? l10n.profileRestored : l10n.paywallNothingToRestore,
          );
        case ProfileEffectUpdated():
          context.showMessage(l10n.profileUpdated);
      }
      viewModel.consumeEffect();
    });

    final state = ref.watch(profileViewModelProvider);
    final themeMode = ref.watch(themeModeControllerProvider);
    final locale = ref.watch(localeControllerProvider);
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    final profile = state.profile;
    final initials = HomeHeader.initialsOf(profile.name);
    final dateFormat = DateFormat.yMMMd(l10n.localeName);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.xs,
            AppSpacing.lg,
            AppSpacing.xl,
          ),
          children: [
            Row(
              children: [
                CircleIconButton(
                  icon: PenIcons.back,
                  semanticLabel: l10n.commonBack,
                  onPressed: () => context.pop(),
                ),
                Expanded(
                  child: Text(
                    l10n.profileTitle,
                    textAlign: TextAlign.center,
                    style: styles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.minTouch),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: colors.ink,
                  child: initials.isEmpty
                      ? Icon(Icons.person_outline_rounded, color: colors.onInk)
                      : Text(
                          initials,
                          style: styles.titleSmall.copyWith(
                            color: colors.onInk,
                          ),
                        ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.name.isEmpty
                            ? l10n.profileNameFallback
                            : profile.name,
                        style: styles.titleSmall,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${profile.targetRole} · ${profile.seniority.title(l10n)}',
                        style: styles.label.copyWith(color: colors.inkMuted),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () async {
                    final updated = await showEditProfileSheet(
                      context: context,
                      profile: profile,
                    );
                    if (updated != null) {
                      await viewModel.updateProfile(updated);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: colors.ink,
                    side: BorderSide(color: colors.lineStrong),
                    minimumSize: const Size(0, 40),
                  ),
                  child: Text(l10n.profileEdit),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            SubscriptionCard(
              status: state.subscription,
              freeSessionsLeft: state.freeSessionsLeft,
              dateFormat: dateFormat,
              onUpgrade: () => unawaited(
                const PaywallRoute(placement: PaywallPlacement.profileUpgrade)
                    .push<bool>(context),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: _StatTile(
                    value: '${state.completedSessions}',
                    label: l10n.profileCompleted,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _StatTile(
                    value: state.averageScore?.toString() ?? '–',
                    label: l10n.profileAverage,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            SettingsRow(
              label: l10n.profileInterviewLanguage,
              value: profile.interviewLanguage.title(l10n),
              onTap: () async {
                final picked = await showChoiceSheet(
                  context: context,
                  title: l10n.profileInterviewLanguage,
                  values: InterviewLanguage.values,
                  selected: profile.interviewLanguage,
                  labelOf: (v) => v.title(l10n),
                  descriptionOf: (v) => v.description(l10n),
                );
                if (picked != null) {
                  await viewModel.updateProfile(
                    profile.copyWith(interviewLanguage: picked),
                  );
                }
              },
            ),
            SettingsRow(
              label: l10n.profileTheme,
              value: _themeLabel(context, themeMode),
              onTap: () async {
                final picked = await showChoiceSheet(
                  context: context,
                  title: l10n.profileTheme,
                  values: ThemeMode.values,
                  selected: themeMode,
                  labelOf: (v) => _themeLabel(context, v),
                );
                if (picked != null) {
                  await ref
                      .read(themeModeControllerProvider.notifier)
                      .select(picked);
                }
              },
            ),
            SettingsRow(
              label: l10n.profileAppLanguage,
              value: _localeLabel(context, locale),
              onTap: () async {
                // Sentinel: "cihaz dili" seçimi null ile ifade edilemez (iptal de null).
                const system = Locale('und');
                final picked = await showChoiceSheet<Locale>(
                  context: context,
                  title: l10n.profileAppLanguage,
                  values: const [system, Locale('tr'), Locale('en')],
                  selected: locale ?? system,
                  labelOf: (v) => _localeLabel(context, v == system ? null : v),
                );
                if (picked != null) {
                  await ref
                      .read(localeControllerProvider.notifier)
                      .select(picked == system ? null : picked);
                }
              },
            ),
            SettingsRow(
              label: l10n.profileRestore,
              isLoading: state.isRestoring,
              onTap: viewModel.restore,
            ),
            SettingsRow(
              label: l10n.profileTerms,
              onTap: () =>
                  launchUrl(AppLinks.terms, mode: LaunchMode.inAppBrowserView),
            ),
            SettingsRow(
              label: l10n.profilePrivacy,
              onTap: () => launchUrl(
                AppLinks.privacy,
                mode: LaunchMode.inAppBrowserView,
              ),
            ),
            // Yalnızca debug build: Chucker benzeri HTTP inspector.
            if (ref.watch(httpInspectorProvider) case final inspector?)
              SettingsRow(
                label: l10n.profileNetworkInspector,
                onTap: inspector.showInspector,
              ),
            SettingsRow(
              label: l10n.profileReset,
              destructive: true,
              onTap: () => _confirmReset(context, viewModel),
            ),
            const SizedBox(height: AppSpacing.lg),
            if (state.version.isNotEmpty)
              Text(
                l10n.profileVersion(state.version),
                textAlign: TextAlign.center,
                style: styles.label.copyWith(color: colors.inkSubtle),
              ),
          ],
        ),
      ),
    );
  }

  String _themeLabel(BuildContext context, ThemeMode mode) => switch (mode) {
    ThemeMode.system => context.l10n.themeSystem,
    ThemeMode.light => context.l10n.themeLight,
    ThemeMode.dark => context.l10n.themeDark,
  };

  String _localeLabel(BuildContext context, Locale? locale) =>
      switch (locale?.languageCode) {
        'tr' => 'Türkçe',
        'en' => 'English',
        _ => context.l10n.appLanguageSystem,
      };
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: colors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: context.textStyles.titleMedium),
          Text(
            label,
            style: context.textStyles.label.copyWith(color: colors.inkMuted),
          ),
        ],
      ),
    );
  }
}
