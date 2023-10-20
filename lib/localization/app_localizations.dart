import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appBarHome.
  ///
  /// In en, this message translates to:
  /// **'Exam Remidner'**
  String get appBarHome;

  /// No description provided for @noExams.
  ///
  /// In en, this message translates to:
  /// **'There\'s no exam 😎'**
  String get noExams;

  /// No description provided for @drawerClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get drawerClose;

  /// No description provided for @drawerSettings.
  ///
  /// In en, this message translates to:
  /// **'settings'**
  String get drawerSettings;

  /// No description provided for @drawerSourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source code'**
  String get drawerSourceCode;

  /// No description provided for @settingsAppTheme.
  ///
  /// In en, this message translates to:
  /// **'App theme'**
  String get settingsAppTheme;

  /// No description provided for @settingsAppLocale.
  ///
  /// In en, this message translates to:
  /// **'App Locale'**
  String get settingsAppLocale;

  /// No description provided for @textFieldSubjectName.
  ///
  /// In en, this message translates to:
  /// **'Subject Name'**
  String get textFieldSubjectName;

  /// No description provided for @textFieldDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get textFieldDescription;

  /// No description provided for @appBarAddExam.
  ///
  /// In en, this message translates to:
  /// **'Add New Exam'**
  String get appBarAddExam;

  /// No description provided for @appBarEditExam.
  ///
  /// In en, this message translates to:
  /// **'Editing...'**
  String get appBarEditExam;

  /// No description provided for @appBarSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get appBarSettings;

  /// No description provided for @saveExamButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveExamButton;

  /// No description provided for @textFiledRequiredErrorText.
  ///
  /// In en, this message translates to:
  /// **'this field cann\'t be empty'**
  String get textFiledRequiredErrorText;

  /// No description provided for @datePickerWrongFormat.
  ///
  /// In en, this message translates to:
  /// **'Wrong date format'**
  String get datePickerWrongFormat;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @examAddedMessage.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get examAddedMessage;

  /// No description provided for @examFieldRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'pls fill all fields first!'**
  String get examFieldRequiredMessage;

  /// No description provided for @examFialedToAddMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to add'**
  String get examFialedToAddMessage;

  /// No description provided for @examEditingNoChangeMassage.
  ///
  /// In en, this message translates to:
  /// **'cannot save, nothing has changed'**
  String get examEditingNoChangeMassage;

  /// No description provided for @examEditingChangedMessage.
  ///
  /// In en, this message translates to:
  /// **'Changed'**
  String get examEditingChangedMessage;

  /// No description provided for @examEditingFailedToChangeMassage.
  ///
  /// In en, this message translates to:
  /// **'Failed to chnaged'**
  String get examEditingFailedToChangeMassage;

  /// No description provided for @appSplashScreenText.
  ///
  /// In en, this message translates to:
  /// **'Exams Reminder'**
  String get appSplashScreenText;

  /// No description provided for @lightThemeText.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightThemeText;

  /// No description provided for @darkThemeText.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkThemeText;

  /// No description provided for @englishLocaleText.
  ///
  /// In en, this message translates to:
  /// **'English (US)'**
  String get englishLocaleText;

  /// No description provided for @arabicLocaleText.
  ///
  /// In en, this message translates to:
  /// **'Arabic (Iraq)'**
  String get arabicLocaleText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
