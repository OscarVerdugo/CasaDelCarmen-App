import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static final Prefs _instance = new Prefs._internal();

  factory Prefs() {
    return _instance;
  }

  Prefs._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get userEmail {
    return _prefs.getString('userEmail');
  }

  set userEmail(String value) {
    _prefs.setString('userEmail', value);
  }

  get token {
    return _prefs.getString('token');
  }

  set token(String value) {
    _prefs.setString('token', value);
  }
}
