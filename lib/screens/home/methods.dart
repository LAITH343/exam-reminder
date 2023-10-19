/// take date as String format YYYY-MM-DD
///
/// parse it and return the date with the name of day
String parseDate(String date) {
  List<String> sDate = date.split('-');
  DateTime current = DateTime(
    int.parse(sDate[0]),
    int.parse(sDate[1]),
    int.parse(sDate[2]),
  );
  DateTime now = DateTime.now();
  Map<int, String> dayOfWeek = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday",
  };
  if (now.year == current.year &&
      now.month == current.month &&
      now.day == current.day) {
    return "$date (Today)";
  } else {
    return "$date (${dayOfWeek[current.weekday]})";
  }
}
