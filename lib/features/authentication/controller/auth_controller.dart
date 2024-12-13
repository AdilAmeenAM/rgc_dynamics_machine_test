import 'package:go_router/go_router.dart';
import 'package:rgc_dynamics_machine_test/core/utils/snackbar_utils.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/models/user_model.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/services/auth_service.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/view/pages/home_page.dart';
import 'package:rgc_dynamics_machine_test/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  UserModel? build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await AuthService.login(email, password);
      state = response;

      App.navigatorKey.currentContext!.push(HomePage.routePath);
    } catch (e) {
      SnackBarUtils.showMessage('Login failed');
    }
  }
}
