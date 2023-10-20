import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:flutter/material.dart';

/// take date as String format YYYY-MM-DD
///
/// parse it and return the date with the name of day
String parseDate(String date, BuildContext context) {
  List<String> sDate = date.split('-');
  DateTime current = DateTime(
    int.parse(sDate[0]),
    int.parse(sDate[1]),
    int.parse(sDate[2]),
  );
  DateTime now = DateTime.now();
  Map<int, String> dayOfWeek = {
    1: AppLocalizations.of(context)!.monday,
    2: AppLocalizations.of(context)!.tuesday,
    3: AppLocalizations.of(context)!.wednesday,
    4: AppLocalizations.of(context)!.thursday,
    5: AppLocalizations.of(context)!.friday,
    6: AppLocalizations.of(context)!.saturday,
    7: AppLocalizations.of(context)!.sunday,
  };
  if (now.year == current.year &&
      now.month == current.month &&
      now.day == current.day) {
    return "$date (${AppLocalizations.of(context)!.today})";
  } else {
    return "$date (${dayOfWeek[current.weekday]})";
  }
}
