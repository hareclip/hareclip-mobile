import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ThemeNotifier notifies provider when theme mode has changed
class ThemeNotifier with ChangeNotifier {
  SharedPreferences _prefs;
  ThemeMode _mode;

  ThemeNotifier(SharedPreferences prefs) {
    _prefs = prefs;
    String themeString = _prefs.getString("theme_mode") ?? "light";
    if (themeString == "light") {
      _mode = ThemeMode.light;
    } else {
      _mode = ThemeMode.dark;
    }
  }

  ThemeMode getMode() => _mode;

  void setDarkMode() {
    _mode = ThemeMode.dark;
    _prefs.setString("theme_mode", "dark");
    notifyListeners();
  }

  void setLightMode() {
    _mode = ThemeMode.light;
    _prefs.setString("theme_mode", "light");
    notifyListeners();
  }
}
