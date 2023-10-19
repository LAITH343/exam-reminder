import 'package:exam_reminder/constants.dart';
import 'package:exam_reminder/providers/exams.dart';
import 'package:exam_reminder/providers/theme.dart';
import 'package:exam_reminder/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await themeManager.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExamsProvider()),
        ChangeNotifierProvider(create: (_) => ThemeUpdater()),
      ],
      child: Consumer<ThemeUpdater>(
        builder: (context, value, child) => MaterialApp(
          home: const SplashScreen(),
          theme: themeManager.theme,
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
        ),
      ),
    ),
  );
}
