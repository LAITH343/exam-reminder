import 'package:shared_preferences/shared_preferences.dart';

Future<bool> showWelcomeScreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('first_time') == null || prefs.getBool('first_time') == true){
    return true;
  }
  return false;
}

Future<bool> disableWelcomeScreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('first_time', false);
  return true;
}