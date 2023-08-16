import 'package:flutter_boilerplate/di/service_locator.dart';
import 'package:flutter_boilerplate/feature/auth/data/auth_repository.dart';
import 'package:flutter_boilerplate/feature/auth/data/model/login_request.dart';
import 'package:flutter_boilerplate/feature/auth/data/model/login_response.dart';
import 'package:flutter_boilerplate/feature/auth/data/remote/auth_remote.dart';

import 'local/auth_local.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocal _authLocalImpl = locator<AuthLocal>();
  final AuthRemote _loginRemoteImpl = locator<AuthRemote>();

  @override
  Future<LoginResponse> loginGql(LoginRequest request) async {
    var response = await _loginRemoteImpl.loginGql(
        request.username, request.password, request.apkVersion);
    _authLocalImpl.saveUserInfo(response, request.password);
    return response;
  }
}
