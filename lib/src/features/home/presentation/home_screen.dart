import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_language.dart';
import '../../numbers/data/language_provider.dart';
import '../../numbers/presentation/number_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(appLanguageProvider);
    final buttonText = language == AppLanguage.tr ? 'Sayıları Öğren' : 'Learn Numbers';

    return Scaffold(
      appBar: AppBar(
        title: const Text('KidsLearn 🎈'),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Friendly mascot / icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withValues(alpha: 0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text('🦁', style: TextStyle(fontSize: 64)),
                ),
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                text: '🔢 $buttonText',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NumberScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
