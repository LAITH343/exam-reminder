import 'package:exam_reminder/constants.dart';
import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/widgets/date_picker.dart';
import 'package:exam_reminder/widgets/text_field.dart';
import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/screens/edit/methods.dart';
import 'package:exam_reminder/types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditExamScreen extends StatefulWidget {
  const EditExamScreen({super.key, required this.id});

  final int id;

  @override
  State<EditExamScreen> createState() => _EditExamScreenState();
}

class _EditExamScreenState extends State<EditExamScreen> {
  TextEditingController sNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;
  late Exam oldExam;

  void loadExamInfo() async {
    oldExam = mainDB.getExamByID(widget.id);
    sNameController.text = oldExam.subjectName;
    descController.text = oldExam.description;
    dateController.text =
        "${oldExam.date.year}-${oldExam.date.month}-${oldExam.date.day}";
    selectedDate = oldExam.date;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadExamInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(AppLocalizations.of(context)!.appBarEditExam),
      ),
      body: Consumer<ExamsProvider>(
        builder: (context, value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomInputField(
              controller: sNameController,
              helpText: AppLocalizations.of(context)!.textFieldSubjectName,
            ),
            CustomInputField(
              controller: descController,
              helpText: AppLocalizations.of(context)!.textFieldDescription,
            ),
            CustomDatePicker(
              onDateSelected: (value) {
                selectedDate = value;
              },
              controller: dateController,
              helpText: "YYYY-MM-DD",
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () async {
                if (await onEditSavePress(
                  oldExam: oldExam,
                  value: value,
                  newExam: Exam(
                    subjectName: sNameController.text,
                    description: descController.text,
                    date: selectedDate ?? DateTime(2023),
                  ),
                  context: context,
                )) {
                  Navigator.of(context).pop();
                }
              },
              child: Text(AppLocalizations.of(context)!.saveExamButton),
            )
          ],
        ),
      ),
    );
  }
}
