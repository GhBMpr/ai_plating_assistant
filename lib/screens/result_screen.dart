import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../models/analysis_result.dart';
import '../theme/app_theme.dart';
import '../widgets/score_ring.dart';
import '../widgets/subscore_bar.dart';

/// Shows the AI's rating for one photo. The [imageBytes] passed in are
/// only used to render the preview on this screen — they are never
/// uploaded or saved. As soon as the user navigates away, this screen
/// (and its copy of the bytes) is discarded.
class ResultScreen extends StatelessWidget {
  final Uint8List imageBytes;
  final AnalysisResult result;

  const ResultScreen({
    super.key,
    required this.imageBytes,
    required this.result,
  });

  String _verdict(AppLocalizations t, int score) {
    if (score >= 85) return t.verdictExcellent;
    if (score >= 65) return t.verdictGood;
    if (score >= 45) return t.verdictAverage;
    return t.verdictNeedsWork;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final r = result;
    final s = r.subscores;

    return Scaffold(
      appBar: AppBar(title: Text(t.resultTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.memory(imageBytes, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 20),
          Center(child: ScoreRing(score: r.overallScore, suffix: t.outOf100)),
          const SizedBox(height: 8),
          Center(
            child: Text(
              _verdict(t, r.overallScore),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.scoreColor(r.overallScore),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SubscoreBar(label: t.subscoreComposition, value: s.composition),
                  SubscoreBar(label: t.subscoreColors, value: s.colors),
                  SubscoreBar(label: t.subscoreGarnish, value: s.garnish),
                  SubscoreBar(label: t.subscoreCleanliness, value: s.cleanliness),
                  SubscoreBar(label: t.subscoreBalance, value: s.balance),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _SectionList(
            title: t.strengths,
            icon: Icons.check_circle,
            color: AppTheme.basil,
            items: r.strengths,
          ),
          const SizedBox(height: 12),
          _SectionList(
            title: t.suggestions,
            icon: Icons.lightbulb,
            color: AppTheme.saffron,
            items: r.suggestions,
          ),
        ],
      ),
    );
  }
}

class _SectionList extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> items;

  const _SectionList({
    required this.title,
    required this.icon,
    required this.color,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ...items.map((it) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(icon, size: 18, color: color),
                      const SizedBox(width: 8),
                      Expanded(child: Text(it)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
