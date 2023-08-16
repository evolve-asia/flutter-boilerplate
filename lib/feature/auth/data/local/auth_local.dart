import 'package:flutter_boilerplate/feature/auth/data/model/login_response.dart';

abstract class AuthLocal {
  Future<void> saveUserInfo(LoginResponse response, String password);
}
