import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  //inisialisasi shared preference

  static final PreferenceHandler _instance = PreferenceHandler._internal();
  late SharedPreferences _preferences;
  factory PreferenceHandler() => _instance;
  PreferenceHandler._internal();
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //key user
  static const String _isLogin = 'isLogin';

  //create
  Future<void> storingIsLogin(bool isLogin) async {
    _preferences.setBool(_isLogin, isLogin);
  }

  //get
  static Future<bool?> getIsLogin() async {
    final prefs = await SharedPreferences.getInstance();

    var data = prefs.getBool(_isLogin);
    return data;
  }

  //delete
  Future<void> deleteIsLogin(bool isLogin) async {
    await _preferences.remove(_isLogin);
  }
}
