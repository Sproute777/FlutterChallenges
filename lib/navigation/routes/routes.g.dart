// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $hiddenDrawerRoute,
      $selectRoute,
      $travelRootRoute,
    ];

RouteBase get $hiddenDrawerRoute => GoRouteData.$route(
      path: '/hidden-drawer',
      factory: $HiddenDrawerRouteExtension._fromState,
    );

extension $HiddenDrawerRouteExtension on HiddenDrawerRoute {
  static HiddenDrawerRoute _fromState(GoRouterState state) =>
      const HiddenDrawerRoute();

  String get location => GoRouteData.$location(
        '/hidden-drawer',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $selectRoute => GoRouteData.$route(
      path: '/',
      factory: $SelectRouteExtension._fromState,
    );

extension $SelectRouteExtension on SelectRoute {
  static SelectRoute _fromState(GoRouterState state) => const SelectRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $travelRootRoute => GoRouteData.$route(
      path: '/travel-app',
      factory: $TravelRootRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'details-route',
          factory: $TravelCountryRouteExtension._fromState,
        ),
      ],
    );

extension $TravelRootRouteExtension on TravelRootRoute {
  static TravelRootRoute _fromState(GoRouterState state) =>
      const TravelRootRoute();

  String get location => GoRouteData.$location(
        '/travel-app',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TravelCountryRouteExtension on TravelCountryRoute {
  static TravelCountryRoute _fromState(GoRouterState state) =>
      TravelCountryRoute(
        $extra: state.extra as Country,
      );

  String get location => GoRouteData.$location(
        '/travel-app/details-route',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
