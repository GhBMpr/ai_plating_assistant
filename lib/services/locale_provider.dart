import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Holds the current app locale and persists the user's choice so the
/// app remembers English / French / Arabic across launches. Arabic
/// automatically flips the app into RTL via MaterialApp's built-in
/// Directionality resolution (no extra code needed elsewhere).
class LocaleProvider extends ChangeNotifier {
  static const _prefsKey = 'app_locale_code';
  static const supportedLocales = [Locale('en'), Locale('fr'), Locale('ar')];

  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  Future<void> loadSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_prefsKey);
    if (code != null && supportedLocales.any((l) => l.languageCode == code)) {
      _locale = Locale(code);
      notifyListeners();
    }
  }

  Future<void> setLocale(String code) async {
    if (!supportedLocales.any((l) => l.languageCode == code)) return;
    _locale = Locale(code);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, code);
  }
}
