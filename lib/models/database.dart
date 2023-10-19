import 'package:exam_reminder/types.dart';
import 'package:sqlite3/sqlite3.dart';

class DataBaseManager {
  late Database db;
  DataBaseManager(String path) {
    db = sqlite3.open(path, mode: OpenMode.readWriteCreate);
    List<String> querys = [
      "PRAGMA auto_vacuum = FULL",
      """
      create table if not exists exams
      (
        eid integer primary key, 
        sname text, 
        desc text, 
        edate text
      )
      """
    ];
    for (String query in querys) {
      db.execute(query);
    }
  }

  List<Exam> getExamsByDate(String date) {
    try {
      final result = db.select(
          "select eid, sname, desc, edate from exams where edate=?", [date]);
      if (result.isEmpty) return [];
      List<Exam> exams = [];
      for (var row in result) {
        List<String> date = row['edate'].toString().split('-');
        exams.add(
          Exam(
            id: row['eid'],
            subjectName: row['sname'],
            description: row['desc'],
            date: DateTime(
              int.parse(date[0]),
              int.parse(date[1]),
              int.parse(date[2]),
            ),
          ),
        );
      }
      return exams;
    } catch (e) {
      return [];
    }
  }

  List<String> getAvalibalDates() {
    try {
      final result = db.select("select distinct edate from exams");
      if (result.isEmpty) return [];
      List<DateTime> dates = [];
      for (var row in result) {
        List<int> edate = row['edate']
            .toString()
            .split('-')
            .map((e) => int.parse(e))
            .toList();
        dates.add(DateTime(edate[0], edate[1], edate[2]));
      }
      dates.sort((a, b) => a.compareTo(b));
      return dates.map<String>((e) => "${e.year}-${e.month}-${e.day}").toList();
    } catch (e) {
      return [];
    }
  }

  bool addExam(Exam value) {
    try {
      db.execute("insert into exams (sname, desc, edate) values (?, ?, ?)", [
        value.subjectName,
        value.description,
        "${value.date.year}-${value.date.month}-${value.date.day}"
      ]);
      return true;
    } catch (e) {
      return false;
    }
  }

  Exam getExamByID(int id) {
    final result =
        db.select("select sname, desc, edate from exams where eid=?", [id]);
    List<int> edate = result[0]['edate']
        .toString()
        .split('-')
        .map(
          (e) => int.parse(e),
        )
        .toList();
    return Exam(
      id: id,
      subjectName: result[0]['sname'],
      description: result[0]['desc'],
      date: DateTime(edate[0], edate[1], edate[2]),
    );
  }

  bool deleteExam(Exam value) {
    try {
      db.execute("delete from exams where eid=?", [value.id]);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool updateExam(Exam old, Exam rep) {
    try {
      db.execute("update exams set sname=?, desc=?, edate=? where eid=?", [
        rep.subjectName,
        rep.description,
        rep.getShortDate(),
        old.id,
      ]);
      return true;
    } catch (e) {
      return false;
    }
  }
}
