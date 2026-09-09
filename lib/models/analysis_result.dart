/// Structured result returned by Gemini for a single, in-memory-only
/// analysis. Nothing here is ever persisted — there is no id, no
/// userId, and no image URL, because v0 never saves the plate photo
/// or the result anywhere. The screen holds this in a local variable
/// for as long as it's on screen, then it's gone.
class AnalysisResult {
  final int overallScore; // 0-100
  final Subscores subscores;
  final List<String> strengths;
  final List<String> suggestions;

  AnalysisResult({
    required this.overallScore,
    required this.subscores,
    required this.strengths,
    required this.suggestions,
  });

  /// Parses the raw JSON object returned by the Gemini prompt (see
  /// GeminiPrompts.analysis) into subscores + overall score.
  factory AnalysisResult.fromGeminiJson(Map<String, dynamic> json) {
    final subscores = Subscores.fromMap(
        Map<String, dynamic>.from(json['subscores'] ?? {}));
    return AnalysisResult(
      overallScore: (json['overall_score'] ?? subscores.total) as int,
      subscores: subscores,
      strengths: List<String>.from(json['strengths'] ?? []),
      suggestions: List<String>.from(json['suggestions'] ?? []),
    );
  }
}

/// Each subscore is out of 20, summing to 100.
class Subscores {
  final int composition;
  final int colors;
  final int garnish;
  final int cleanliness;
  final int balance;

  Subscores({
    required this.composition,
    required this.colors,
    required this.garnish,
    required this.cleanliness,
    required this.balance,
  });

  int get total => composition + colors + garnish + cleanliness + balance;

  factory Subscores.fromMap(Map<String, dynamic> map) => Subscores(
        composition: _asInt(map['composition']),
        colors: _asInt(map['colors']),
        garnish: _asInt(map['garnish']),
        cleanliness: _asInt(map['cleanliness']),
        balance: _asInt(map['balance']),
      );

  static int _asInt(dynamic v) {
    if (v is int) return v;
    if (v is double) return v.round();
    if (v is String) return int.tryParse(v) ?? 0;
    return 0;
  }
}
