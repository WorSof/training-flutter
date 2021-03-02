import 'package:flutter/material.dart';
import 'package:hola_mundo/src/preferences.dart';
import 'package:hola_mundo/src/themes/dark.dart';
import 'package:hola_mundo/src/themes/light.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData getTheme(String theme, Brightness deviceBrightness) {
    ThemeData response;

    if (theme == 'device') {
      response = (deviceBrightness == Brightness.dark)
          ? themeDataDark
          : themeDataLight;
    } else {
      response = (theme == 'dark') ? themeDataDark : themeDataLight;
    }

    return response;
  }

  void setTheme(Brightness deviceBrightness) {
    final Preferences _prefs = Preferences();

    if (_prefs.theme == 'device') {
      _prefs.theme = (deviceBrightness == Brightness.dark) ? 'light' : 'dark';
    } else {
      _prefs.theme = (_prefs.theme == 'light') ? 'dark' : 'light';
    }

    notifyListeners();
  }
}
