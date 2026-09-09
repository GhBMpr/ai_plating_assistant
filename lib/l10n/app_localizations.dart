import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Plating Assistant'**
  String get appTitle;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get loginTitle;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get signupTitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get nameLabel;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginButton;

  /// No description provided for @signupButton.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signupButton;

  /// No description provided for @noAccountYet.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign up'**
  String get noAccountYet;

  /// No description provided for @haveAccountAlready.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Log in'**
  String get haveAccountAlready;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @navCapture.
  ///
  /// In en, this message translates to:
  /// **'Analyze'**
  String get navCapture;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// No description provided for @navLeaderboard.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard'**
  String get navLeaderboard;

  /// No description provided for @navCoach.
  ///
  /// In en, this message translates to:
  /// **'AI Coach'**
  String get navCoach;

  /// No description provided for @captureTitle.
  ///
  /// In en, this message translates to:
  /// **'Analyze a plate'**
  String get captureTitle;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get takePhoto;

  /// No description provided for @uploadPhoto.
  ///
  /// In en, this message translates to:
  /// **'Upload from gallery'**
  String get uploadPhoto;

  /// No description provided for @analyzeButton.
  ///
  /// In en, this message translates to:
  /// **'Analyze presentation'**
  String get analyzeButton;

  /// No description provided for @analyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing your plating…'**
  String get analyzing;

  /// No description provided for @retake.
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get retake;

  /// No description provided for @resultTitle.
  ///
  /// In en, this message translates to:
  /// **'Presentation Score'**
  String get resultTitle;

  /// No description provided for @outOf100.
  ///
  /// In en, this message translates to:
  /// **'/ 100'**
  String get outOf100;

  /// No description provided for @subscoreComposition.
  ///
  /// In en, this message translates to:
  /// **'Composition'**
  String get subscoreComposition;

  /// No description provided for @subscoreColors.
  ///
  /// In en, this message translates to:
  /// **'Colors'**
  String get subscoreColors;

  /// No description provided for @subscoreGarnish.
  ///
  /// In en, this message translates to:
  /// **'Garnish'**
  String get subscoreGarnish;

  /// No description provided for @subscoreCleanliness.
  ///
  /// In en, this message translates to:
  /// **'Cleanliness'**
  String get subscoreCleanliness;

  /// No description provided for @subscoreBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get subscoreBalance;

  /// No description provided for @strengths.
  ///
  /// In en, this message translates to:
  /// **'Strengths'**
  String get strengths;

  /// No description provided for @suggestions.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get suggestions;

  /// No description provided for @saveToHistory.
  ///
  /// In en, this message translates to:
  /// **'Save to history'**
  String get saveToHistory;

  /// No description provided for @savedToHistory.
  ///
  /// In en, this message translates to:
  /// **'Saved to your history'**
  String get savedToHistory;

  /// No description provided for @shareResult.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareResult;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your History'**
  String get historyTitle;

  /// No description provided for @noHistoryYet.
  ///
  /// In en, this message translates to:
  /// **'No analyses yet. Analyze your first plate!'**
  String get noHistoryYet;

  /// No description provided for @historyDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this analysis?'**
  String get historyDeleteConfirm;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @leaderboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Kitchen Leaderboard'**
  String get leaderboardTitle;

  /// No description provided for @leaderboardEmpty.
  ///
  /// In en, this message translates to:
  /// **'No scores yet. Be the first to plate up!'**
  String get leaderboardEmpty;

  /// No description provided for @leaderboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ranked by average of last 10 dishes'**
  String get leaderboardSubtitle;

  /// No description provided for @coachTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Plating Coach'**
  String get coachTitle;

  /// No description provided for @coachHint.
  ///
  /// In en, this message translates to:
  /// **'Ask about garnish, colors, plating styles…'**
  String get coachHint;

  /// No description provided for @coachSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get coachSend;

  /// No description provided for @coachWelcome.
  ///
  /// In en, this message translates to:
  /// **'Hi, I\'m your plating coach. Ask me anything about food presentation!'**
  String get coachWelcome;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorNoImage.
  ///
  /// In en, this message translates to:
  /// **'Please take or upload a photo first.'**
  String get errorNoImage;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network error. Check your connection.'**
  String get errorNetwork;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @verdictExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent presentation'**
  String get verdictExcellent;

  /// No description provided for @verdictGood.
  ///
  /// In en, this message translates to:
  /// **'Good presentation'**
  String get verdictGood;

  /// No description provided for @verdictAverage.
  ///
  /// In en, this message translates to:
  /// **'Average presentation'**
  String get verdictAverage;

  /// No description provided for @verdictNeedsWork.
  ///
  /// In en, this message translates to:
  /// **'Needs work'**
  String get verdictNeedsWork;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
