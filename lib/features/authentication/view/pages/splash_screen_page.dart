import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/view/pages/login_page.dart';
import 'package:rgc_dynamics_machine_test/main.dart';

class SplashScreenPage extends HookWidget {
  static const routePath = "/splashscreen";
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    void startSplashScreenTimer() {
      Future.delayed(const Duration(seconds: 3), () {
        // After 3 seconds, navigate to the login page

        App.navigatorKey.currentContext!.go(LoginPage.routePath);
      });
    }

    useEffect(() {
      startSplashScreenTimer();
      return null;
    }, []);
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("One1",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                    fontSize: 55)),
            Text("Menu",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 55))
          ],
        ),
      ),
    );
  }
}
