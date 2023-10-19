import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/types.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// check if the any field are empty return false
/// return true if exam added
Future<bool> onAddPress({
  required ExamsProvider value,
  required Exam exam,
}) async {
  if (exam.isEmpty()) {
    EasyLoading.showInfo("pls fill all fields first!");
    return false;
  }
  if (value.addExam(exam)) {
    EasyLoading.showSuccess("Added");
    return true;
  } else {
    EasyLoading.showError("Failed to add");
    return false;
  }
}

