import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = new Preferences._internal();
  factory Preferences() => _instance;

  Preferences._internal();
  SharedPreferences _prefs;

  void initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Tema de la aplicación
  String get theme => _prefs.getString('theme') ?? 'device';
  set theme(String value) => _prefs.setString('theme', value);
}
