import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationManager {
  Locale locale = const Locale('en', 'US');

  Future<bool> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('locale') == null){
      return true;
    }
    else if (prefs.getString('locale') == "ar"){
      locale = const Locale('ar', 'IQ');
      return true;
    }
    else {
      locale = const Locale('en', 'US');
      return true;
    }
  }

  Future<bool> setLocale(Locale value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', value.languageCode);
    locale = value;
    return true;
  }
}