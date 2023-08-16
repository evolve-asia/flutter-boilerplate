import 'package:flutter_boilerplate/feature/auth/data/model/login_request.dart';
import 'package:flutter_boilerplate/feature/auth/data/model/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> loginGql(LoginRequest request);
}
