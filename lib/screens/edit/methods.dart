import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/types.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// check if the any field are empty return false
/// return true if exam added
Future<bool> onEditSavePress({
  required ExamsProvider value,
  required Exam oldExam,
  required Exam newExam,
  required BuildContext context,
}) async {
  if (newExam.isEmpty()) {
    EasyLoading.showInfo(AppLocalizations.of(context)!.examFieldRequiredMessage);
    return false;
  }
  if (oldExam == newExam){
    EasyLoading.showInfo(AppLocalizations.of(context)!.examEditingNoChangeMassage);
    return false;
  }
  if (value.updateExam(oldExam, newExam)) {
    EasyLoading.showSuccess(AppLocalizations.of(context)!.examEditingChangedMessage);
    return true;
  } else {
    EasyLoading.showError(AppLocalizations.of(context)!.examEditingFailedToChangeMassage);
    return false;
  }
}