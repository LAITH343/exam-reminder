import 'package:exam_reminder/widgets/date_picker.dart';
import 'package:exam_reminder/widgets/text_field.dart';
import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/screens/add/methods.dart';
import 'package:exam_reminder/types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddExamScreen extends StatefulWidget {
  const AddExamScreen({super.key});

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  TextEditingController sNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Add Exam"),
      ),
      body: Consumer<ExamsProvider>(
        builder: (context, value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomInputField(
              controller: sNameController,
              helpText: "Subject Name",
            ),
            CustomInputField(
              controller: descController,
              helpText: "description",
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
                if (await onAddPress(
                  value: value,
                  exam: Exam(
                    subjectName: sNameController.text,
                    description: descController.text,
                    date: selectedDate ?? DateTime(2023),
                  ),
                )) {
                  sNameController.text = "";
                  descController.text = "";
                  dateController.text = "";
                  selectedDate = null;
                  setState(() {});
                }
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
