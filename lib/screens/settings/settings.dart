import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/screens/settings/src/locale_selector.dart';
import 'package:exam_reminder/screens/settings/src/theme_selector.dart';
import 'package:exam_reminder/widgets/title_bar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appBarSettings),
        backgroundColor: Colors.deepPurple,
        flexibleSpace: const TitleBarWindowDraggable(),
        actions: const [
          TitleBarButtons(),
        ],
      ),
      body: const Column(
        children: [
          ThemeSelector(),
          LocalizationSelector(),
        ],
      ),
    );
  }
}


