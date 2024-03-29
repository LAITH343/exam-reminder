import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/screens/home/home.dart';
import 'package:exam_reminder/screens/settings/src/locale_selector.dart';
import 'package:exam_reminder/screens/settings/src/theme_selector.dart';
import 'package:exam_reminder/screens/welcome/methods.dart';
import 'package:exam_reminder/widgets/title_bar.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.welcomeTitle),
        flexibleSpace: const TitleBarWindowDraggable(),
        actions: const [
          TitleBarButtons(),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        child: Text(
                          AppLocalizations.of(context)!.welcomeSubTitle,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Column(
              children: [
                ThemeSelector(),
                LocalizationSelector(),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                if (await disableWelcomeScreen()) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                }
              },
              child: Text(AppLocalizations.of(context)!.welcomeDoneButton),
            ),
          ],
        ),
      ),
    );
  }
}
