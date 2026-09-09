import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Horizontal bar showing one subscore out of 20 (composition, colors,
/// garnish, cleanliness, or balance).
class SubscoreBar extends StatelessWidget {
  final String label;
  final int value; // 0-20
  final int max;

  const SubscoreBar({
    super.key,
    required this.label,
    required this.value,
    this.max = 20,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = (value / max).clamp(0.0, 1.0);
    final color = AppTheme.scoreColor((ratio * 100).round());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text('$value/$max'),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 8,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ],
      ),
    );
  }
}
