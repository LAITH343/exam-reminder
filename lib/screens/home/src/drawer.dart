import 'package:exam_reminder/constants.dart';
import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/providers/updater.dart';
import 'package:exam_reminder/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppUpdater>(
      builder: (context, value, child) => Drawer(
          child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .90,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomDrawerButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        title: AppLocalizations.of(context)!.drawerClose,
                        icon: Icons.close,
                      ),
                      const Divider(),
                      CustomDrawerButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const SettingsScreen(),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.drawerSettings,
                        icon: Icons.settings_outlined,
                      ),
                      const Divider(),
                      CustomDrawerButton(
                        onPressed: () async {
                          await launchUrl(
                            Uri.parse(
                              appSourceCodeURL,
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.drawerSourceCode,
                        icon: Icons.launch,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("v$appVersion"),
                ),
                TextButton(
                  onPressed: () async {
                    await launchUrl(
                      Uri.parse(
                        "https://github.com/LAITH343",
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "@LAITH343",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({
    required this.onPressed,
    required this.title,
    required this.icon,
    super.key,
  });

  final void Function()? onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(themeManager.isDarkEnabled
            ? Colors.white.withOpacity(0.1)
            : Colors.black.withOpacity(0.1)),
      ),
      onPressed: onPressed,
      child: ListTile(
        leading: Icon(
          icon,
          color: themeManager.isDarkEnabled ? Colors.white : Colors.black,
        ),
        title: Text(title),
      ),
    );
  }
}
