// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'AI Plating Assistant';

  @override
  String get loginTitle => 'Welcome back';

  @override
  String get signupTitle => 'Create account';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get nameLabel => 'Full name';

  @override
  String get loginButton => 'Log in';

  @override
  String get signupButton => 'Sign up';

  @override
  String get noAccountYet => 'Don\'t have an account? Sign up';

  @override
  String get haveAccountAlready => 'Already have an account? Log in';

  @override
  String get logout => 'Log out';

  @override
  String get navCapture => 'Analyze';

  @override
  String get navHistory => 'History';

  @override
  String get navLeaderboard => 'Leaderboard';

  @override
  String get navCoach => 'AI Coach';

  @override
  String get captureTitle => 'Analyze a plate';

  @override
  String get takePhoto => 'Take a photo';

  @override
  String get uploadPhoto => 'Upload from gallery';

  @override
  String get analyzeButton => 'Analyze presentation';

  @override
  String get analyzing => 'Analyzing your plating…';

  @override
  String get retake => 'Retake';

  @override
  String get resultTitle => 'Presentation Score';

  @override
  String get outOf100 => '/ 100';

  @override
  String get subscoreComposition => 'Composition';

  @override
  String get subscoreColors => 'Colors';

  @override
  String get subscoreGarnish => 'Garnish';

  @override
  String get subscoreCleanliness => 'Cleanliness';

  @override
  String get subscoreBalance => 'Balance';

  @override
  String get strengths => 'Strengths';

  @override
  String get suggestions => 'Suggestions';

  @override
  String get saveToHistory => 'Save to history';

  @override
  String get savedToHistory => 'Saved to your history';

  @override
  String get shareResult => 'Share';

  @override
  String get historyTitle => 'Your History';

  @override
  String get noHistoryYet => 'No analyses yet. Analyze your first plate!';

  @override
  String get historyDeleteConfirm => 'Delete this analysis?';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get leaderboardTitle => 'Kitchen Leaderboard';

  @override
  String get leaderboardEmpty => 'No scores yet. Be the first to plate up!';

  @override
  String get leaderboardSubtitle => 'Ranked by average of last 10 dishes';

  @override
  String get coachTitle => 'AI Plating Coach';

  @override
  String get coachHint => 'Ask about garnish, colors, plating styles…';

  @override
  String get coachSend => 'Send';

  @override
  String get coachWelcome =>
      'Hi, I\'m your plating coach. Ask me anything about food presentation!';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get french => 'French';

  @override
  String get arabic => 'Arabic';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get errorNoImage => 'Please take or upload a photo first.';

  @override
  String get errorNetwork => 'Network error. Check your connection.';

  @override
  String get retry => 'Retry';

  @override
  String get verdictExcellent => 'Excellent presentation';

  @override
  String get verdictGood => 'Good presentation';

  @override
  String get verdictAverage => 'Average presentation';

  @override
  String get verdictNeedsWork => 'Needs work';
}
