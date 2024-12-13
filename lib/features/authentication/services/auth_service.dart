import 'package:dio/dio.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/models/user_model.dart';

class AuthService {
 static final Dio _dio = Dio();

  static Future<UserModel?> login(String email, String password) async {
    const String url = 'https://api-machine-test.hilalcart.com/login';

      final response = await _dio.post(
        url,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 && response.data['response_code'] == 200) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw Exception('Login failed.');
      }
   
  }
}
