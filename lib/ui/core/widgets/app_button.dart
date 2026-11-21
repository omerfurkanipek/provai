import 'package:material_ui/material_ui.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';

enum AppButtonVariant {
  /// Mürekkep siyahı dolgu: ekranın ana aksiyonu.
  primary,

  /// Çerçeveli: ikincil aksiyon.
  secondary,

  /// Kırmızı kalem dolgu: dikkat çekmesi gereken tek aksiyon (ör. Pro'ya geç).
  accent,
}

/// Uygulamanın tek buton bileşeni. Yükleniyor durumunda dokunmayı kapatır.
class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.height = 56,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final Widget? icon;
  final bool isLoading;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (background, foreground, border) = switch (variant) {
      AppButtonVariant.primary => (colors.ink, colors.onInk, null),
      AppButtonVariant.accent => (colors.pen, colors.onInk, null),
      AppButtonVariant.secondary => (
        Colors.transparent,
        colors.ink,
        BorderSide(color: colors.lineStrong),
      ),
    };
    final enabled = onPressed != null && !isLoading;

    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      excludeSemantics: true,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: TextButton(
          onPressed: enabled ? onPressed : null,
          style: TextButton.styleFrom(
            backgroundColor: background,
            foregroundColor: foreground,
            disabledBackgroundColor: background.withValues(alpha: 0.4),
            disabledForegroundColor: foreground.withValues(alpha: 0.7),
            shape: RoundedRectangleBorder(
              borderRadius: AppRadius.button,
              side: border ?? BorderSide.none,
            ),
            textStyle: context.textStyles.button,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            child: isLoading
                ? SizedBox.square(
                    key: const ValueKey('loading'),
                    dimension: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      color: foreground,
                    ),
                  )
                : Row(
                    key: const ValueKey('label'),
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (icon != null) ...[
                        IconTheme.merge(
                          data: IconThemeData(color: foreground, size: 20),
                          child: icon!,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                      ],
                      Flexible(
                        child: Text(
                          label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
