import 'package:exam_reminder/constants.dart';
import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/screens/edit/edit_exam.dart';
import 'package:exam_reminder/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    required this.value,
    super.key,
  });

  final ExamsProvider value;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: value.length() != 0,
      replacement: Center(
        child: Text(AppLocalizations.of(context)!.noExams),
      ),
      child: TabBarView(
        children: [
          for (int i = 0; i < value.dates.length; i++)
            ExamListView(
              i: i,
            ),
        ],
      ),
    );
  }
}

class ExamListView extends StatefulWidget {
  const ExamListView({
    required this.i,
    super.key,
  });

  final int i;

  @override
  State<ExamListView> createState() => _ExamListViewState();
}

class _ExamListViewState extends State<ExamListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExamsProvider>(builder: (context, value, child) {
      final exams = mainDB.getExamsByDate(value.dates[widget.i]);
      return ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) => ExamCard(
          exam: exams[index],
        ),
      );
    });
  }
}

class ExamCard extends StatelessWidget {
  const ExamCard({
    required this.exam,
    super.key,
  });

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Text(
                          exam.subjectName,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Text(
                          exam.description,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => EditExamScreen(id: exam.id!),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Are You Sure"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          final p = Provider.of<ExamsProvider>(
                                              context,
                                              listen: false);
                                          if (p.deleteExam(exam)) {
                                            EasyLoading.showSuccess("Deleted");
                                            Navigator.of(context).pop();
                                          } else {
                                            EasyLoading.showError(
                                                "Failed to delete");
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        child: const Text("Yes")),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("No"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
