part of 'routes.dart';

@TypedGoRoute<HiddenDrawerRoute>(path: '/hidden-drawer')
class HiddenDrawerRoute extends GoRouteData {
  const HiddenDrawerRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HiddenMenuBottomBarFab();
}
