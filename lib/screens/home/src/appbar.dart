import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/screens/home/methods.dart';
import 'package:flutter/material.dart';

AppBar generateHomeAppBar(ExamsProvider value, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      title: Text(AppLocalizations.of(context)!.appBarHome),
      bottom: value.length() == 0
          ? null
          : TabBar(
            indicatorWeight: 3.0,
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              tabs: value.dates
                  .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(parseDate(e, context))))
                  .toList(),
            ),
    );
  }