import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../services/locale_provider.dart';
import 'capture_screen.dart';
import 'coach_screen.dart';
import '../widgets/language_selector.dart';

/// v0 has just two tabs: capture+analyze, and the text-only coach chat.
/// History and the leaderboard are gone along with their Firestore
/// backend — there is no account system and nothing is saved between
/// sessions.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  static const _pages = [
    CaptureScreen(),
    CoachScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final locale = context.watch<LocaleProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(_titleFor(_index, t)),
        actions: [
          LanguageSelector(
            current: locale.locale.languageCode,
            onChanged: (code) => locale.setLocale(code),
            dark: true,
          ),
        ],
      ),
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.camera_alt), label: t.navCapture),
          BottomNavigationBarItem(
              icon: const Icon(Icons.chat_bubble), label: t.navCoach),
        ],
      ),
    );
  }

  String _titleFor(int index, AppLocalizations t) {
    switch (index) {
      case 1:
        return t.coachTitle;
      default:
        return t.captureTitle;
    }
  }
}
