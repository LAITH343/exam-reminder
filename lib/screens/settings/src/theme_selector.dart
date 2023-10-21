import 'package:exam_reminder/constants.dart';
import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/providers/updater.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(AppLocalizations.of(context)!.settingsAppTheme),
          trailing: SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            child: Consumer<AppUpdater>(
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
    );
  }
}
