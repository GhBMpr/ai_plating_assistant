import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../services/gemini_service.dart';
import '../services/locale_provider.dart';
import '../models/analysis_result.dart';
import '../theme/app_theme.dart';
import 'result_screen.dart';

/// v0 "economique" flow: the picked photo lives only in [_imageBytes],
/// a plain in-memory field. It is never written to disk, never
/// uploaded anywhere, and never saved to a database — it only ever
/// travels once, inline, in the single Gemini analysis request. It is
/// dropped the moment the user picks a new photo, navigates back from
/// the result screen, or closes the app (RAM is simply freed).
class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key});

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  final _picker = ImagePicker();
  final _gemini = GeminiService();

  Uint8List? _imageBytes;
  bool _busy = false;
  String? _error;

  Future<void> _pick(ImageSource source) async {
    final file = await _picker.pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1600,
    );
    if (file == null) return;
    final bytes = await file.readAsBytes();
    // Overwriting _imageBytes here drops any previous photo from memory.
    setState(() {
      _imageBytes = bytes;
      _error = null;
    });
  }

  Future<void> _analyze() async {
    final t = AppLocalizations.of(context)!;
    final bytes = _imageBytes;
    if (bytes == null) {
      setState(() => _error = t.errorNoImage);
      return;
    }
    final languageCode = context.read<LocaleProvider>().locale.languageCode;

    setState(() {
      _busy = true;
      _error = null;
    });

    try {
      final json = await _gemini.analyzePlate(
        imageBytes: bytes,
        languageCode: languageCode,
      );
      final result = AnalysisResult.fromGeminiJson(json);

      if (!mounted) return;
      // The photo bytes are passed straight through to the result
      // screen for display only — still never written or uploaded.
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ResultScreen(imageBytes: bytes, result: result),
        ),
      );
      // Back from the result screen: forget this photo entirely so a
      // fresh capture starts with a clean slate.
      if (mounted) setState(() => _imageBytes = null);
    } on GeminiException catch (e) {
      debugPrint('GeminiException: $e');
      setState(() => _error = '${t.errorNetwork}\n(${e.message})');
    } catch (e) {
      debugPrint('Unexpected analyze error: $e');
      setState(() => _error = '${t.errorGeneric}\n($e)');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12),
                ),
                clipBehavior: Clip.antiAlias,
                child: _imageBytes == null
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.restaurant,
                                size: 72, color: Colors.black26),
                            const SizedBox(height: 12),
                            Text(t.captureTitle,
                                style: const TextStyle(color: Colors.black45)),
                          ],
                        ),
                      )
                    : Image.memory(_imageBytes!, fit: BoxFit.cover),
              ),
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!, style: const TextStyle(color: AppTheme.tomato)),
            ],
            const SizedBox(height: 16),
            if (_busy) ...[
              const CircularProgressIndicator(),
              const SizedBox(height: 12),
              Text(t.analyzing),
            ] else if (_imageBytes == null) ...[
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _pick(ImageSource.camera),
                      icon: const Icon(Icons.camera_alt),
                      label: Text(t.takePhoto),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _pick(ImageSource.gallery),
                      icon: const Icon(Icons.photo_library),
                      label: Text(t.uploadPhoto),
                    ),
                  ),
                ],
              ),
            ] else ...[
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setState(() => _imageBytes = null),
                      child: Text(t.retake),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _analyze,
                      child: Text(t.analyzeButton),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
