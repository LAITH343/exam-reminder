import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/screens/add/add_exam.dart';
import 'package:exam_reminder/screens/home/src/tabs.dart';
import 'package:exam_reminder/screens/home/src/body.dart';
import 'package:exam_reminder/screens/home/src/drawer.dart';
import 'package:exam_reminder/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExamsProvider>(
      builder: (context, value, child) => DefaultTabController(
        length: value.length(),
        child: Scaffold(
          drawer: const HomeScreenDrawer(),
          appBar: AppBar(
            bottom: getTabBar(value, context),
            title: TitleBarWindowDraggable(
              child: Text(AppLocalizations.of(context)!.appBarHome),
            ),
            backgroundColor: Colors.deepPurple,
            flexibleSpace: const TitleBarWindowDraggable(),
            actions: const [
              TitleBarButtons(),
            ],
          ),
          body: HomeScreenBody(
            value: value,
          ),
          floatingActionButton: const FloatingAddButton(),
        ),
      ),
    );
  }
}

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const AddExamScreen()),
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
