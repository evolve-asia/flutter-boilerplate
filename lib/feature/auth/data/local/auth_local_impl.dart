import 'package:flutter_boilerplate/di/service_locator.dart';
import 'package:flutter_boilerplate/feature/auth/data/local/auth_local.dart';
import 'package:flutter_boilerplate/feature/auth/data/model/login_response.dart';

import '../../../../storage/db_manager.dart';
import '../../../../storage/shared_pref_manager.dart';
import '../mapper/login_mapper.dart';

class AuthLocalImpl implements AuthLocal {
  final SharedPrefManager sharedPrefManager = locator<SharedPrefManager>();
  final DatabaseManager databaseManager = locator<DatabaseManager>();

  @override
  Future<void> saveUserInfo(LoginResponse response, String password) async {
    sharedPrefManager.setAccessToken(response.token);
    sharedPrefManager.setUserId(response.user.id);
    await sharedPrefManager.setPin(password);
    await databaseManager.getUserDao().insert(LoginMapper.mapToLocal(response));
  }
}
