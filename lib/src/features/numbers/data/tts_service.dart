import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../constants/app_language.dart';

class TtsService {
  final FlutterTts _flutterTts;
  bool _initialized = false;

  TtsService({FlutterTts? tts}) : _flutterTts = tts ?? FlutterTts();

  Future<void> _init() async {
    if (_initialized) return;
    try {
      await _flutterTts.setSpeechRate(0.45); // Slower, clearer speech for kids
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.1); // Slightly friendly tone for children
      _initialized = true;
    } catch (e) {
      debugPrint('TTS init error: $e');
    }
  }

  Future<void> speak(String text, AppLanguage language) async {
    try {
      await _init();
      await _flutterTts.setLanguage(language.ttsLocale);
      await _flutterTts.stop();
      await _flutterTts.speak(text);
    } catch (e) {
      debugPrint('TTS speak error: $e');
    }
  }

  Future<void> stop() async {
    try {
      await _flutterTts.stop();
    } catch (e) {
      debugPrint('TTS stop error: $e');
    }
  }

  void dispose() {
    stop();
  }
}

final ttsServiceProvider = Provider<TtsService>((ref) {
  final service = TtsService();
  ref.onDispose(() => service.dispose());
  return service;
});
