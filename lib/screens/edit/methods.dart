import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/types.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// check if the any field are empty return false
/// return true if exam added
Future<bool> onEditSavePress({
  required ExamsProvider value,
  required Exam oldExam,
  required Exam newExam,
}) async {
  if (newExam.isEmpty()) {
    EasyLoading.showInfo("pls fill all fields first!");
    return false;
  }
  if (oldExam == newExam){
    EasyLoading.showInfo("cannot save, nothing has changed");
    return false;
  }
  if (value.updateExam(oldExam, newExam)) {
    EasyLoading.showSuccess("Changed");
    return true;
  } else {
    EasyLoading.showError("Failed to chnaged");
    return false;
  }
}