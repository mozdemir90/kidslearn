import 'package:flutter/material.dart';
import '../../domain/color_model.dart';
import '../../../../constants/app_language.dart';

class ColorCard extends StatefulWidget {
  final ColorModel colorItem;
  final AppLanguage language;
  final void Function(String textToSpeak) onColorTap;

  const ColorCard({
    super.key,
    required this.colorItem,
    required this.language,
    required this.onColorTap,
  });

  @override
  State<ColorCard> createState() => _ColorCardState();
}

class _ColorCardState extends State<ColorCard> {
  int _objectIndex = 0;
  double _scale = 1.0;

  void _handleTap() {
    setState(() {
      _scale = 0.92;
      if (widget.colorItem.objects.isNotEmpty) {
        _objectIndex = (_objectIndex + 1) % widget.colorItem.objects.length;
      }
    });

    Future.delayed(const Duration(milliseconds: 120), () {
      if (mounted) {
        setState(() {
          _scale = 1.0;
        });
      }
    });

    final currentObj = widget.colorItem.objects[_objectIndex];
    final colorName = widget.colorItem.getName(widget.language);
    final objName = currentObj.getName(widget.language);

    // Speak format: e.g. "Kırmızı, Elma" / "Red, Apple"
    widget.onColorTap('$colorName, $objName');
  }

  @override
  Widget build(BuildContext context) {
    final currentObj = widget.colorItem.objects.isNotEmpty
        ? widget.colorItem.objects[_objectIndex]
        : const ColorObject(nameTr: 'Renk', nameEn: 'Color', emoji: '🎨');

    final colorName = widget.colorItem.getName(widget.language);
    final objName = currentObj.getName(widget.language);

    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeInOut,
      child: Card(
        color: widget.colorItem.color,
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: Colors.white, width: 2.5),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: _handleTap,
          splashColor: Colors.white.withValues(alpha: 0.3),
          highlightColor: Colors.white.withValues(alpha: 0.15),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top header with volume icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        colorName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: widget.colorItem.color == const Color(0xFFECEFF1)
                              ? Colors.black87
                              : widget.colorItem.color,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.volume_up_rounded,
                      size: 20,
                      color: widget.colorItem.textColor.withValues(alpha: 0.8),
                    ),
                  ],
                ),

                // Center object bubble
                Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      currentObj.emoji,
                      style: const TextStyle(fontSize: 42),
                    ),
                  ),
                ),

                // Object name & dots
                Column(
                  children: [
                    Text(
                      objName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: widget.colorItem.textColor,
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            offset: const Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Progress dots for 5 objects
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.colorItem.objects.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: index == _objectIndex ? 12 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: index == _objectIndex
                                ? widget.colorItem.textColor
                                : widget.colorItem.textColor.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
