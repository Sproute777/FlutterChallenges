import 'package:flutterchallenges/navigation/routes/routes.dart';
import 'package:go_router/go_router.dart';

class GGrouter extends GoRouter {
  GGrouter() : super(routes: $appRoutes);
}
