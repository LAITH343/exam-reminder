import 'package:exam_reminder/constants.dart';
import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/providers/updater.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalizationSelector extends StatelessWidget {
  const LocalizationSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(AppLocalizations.of(context)!.settingsAppLocale),
          trailing: SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            child: Consumer<AppUpdater>(
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
    );
  }
}
