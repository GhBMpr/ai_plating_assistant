import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import '../config/api_config.dart';

/// Client for the Gemini API's `generateContent` REST endpoint.
///
/// Used for two things:
///  - [analyzePlate]: scores a single plate photo on visual presentation.
///  - [askCoach]: free-form, text-only chat with a plating coach persona.
///
/// The photo passed to [analyzePlate] is sent inline as base64 in the
/// request body and is never written to disk or uploaded elsewhere —
/// the caller is responsible for discarding it once this call returns.
class GeminiService {
  static const String _model = 'gemini-3.6-flash';
  static const String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models';

  Uri _endpoint() {
    final key = ApiConfig.geminiApiKey;
    if (key.isEmpty || key == 'YOUR_GEMINI_API_KEY') {
      throw GeminiException(
          'Gemini API key is not set. Copy lib/config/api_config.example.dart '
          'to lib/config/api_config.dart and add your key from '
          'https://aistudio.google.com/app/apikey');
    }
    return Uri.parse('$_baseUrl/$_model:generateContent?key=$key');
  }

  /// Analyzes a plated dish photo and returns the decoded JSON object
  /// described in [_buildPrompt].
  Future<Map<String, dynamic>> analyzePlate({
    required Uint8List imageBytes,
    required String languageCode, // 'en' | 'fr' | 'ar'
  }) async {
    final body = {
      'contents': [
        {
          'parts': [
            {'text': _buildPrompt(languageCode)},
            {
              'inline_data': {
                'mime_type': 'image/jpeg',
                'data': base64Encode(imageBytes),
              }
            }
          ]
        }
      ],
      'generationConfig': {
        'response_mime_type': 'application/json',
      },
    };

    final response = await http
        .post(_endpoint(),
            headers: {'Content-Type': 'application/json'}, body: jsonEncode(body))
        .timeout(const Duration(seconds: 60));

    if (response.statusCode != 200) {
      throw GeminiException('Gemini API error ${response.statusCode}: ${response.body}');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final candidates = decoded['candidates'] as List?;
    if (candidates == null || candidates.isEmpty) {
      throw GeminiException('No response from Gemini.');
    }

    final text = candidates[0]['content']['parts'][0]['text'] as String;
    return jsonDecode(_stripCodeFences(text)) as Map<String, dynamic>;
  }

  /// Free-form chat with the AI coach (text-only, no image).
  Future<String> askCoach({
    required String question,
    required String languageCode,
    List<Map<String, String>> history = const [],
  }) async {
    final contents = <Map<String, dynamic>>[
      {
        'role': 'user',
        'parts': [
          {'text': _coachSystemPrompt(languageCode)}
        ]
      },
      {
        'role': 'model',
        'parts': [
          {'text': 'Understood.'}
        ]
      },
      ...history.map((m) => {
            'role': m['role'],
            'parts': [
              {'text': m['text']}
            ]
          }),
      {
        'role': 'user',
        'parts': [
          {'text': question}
        ]
      },
    ];

    final response = await http
        .post(_endpoint(),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'contents': contents}))
        .timeout(const Duration(seconds: 45));

    if (response.statusCode != 200) {
      throw GeminiException('Gemini API error ${response.statusCode}: ${response.body}');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final candidates = decoded['candidates'] as List?;
    if (candidates == null || candidates.isEmpty) {
      throw GeminiException('No response from Gemini.');
    }
    return candidates[0]['content']['parts'][0]['text'] as String;
  }

  String _stripCodeFences(String text) {
    var t = text.trim();
    if (t.startsWith('```')) {
      t = t.replaceFirst(RegExp(r'^```json'), '');
      t = t.replaceFirst(RegExp(r'^```'), '');
      if (t.endsWith('```')) {
        t = t.substring(0, t.length - 3);
      }
    }
    return t.trim();
  }

  String _languageName(String code) {
    switch (code) {
      case 'fr':
        return 'French';
      case 'ar':
        return 'Arabic';
      default:
        return 'English';
    }
  }

  /// Builds the analysis prompt. The model evaluates only visual
  /// presentation (never taste) and returns strict JSON so the app
  /// can render subscores, strengths, and suggestions directly.
  String _buildPrompt(String languageCode) {
    final lang = _languageName(languageCode);
    return '''
You are a professional culinary plating judge. Analyze ONLY the visual
presentation of the plated dish in the photo — never comment on taste,
smell, or how it might taste.

Evaluate these criteria:
1. Plate centering: is the food well positioned on the plate?
2. Negative space: is the plate overcrowded, balanced, or too empty?
3. Color harmony: do the dominant colors contrast attractively?
4. Symmetry and balance: weight distribution and object placement.
5. Garnish: is garnish present, appropriate, and not excessive?
6. Sauce presentation: are sauce marks/dots/smears deliberate and clean?
7. Plate cleanliness: any fingerprints, stains, or spills on the rim?

Return STRICT JSON only (no markdown, no commentary) with this exact
shape:
{
  "overall_score": <integer 0-100>,
  "subscores": {
    "composition": <integer 0-20>,
    "colors": <integer 0-20>,
    "garnish": <integer 0-20>,
    "cleanliness": <integer 0-20>,
    "balance": <integer 0-20>
  },
  "strengths": ["short strength 1", "short strength 2", "..."],
  "suggestions": ["short actionable suggestion 1", "..."]
}

Write all text values (strengths and suggestions) in $lang.
Keep each strength/suggestion under 15 words. Provide 2-4 strengths and
2-4 suggestions. The five subscores must sum to overall_score.
''';
  }

  String _coachSystemPrompt(String languageCode) {
    final lang = _languageName(languageCode);
    return '''
You are an expert culinary plating coach for professional chefs and
culinary students. You give concise, practical advice about visual food
presentation only: composition, negative space, color harmony,
garnish choice, sauce work, plate cleanliness, and plateware selection.
You do not discuss recipes, cooking techniques, or food safety unless
directly asked. Keep answers short (3-6 sentences) and actionable.
Always respond in $lang.
''';
  }
}

class GeminiException implements Exception {
  final String message;
  GeminiException(this.message);
  @override
  String toString() => message;
}
