import 'package:flutter_boilerplate/feature/auth/data/model/login_response.dart';

abstract class AuthRemote {
  Future<LoginResponse> loginGql(
      String username, String password, String apkVersion);
}
