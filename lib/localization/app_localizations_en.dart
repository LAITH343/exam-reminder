import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appBarHome => 'Exam Remidner';

  @override
  String get noExams => 'There\'s no exam 😎';

  @override
  String get drawerClose => 'Close';

  @override
  String get drawerSettings => 'settings';

  @override
  String get drawerSourceCode => 'Source code';

  @override
  String get settingsAppTheme => 'App theme';

  @override
  String get settingsAppLocale => 'App Locale';

  @override
  String get textFieldSubjectName => 'Subject Name';

  @override
  String get textFieldDescription => 'Description';

  @override
  String get appBarAddExam => 'Add New Exam';

  @override
  String get appBarEditExam => 'Editing...';

  @override
  String get appBarSettings => 'Settings';

  @override
  String get saveExamButton => 'Save';

  @override
  String get textFiledRequiredErrorText => 'this field cann\'t be empty';

  @override
  String get datePickerWrongFormat => 'Wrong date format';

  @override
  String get sunday => 'Sunday';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get today => 'Today';

  @override
  String get examAddedMessage => 'Added';

  @override
  String get examFieldRequiredMessage => 'pls fill all fields first!';

  @override
  String get examFialedToAddMessage => 'Failed to add';

  @override
  String get examEditingNoChangeMassage => 'cannot save, nothing has changed';

  @override
  String get examEditingChangedMessage => 'Changed';

  @override
  String get examEditingFailedToChangeMassage => 'Failed to chnaged';

  @override
  String get appSplashScreenText => 'Exams Reminder';

  @override
  String get lightThemeText => 'Light';

  @override
  String get darkThemeText => 'Dark';

  @override
  String get englishLocaleText => 'English (US)';

  @override
  String get arabicLocaleText => 'Arabic (Iraq)';

  @override
  String get welcomeTitle => 'Welcome';

  @override
  String get welcomeSubTitle => 'Select your preferred options, you can change it later from Settings';

  @override
  String get welcomeDoneButton => 'Get started';
}
