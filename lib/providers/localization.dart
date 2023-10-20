import 'package:flutter/foundation.dart';

class AppLocalizationsUpdater extends ChangeNotifier {
  void update(){
    notifyListeners();
  }
}