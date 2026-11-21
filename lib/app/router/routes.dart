import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/ui/features/home/views/home_screen.dart';
import 'package:provai/ui/features/onboarding/views/onboarding_screen.dart';
import 'package:provai/ui/features/paywall/views/paywall_screen.dart';
import 'package:provai/ui/features/profile/views/profile_screen.dart';
import 'package:provai/ui/features/result/views/result_screen.dart';
import 'package:provai/ui/features/session/views/session_screen.dart';
import 'package:provai/ui/features/splash/views/splash_screen.dart';

part 'routes.g.dart';

// Typed route'lar: string path ile navigation yapılmaz, `const HomeRoute().go(context)`.

@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

@TypedGoRoute<OnboardingRoute>(path: '/onboarding')
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingScreen();
}

@TypedGoRoute<PaywallRoute>(path: '/paywall/:placement')
class PaywallRoute extends GoRouteData with $PaywallRoute {
  const PaywallRoute({required this.placement});

  final PaywallPlacement placement;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // Onboarding sonundaki paywall akışın parçası; diğerleri modal olarak açılır.
    return MaterialPage(
      fullscreenDialog: placement != PaywallPlacement.onboarding,
      child: PaywallScreen(placement: placement),
    );
  }
}

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<SessionRoute>(path: '/session/:sessionId')
class SessionRoute extends GoRouteData with $SessionRoute {
  const SessionRoute({required this.sessionId});

  final String sessionId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SessionScreen(sessionId: sessionId);
}

@TypedGoRoute<ResultRoute>(path: '/result/:sessionId')
class ResultRoute extends GoRouteData with $ResultRoute {
  const ResultRoute({required this.sessionId});

  final String sessionId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ResultScreen(sessionId: sessionId);
}

@TypedGoRoute<ProfileRoute>(path: '/profile')
class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileScreen();
}
