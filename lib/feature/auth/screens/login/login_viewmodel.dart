import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/di/service_locator.dart';
import 'package:flutter_boilerplate/feature/auth/data/auth_repository.dart';
import 'package:flutter_boilerplate/feature/auth/data/model/login_request.dart';
import 'package:flutter_boilerplate/feature/auth/data/model/login_response.dart';

import '../../../../utils/error_message_factory.dart';
import '../../../../utils/response.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository loginRepository = locator<AuthRepository>();
  late LoginResponse loginResponse;

  Response<LoginResponse> loginUseCase = Response<LoginResponse>();

  void setLoginUseCase(Response<LoginResponse> response) {
    loginUseCase = response;
    notifyListeners();
  }

  Future<void> login(LoginRequest request) async {
    setLoginUseCase(Response.loading<LoginResponse>());
    try {
      loginResponse = await loginRepository.loginGql(request);
      setLoginUseCase(Response.complete<LoginResponse>(loginResponse));
    } on Exception catch (exception) {
      setLoginUseCase(Response.error<LoginResponse>(
          ErrorMessageFactory.createMessage(exception)));
    }
  }
}
