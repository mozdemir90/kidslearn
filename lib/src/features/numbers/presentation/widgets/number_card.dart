import 'package:flutter/material.dart';
import '../../domain/number_model.dart';
import '../../../../constants/app_language.dart';

class NumberCard extends StatefulWidget {
  final NumberModel number;
  final AppLanguage language;
  final VoidCallback onTap;

  const NumberCard({
    super.key,
    required this.number,
    required this.language,
    required this.onTap,
  });

  @override
  State<NumberCard> createState() => _NumberCardState();
}

class _NumberCardState extends State<NumberCard> with SingleTickerProviderStateMixin {
  late int _emojiIndex;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    _emojiIndex = 0;
  }

  void _handleTap() {
    // Micro-bounce animation
    setState(() {
      _scale = 0.90;
      // Cycle to the next emoji on each tap
      if (widget.number.emojis.isNotEmpty) {
        _emojiIndex = (_emojiIndex + 1) % widget.number.emojis.length;
      }
    });

    Future.delayed(const Duration(milliseconds: 120), () {
      if (mounted) {
        setState(() {
          _scale = 1.0;
        });
      }
    });

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final currentEmoji = widget.number.emojis.isNotEmpty
        ? widget.number.emojis[_emojiIndex]
        : '⭐️';
    final word = widget.number.getWord(widget.language);

    // Dynamic emoji size based on count so they fit comfortably
    final double emojiSize = widget.number.digit <= 3
        ? 26.0
        : widget.number.digit <= 6
            ? 20.0
            : 16.0;

    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeInOut,
      child: Card(
        color: Color(widget.number.colorValue),
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: _handleTap,
          splashColor: Colors.white.withValues(alpha: 0.3),
          highlightColor: Colors.white.withValues(alpha: 0.15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top row with speaker badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '#${widget.number.digit}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.volume_up_rounded,
                      size: 20,
                      color: Colors.black45,
                    ),
                  ],
                ),

                // Large digit
                Text(
                  '${widget.number.digit}',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 54,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        shadows: [
                          const Shadow(
                            color: Colors.black26,
                            offset: Offset(2, 3),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                ),

                // Word pronunciation
                Text(
                  word,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          const Shadow(
                            color: Colors.black12,
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                ),

                const SizedBox(height: 2),

                // Dynamic counting objects (emojis) that cycle on tap
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 3,
                      runSpacing: 2,
                      children: List.generate(
                        widget.number.digit,
                        (index) => Text(
                          currentEmoji,
                          style: TextStyle(fontSize: emojiSize),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
