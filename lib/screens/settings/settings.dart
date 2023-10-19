import 'package:exam_reminder/constants.dart';
import 'package:exam_reminder/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: const Text("App theme"),
                trailing: SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Consumer<ThemeUpdater>(
                    builder: (context, value, child) => DropdownButtonFormField<int>(
                      borderRadius: BorderRadius.circular(20),
                      value: themeManager.isDarkEnabled ? 2 : 1,
                      items: const [
                        DropdownMenuItem(value: 1, child: Text("Light"),),
                        DropdownMenuItem(value: 2, child: Text("Dark"),),
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
          )
        ],
      ),
    );
  }
}
