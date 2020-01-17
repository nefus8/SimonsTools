import 'package:shared_preferences/shared_preferences.dart';



Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class MySharedPreferences {

  /// ----------------------------------------------------------
  /// Method that saves/restores the preferred language
  /// ----------------------------------------------------------
  static getPreferrence(String key) async {
    return _getApplicationSavedInformation(key);
  }

  static setPreferrence(String key, String value) async {
    return _setApplicationSavedInformation(key, value);
  }

  ///
  /// Application Preferences related
  ///
  /// ----------------------------------------------------------
  /// Generic routine to fetch an application preference
  /// ----------------------------------------------------------
  static Future<String> _getApplicationSavedInformation(String name) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(name) ?? '';
  }

  /// ----------------------------------------------------------
  /// Generic routine to saves an application preference
  /// ----------------------------------------------------------
  static Future<bool> _setApplicationSavedInformation(String name, String value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(name, value);
  }
}