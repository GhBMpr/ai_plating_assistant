import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';
import 'services/locale_provider.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

/// v0 "economique" build: no Firebase, no third-party storage, no
/// accounts. The whole app is a single stateless session — a photo is
/// only ever held in memory long enough to send it to Gemini and show
/// the result. Nothing is written to disk or to any server other than
/// the one-shot Gemini API call itself. Closing the app or picking a
/// new photo simply drops the old bytes from memory.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localeProvider = LocaleProvider();
  await localeProvider.loadSaved();

  runApp(
    ChangeNotifierProvider.value(
      value: localeProvider,
      child: const AiPlatingApp(),
    ),
  );
}

class AiPlatingApp extends StatelessWidget {
  const AiPlatingApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Plating Assistant',
      theme: AppTheme.light(),
      locale: localeProvider.locale,
      supportedLocales: LocaleProvider.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const HomeScreen(),
    );
  }
}
