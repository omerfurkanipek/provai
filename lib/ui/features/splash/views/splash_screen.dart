import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/router/routes.dart';
import 'package:provai/ui/core/extensions/context_x.dart';
import 'package:provai/ui/core/theme/app_spacing.dart';
import 'package:provai/ui/core/widgets/brand_wordmark.dart';
import 'package:provai/ui/core/widgets/ruled_paper.dart';
import 'package:provai/ui/features/splash/view_models/splash_view_model.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashViewModelProvider, (_, next) {
      // Splash geri tuşuyla dönülecek bir ekran değil: `go` yığını değiştirir.
      switch (next.value) {
        case SplashDestination.onboarding:
          const OnboardingRoute().go(context);
        case SplashDestination.home:
          const HomeRoute().go(context);
        case null:
          break;
      }
    });

    return Scaffold(
      body: RuledPaper(
        child: SizedBox.expand(
          child: Padding(
            padding: AppSpacing.screen,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, _) =>
                      BrandWordmark(progress: value),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  context.l10n.appTagline,
                  textAlign: TextAlign.center,
                  style: context.textStyles.bodyLarge.copyWith(
                    color: context.colors.inkMuted,
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
