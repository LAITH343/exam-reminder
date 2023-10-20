import 'package:exam_reminder/constants.dart';
import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/providers/localization.dart';
import 'package:exam_reminder/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appBarSettings),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(AppLocalizations.of(context)!.settingsAppTheme),
                trailing: SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Consumer<ThemeUpdater>(
                    builder: (context, value, child) =>
                        DropdownButtonFormField<int>(
                      borderRadius: BorderRadius.circular(20),
                      value: themeManager.isDarkEnabled ? 2 : 1,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text(AppLocalizations.of(context)!.lightThemeText),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text(AppLocalizations.of(context)!.darkThemeText),
                        ),
                      ],
                      onChanged: (v) {
                        if (v != null) {
                          themeManager.setTheme(v);
                          value.update();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(AppLocalizations.of(context)!.settingsAppLocale),
                trailing: SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Consumer<AppLocalizationsUpdater>(
                    builder: (context, value, child) =>
                        DropdownButtonFormField<Locale>(
                      borderRadius: BorderRadius.circular(20),
                      value: localizationManager.locale,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          value: const Locale('en', 'US'),
                          child: Text(AppLocalizations.of(context)!.englishLocaleText),
                        ),
                        DropdownMenuItem(
                          value: const Locale('ar', 'IQ'),
                          child: Text(AppLocalizations.of(context)!.arabicLocaleText),
                        ),
                      ],
                      onChanged: (v) {
                        if (v != null) {
                          localizationManager.setLocale(v);
                          value.update();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
