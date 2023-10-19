class Exam {
  int? id;
  String subjectName;
  String description;
  DateTime date;
  Exam({
    this.id,
    required this.subjectName,
    required this.description,
    required this.date,
  });

  String getShortDate() => "${date.year}-${date.month}-${date.day}";

  bool isEmpty() {
    if (subjectName == "" ||
        description == "" ||
        date.compareTo(DateTime(2023)) <= 0) {
      return true;
    }
    return false;
  }

  bool isNotEmpty() => !isEmpty();

  @override
  bool operator ==(covariant Exam other) {
    if (date == other.date &&
        subjectName == other.subjectName &&
        description == other.description) {
      return true;
    }
    return false;
  }
}
