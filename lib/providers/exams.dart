import 'package:exam_reminder/constants.dart';
import 'package:exam_reminder/types.dart';
import 'package:flutter/material.dart';

class ExamsProvider extends ChangeNotifier {
  List<String> dates = [];

  bool addExam(Exam value){
    if (mainDB.addExam(value)){
      getAvalibaleDates();
      notifyListeners();
      return true;
    }
    return false;
  }

  bool deleteExam(Exam value){
    if (mainDB.deleteExam(value)){
      getAvalibaleDates();
      notifyListeners();
      return true;
    }
    return false;
  }

  bool updateExam(Exam old, Exam replacemnt){
    if (mainDB.updateExam(old, replacemnt)){
      getAvalibaleDates();
      return true;
    }
    return false;
  }

  bool getAvalibaleDates(){
    dates = mainDB.getAvalibalDates();
    notifyListeners();
    return true;
  }

  int length() => mainDB.getAvalibalDates().length;

}