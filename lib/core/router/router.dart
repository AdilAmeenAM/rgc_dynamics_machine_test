import 'package:go_router/go_router.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/view/pages/home_page.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/view/pages/login_page.dart';
import 'package:rgc_dynamics_machine_test/main.dart';

final router = GoRouter(
  initialLocation: HomePage.routePath,
  navigatorKey: App.navigatorKey,
  routes: [
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) => const HomePage(),
    )
  ],
);
