import 'package:flutter/material.dart';

/// Centralized theme for the app: a warm, "kitchen studio" palette
/// (charcoal + saffron accent) rather than default Material blue.
class AppTheme {
  static const Color charcoal = Color(0xFF232323);
  static const Color cream = Color(0xFFFAF6F0);
  static const Color saffron = Color(0xFFE0A93A);
  static const Color basil = Color(0xFF4C7A55);
  static const Color tomato = Color(0xFFC1442E);

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: saffron,
        primary: saffron,
        secondary: basil,
        error: tomato,
        surface: cream,
      ),
      scaffoldBackgroundColor: cream,
      fontFamily: 'Roboto',
    );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: charcoal,
        foregroundColor: cream,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: cream,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: charcoal,
          foregroundColor: cream,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 8),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: charcoal,
        selectedItemColor: saffron,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  static Color scoreColor(int score) {
    if (score >= 85) return basil;
    if (score >= 65) return saffron;
    return tomato;
  }
}
