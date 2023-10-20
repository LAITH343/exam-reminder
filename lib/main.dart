import 'package:exam_reminder/constants.dart';
import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/providers/localization.dart';
import 'package:exam_reminder/providers/theme.dart';
import 'package:exam_reminder/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await themeManager.init();
  await localizationManager.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExamsProvider()),
        ChangeNotifierProvider(create: (_) => ThemeUpdater()),
        ChangeNotifierProvider(create: (_) => AppLocalizationsUpdater()),
      ],
      child: Consumer<ThemeUpdater>(
        builder: (context, value, child) => Consumer<AppLocalizationsUpdater>(
          builder: (context, value, child) => MaterialApp(
            home: const SplashScreen(),
            theme: themeManager.theme,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: localizationManager.locale,
            builder: EasyLoading.init(),
          ),
        ),
      ),
    ),
  );
}
