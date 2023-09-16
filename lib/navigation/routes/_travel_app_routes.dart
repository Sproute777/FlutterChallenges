part of 'routes.dart';

@TypedGoRoute<TravelRootRoute>(path: '/travel-app', routes: <TypedGoRoute>[
  TypedGoRoute<TravelCountryRoute>(path: 'details-route'),
])
class TravelRootRoute extends GoRouteData {
  const TravelRootRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const TravelHomeScreen();
}

class TravelCountryRoute extends GoRouteData {
  const TravelCountryRoute({required this.$extra});
  final Country $extra;

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      TravelCountryDetails(country: $extra);
}
