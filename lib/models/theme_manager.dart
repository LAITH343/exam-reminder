import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeManager {
  ThemeData theme = ThemeData.light();
  bool isDarkEnabled = false;

  Future<void> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance().then((value) => value);
    if (prefs.getBool('theme') != null){
      if (prefs.getBool('theme') == true){
        theme = ThemeData.dark();
        isDarkEnabled = true;
      }
    }
  }

  Future<bool> _setLightTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // false mean light enabled
    prefs.setBool('theme', false);
    theme = ThemeData.light();
    isDarkEnabled = false;
    return true;
  }
  
  Future<bool> _setDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // true mean dark enabled
    prefs.setBool('theme', true);
    theme = ThemeData.dark();
    isDarkEnabled = true;
    return true;
  }

  /// 1 for light theme 
  /// 
  /// 2 for dark theme
  Future<bool> setTheme(int value) async {
    switch (value) {
      case 1:
        return await _setLightTheme();
      case 2:
        return await _setDarkTheme();
      default:
        return await _setLightTheme();
    }
  }
}
