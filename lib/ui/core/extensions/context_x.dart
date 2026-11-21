import 'package:material_ui/material_ui.dart';
import 'package:provai/l10n/gen/app_localizations.dart';
import 'package:provai/ui/core/theme/app_colors.dart';
import 'package:provai/ui/core/theme/app_typography.dart';

/// Tema token'larına ve çevirilere kısa erişim.
extension ContextX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
  AppTypography get textStyles => Theme.of(this).extension<AppTypography>()!;
  AppLocalizations get l10n => AppLocalizations.of(this);

  void showMessage(String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
