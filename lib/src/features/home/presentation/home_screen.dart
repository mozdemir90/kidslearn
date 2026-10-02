import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/app_language.dart';
import '../../numbers/data/language_provider.dart';
import '../../numbers/presentation/number_screen.dart';
import '../../colors/presentation/color_screen.dart';
import '../../shapes/presentation/shape_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(appLanguageProvider);

    final welcomeText = language == AppLanguage.tr
        ? 'Hoş Geldin Küçük Kaşif! 🎈'
        : 'Welcome Little Explorer! 🎈';
    final subtitleText = language == AppLanguage.tr
        ? 'Bugün ne öğrenmek istersin?'
        : 'What would you like to learn today?';

    return Scaffold(
      appBar: AppBar(
        title: const Text('KidsLearn 🦁'),
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome Header Banner
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange.shade400,
                      Colors.amber.shade400,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text('🦁', style: TextStyle(fontSize: 38)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            welcomeText,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitleText,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Category 1: Numbers
              _CategoryCard(
                icon: '🔢',
                title: language == AppLanguage.tr ? 'Sayıları Öğren' : 'Learn Numbers',
                subtitle: language == AppLanguage.tr
                    ? '1 - 10 arası sayılar ve sayma'
                    : 'Count numbers 1 to 10',
                badgeText: '1 - 10',
                gradientColors: const [Color(0xFFFF8A65), Color(0xFFFFB74D)],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NumberScreen()),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Category 2: Colors
              _CategoryCard(
                icon: '🎨',
                title: language == AppLanguage.tr ? 'Renkleri Öğren' : 'Learn Colors',
                subtitle: language == AppLanguage.tr
                    ? '10 canlı renk ve renkli nesneler'
                    : '10 vibrant colors & daily objects',
                badgeText: language == AppLanguage.tr ? '10 Renk' : '10 Colors',
                gradientColors: const [Color(0xFFBA68C8), Color(0xFFF06292)],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ColorScreen()),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Category 3: Shapes
              _CategoryCard(
                icon: '🔺',
                title: language == AppLanguage.tr ? 'Şekilleri Öğren' : 'Learn Shapes',
                subtitle: language == AppLanguage.tr
                    ? 'Daire, kare, üçgen ve fazlası'
                    : 'Circle, square, triangle & more',
                badgeText: language == AppLanguage.tr ? '10 Şekil' : '10 Shapes',
                gradientColors: const [Color(0xFF4DD0E1), Color(0xFF4FC3F7)],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ShapeScreen()),
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

class _CategoryCard extends StatefulWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String badgeText;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.badgeText,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
  double _scale = 1.0;

  void _handleTap() {
    setState(() => _scale = 0.96);
    Future.delayed(const Duration(milliseconds: 120), () {
      if (mounted) setState(() => _scale = 1.0);
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeInOut,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: widget.gradientColors.first.withValues(alpha: 0.35),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: _handleTap,
            splashColor: Colors.white.withValues(alpha: 0.3),
            highlightColor: Colors.white.withValues(alpha: 0.15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                children: [
                  // Icon badge
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(widget.icon, style: const TextStyle(fontSize: 32)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Title and Subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.subtitle,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Arrow / Badge
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
