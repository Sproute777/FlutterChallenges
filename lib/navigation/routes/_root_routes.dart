part of 'routes.dart';

@TypedGoRoute<SelectRoute>(path: '/')
class SelectRoute extends GoRouteData {
  const SelectRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();
}
