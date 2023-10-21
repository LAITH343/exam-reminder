import 'package:exam_reminder/constants.dart';
import 'package:exam_reminder/global_methods.dart';
import 'package:exam_reminder/models/database.dart';
import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/screens/home/home.dart';
import 'package:exam_reminder/screens/welcome/methods.dart';
import 'package:exam_reminder/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

Future<void> onStart(BuildContext context) async {
  String path = await getMainStoragePath();
  mainDB = DataBaseManager(join(path, "main.db"));
  final p = Provider.of<ExamsProvider>(context, listen: false);
  p.getAvalibaleDates();
  if (await showWelcomeScreen()) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
    );
  } else {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }
}
