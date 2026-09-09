import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

/// Small globe-icon dropdown to switch between English / French /
/// Arabic anywhere in the app (used on the auth screen and settings).
class LanguageSelector extends StatelessWidget {
  final String current;
  final ValueChanged<String> onChanged;
  final bool dark;

  const LanguageSelector({
    super.key,
    required this.current,
    required this.onChanged,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final color = dark ? Colors.white : Colors.black87;

    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: current,
        icon: Icon(Icons.language, color: color),
        dropdownColor: dark ? const Color(0xFF2E2E2E) : Colors.white,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
        items: [
          DropdownMenuItem(value: 'en', child: Text(t.english)),
          DropdownMenuItem(value: 'fr', child: Text(t.french)),
          DropdownMenuItem(value: 'ar', child: Text(t.arabic)),
        ],
        onChanged: (v) {
          if (v != null) onChanged(v);
        },
      ),
    );
  }
}
