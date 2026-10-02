import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/number_provider.dart';
import '../data/language_provider.dart';
import '../data/tts_service.dart';
import '../../../constants/app_language.dart';
import 'widgets/number_card.dart';

class NumberScreen extends ConsumerWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numbers = ref.watch(numberListProvider);
    final language = ref.watch(appLanguageProvider);
    final ttsService = ref.watch(ttsServiceProvider);

    final title = language == AppLanguage.tr ? 'Sayıları Öğrenelim' : 'Learn Numbers';
    final hint = language == AppLanguage.tr
        ? '🔊 Dinlemek ve emojileri değiştirmek için dokun!'
        : '🔊 Tap to listen & change emojis!';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white.withValues(alpha: 0.25),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              icon: Text(language.flag, style: const TextStyle(fontSize: 18)),
              label: Text(
                language.code.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                final nextLang = language == AppLanguage.tr ? AppLanguage.en : AppLanguage.tr;
                ref.read(appLanguageProvider.notifier).state = nextLang;
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Kid-friendly interactive prompt banner
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.orange.shade300, width: 1.5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    hint,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade900,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Numbers Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  final number = numbers[index];
                  return NumberCard(
                    number: number,
                    language: language,
                    onTap: () {
                      final word = number.getWord(language);
                      ttsService.speak(word, language);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
