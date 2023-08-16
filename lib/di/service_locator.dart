import 'package:flutter_boilerplate/feature/auth/data/auth_repository.dart';
import 'package:flutter_boilerplate/feature/auth/data/auth_repository_impl.dart';
import 'package:flutter_boilerplate/feature/auth/data/local/auth_local_impl.dart';
import 'package:flutter_boilerplate/feature/auth/data/remote/auth_remote_impl.dart';
import 'package:flutter_boilerplate/feature/auth/screens/login/login_viewmodel.dart';
import 'package:get_it/get_it.dart';

import '../feature/auth/data/local/auth_local.dart';
import '../feature/auth/data/remote/auth_remote.dart';
import '../storage/db_manager.dart';
import '../storage/shared_pref_manager.dart';

GetIt locator = GetIt.instance;

Future setUpServiceLocator() async {
  var sharedPrefManager = await SharedPrefManager.getInstance();
  locator.registerLazySingleton<SharedPrefManager>(() => sharedPrefManager);

  var databaseManager = await DatabaseManager.getDbInstance();
  locator.registerLazySingleton(() => databaseManager);

  locator.registerLazySingleton<AuthLocal>(() => AuthLocalImpl());
  locator.registerLazySingleton<AuthRemote>(() => AuthRemoteImpl());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
}
