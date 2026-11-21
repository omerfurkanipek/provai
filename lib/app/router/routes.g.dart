// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $splashRoute,
  $onboardingRoute,
  $paywallRoute,
  $homeRoute,
  $sessionRoute,
  $resultRoute,
  $profileRoute,
];

RouteBase get $splashRoute => GoRouteData.$route(
  path: '/',
  hasOverriddenOnExit: false,
  factory: $SplashRoute._fromState,
);

mixin $SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboardingRoute => GoRouteData.$route(
  path: '/onboarding',
  hasOverriddenOnExit: false,
  factory: $OnboardingRoute._fromState,
);

mixin $OnboardingRoute on GoRouteData {
  static OnboardingRoute _fromState(GoRouterState state) =>
      const OnboardingRoute();

  @override
  String get location => GoRouteData.$location('/onboarding');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $paywallRoute => GoRouteData.$route(
  path: '/paywall/:placement',
  hasOverriddenOnExit: false,
  factory: $PaywallRoute._fromState,
);

mixin $PaywallRoute on GoRouteData {
  static PaywallRoute _fromState(GoRouterState state) => PaywallRoute(
    placement: _$PaywallPlacementEnumMap._$fromName(
      state.pathParameters['placement']!,
    )!,
  );

  PaywallRoute get _self => this as PaywallRoute;

  @override
  String get location => GoRouteData.$location(
    '/paywall/${Uri.encodeComponent(_$PaywallPlacementEnumMap[_self.placement]!)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

const _$PaywallPlacementEnumMap = {
  PaywallPlacement.onboarding: 'onboarding',
  PaywallPlacement.freeLimit: 'free-limit',
  PaywallPlacement.profileUpgrade: 'profile-upgrade',
};

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
}

RouteBase get $homeRoute => GoRouteData.$route(
  path: '/home',
  hasOverriddenOnExit: false,
  factory: $HomeRoute._fromState,
);

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $sessionRoute => GoRouteData.$route(
  path: '/session/:sessionId',
  hasOverriddenOnExit: false,
  factory: $SessionRoute._fromState,
);

mixin $SessionRoute on GoRouteData {
  static SessionRoute _fromState(GoRouterState state) =>
      SessionRoute(sessionId: state.pathParameters['sessionId']!);

  SessionRoute get _self => this as SessionRoute;

  @override
  String get location =>
      GoRouteData.$location('/session/${Uri.encodeComponent(_self.sessionId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $resultRoute => GoRouteData.$route(
  path: '/result/:sessionId',
  hasOverriddenOnExit: false,
  factory: $ResultRoute._fromState,
);

mixin $ResultRoute on GoRouteData {
  static ResultRoute _fromState(GoRouterState state) =>
      ResultRoute(sessionId: state.pathParameters['sessionId']!);

  ResultRoute get _self => this as ResultRoute;

  @override
  String get location =>
      GoRouteData.$location('/result/${Uri.encodeComponent(_self.sessionId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileRoute => GoRouteData.$route(
  path: '/profile',
  hasOverriddenOnExit: false,
  factory: $ProfileRoute._fromState,
);

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  @override
  String get location => GoRouteData.$location('/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
