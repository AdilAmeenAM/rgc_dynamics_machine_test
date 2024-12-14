import 'package:go_router/go_router.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/models/user_model.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/view/pages/login_page.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/view/pages/splash_screen_page.dart';
import 'package:rgc_dynamics_machine_test/features/home/models/food_product_model.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/pages/food_details_page.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/pages/home_page.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/pages/profile_page.dart';
import 'package:rgc_dynamics_machine_test/main.dart';

final router = GoRouter(
  initialLocation: SplashScreenPage.routePath,
  navigatorKey: App.navigatorKey,
  routes: [
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SplashScreenPage.routePath,
      builder: (context, state) => const SplashScreenPage(),
    ),
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) => HomePage(
        user: state.extra as UserModel,
      ),
    ),
    GoRoute(
        path: FoodDetailsPage.routePath,
        builder: (context, state) =>
            FoodDetailsPage(productModel: state.extra as FoodProductModel)),
    GoRoute(
        path: ProfilePage.routePath,
        builder: (context, state) => ProfilePage(
              user: state.extra as UserModel,
            ))
  ],
);
