import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../services/gemini_service.dart';
import '../services/locale_provider.dart';
import '../theme/app_theme.dart';

class _ChatMessage {
  final String role; // 'user' | 'model'
  final String text;
  _ChatMessage(this.role, this.text);
}

class CoachScreen extends StatefulWidget {
  const CoachScreen({super.key});

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  final _gemini = GeminiService();
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final List<_ChatMessage> _messages = [];
  bool _sending = false;

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _sending) return;
    final languageCode = context.read<LocaleProvider>().locale.languageCode;

    setState(() {
      _messages.add(_ChatMessage('user', text));
      _controller.clear();
      _sending = true;
    });
    _scrollToBottom();

    try {
      final history = _messages
          .map((m) => {'role': m.role, 'text': m.text})
          .toList();
      final reply = await _gemini.askCoach(
        question: text,
        languageCode: languageCode,
        history: history.length > 1
            ? history.sublist(0, history.length - 1)
            : const [],
      );
      setState(() => _messages.add(_ChatMessage('model', reply)));
    } catch (_) {
      final t = AppLocalizations.of(context)!;
      setState(() => _messages.add(_ChatMessage('model', t.errorGeneric)));
    } finally {
      setState(() => _sending = false);
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Column(
      children: [
        Expanded(
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              _Bubble(text: t.coachWelcome, isUser: false),
              ..._messages.map((m) =>
                  _Bubble(text: m.text, isUser: m.role == 'user')),
              if (_sending) const _TypingIndicator(),
            ],
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: t.coachHint),
                    onSubmitted: (_) => _send(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: _sending ? null : _send,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Bubble extends StatelessWidget {
  final String text;
  final bool isUser;
  const _Bubble({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isUser ? AppTheme.charcoal : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isUser ? null : Border.all(color: Colors.black12),
        ),
        child: Text(
          text,
          style: TextStyle(color: isUser ? Colors.white : Colors.black87),
        ),
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}
