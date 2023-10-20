import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/types.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// check if the any field are empty return false
/// return true if exam added
Future<bool> onAddPress({
  required ExamsProvider value,
  required Exam exam,
  required BuildContext context,
}) async {
  if (exam.isEmpty()) {
    EasyLoading.showInfo(AppLocalizations.of(context)!.examFieldRequiredMessage);
    return false;
  }
  if (value.addExam(exam)) {
    EasyLoading.showSuccess(AppLocalizations.of(context)!.examAddedMessage);
    return true;
  } else {
    EasyLoading.showError(AppLocalizations.of(context)!.examFialedToAddMessage);
    return false;
  }
}

