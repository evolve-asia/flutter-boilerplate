import 'package:flutter_boilerplate/storage/pref_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sharedPrefManager = GetIt.instance;

class SharedPrefManager {
  static SharedPrefManager? _instance;
  static SharedPreferences? _sharedPref;
  static var flutterSecureStorage = const FlutterSecureStorage();

  static Future<SharedPrefManager> getInstance() async {
    _sharedPref ??= await SharedPreferences.getInstance();
    return _instance ??= SharedPrefManager();
  }

  void setUserId(int userId) {
    _sharedPref?.setInt(PreferenceConstants.PREF_USER_ID, userId);
  }

  int? getUserId() {
    return _sharedPref?.getInt(PreferenceConstants.PREF_USER_ID);
  }

  void setAccessToken(String token) {
    _sharedPref?.setString(PreferenceConstants.PREF_ACCESS_TOKEN, token);
  }

  String? getAccessToken() {
    return _sharedPref?.getString(PreferenceConstants.PREF_ACCESS_TOKEN);
  }

  void setRefreshToken(String token) {
    _sharedPref?.setString(PreferenceConstants.PREF_REFRESH_TOKEN, token);
  }

  String? getRefreshToken() {
    return _sharedPref?.getString(PreferenceConstants.PREF_REFRESH_TOKEN);
  }

  Future<void> setPin(String pin) {
    return flutterSecureStorage.write(
        key: PreferenceConstants.PREF_PASSWORD, value: pin);
  }

  Future<String?> getPin() {
    return flutterSecureStorage.read(key: PreferenceConstants.PREF_PASSWORD);
  }
}
