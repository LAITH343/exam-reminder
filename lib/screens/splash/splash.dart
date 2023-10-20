import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:exam_reminder/screens/splash/methods.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    onStart(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.appSplashScreenText,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
