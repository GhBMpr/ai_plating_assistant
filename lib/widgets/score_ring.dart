import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Circular progress ring showing the overall 0-100 presentation score.
class ScoreRing extends StatelessWidget {
  final int score;
  final String suffix; // e.g. "/ 100"

  const ScoreRing({super.key, required this.score, required this.suffix});

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.scoreColor(score);
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 160,
            height: 160,
            child: CircularProgressIndicator(
              value: score / 100,
              strokeWidth: 12,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(suffix, style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }
}
