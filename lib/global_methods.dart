import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<String> getMainStoragePath() async {
  return (await getApplicationSupportDirectory()).path;
}

/// check if typed date is valid or not
bool isDateValid(List<String> sdate) {
  if (sdate.length == 3 &&
      sdate[0].length == 4 &&
      sdate[1].length == 2 &&
      sdate[2].isNotEmpty &&
      int.tryParse(sdate[0]) != null &&
      int.tryParse(sdate[1]) != null &&
      int.tryParse(sdate[2]) != null) {
    if (DateTime(
          int.parse(sdate[0]),
          int.parse(sdate[1]),
          int.parse(sdate[2]),
        ).compareTo(DateTime(2023)) <= 0) {
      return false;
    }
    return true;
  } else {
    return false;
  }
}

/// return true if date set
Future<bool> onSelectDatePressed(
    BuildContext context,
    void Function(DateTime) onDateSelected,
    TextEditingController controller) async {
  DateTime? result = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2023),
    currentDate: DateTime.now(),
    lastDate: DateTime(
      DateTime.now().year + 1,
    ),
  );
  if (result != null) {
    controller.text = "${result.year}-${result.month}-${result.day}";
    onDateSelected(result);
    return true;
  } else {
    return false;
  }
}

bool isPlatformDesktop() => Platform.isLinux || Platform.isMacOS || Platform.isWindows;
