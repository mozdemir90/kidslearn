import 'package:flutter/material.dart';
import '../../domain/shape_model.dart';
import '../../../../constants/app_language.dart';
import 'shape_painter.dart';

class ShapeCard extends StatefulWidget {
  final ShapeModel shapeItem;
  final AppLanguage language;
  final void Function(String textToSpeak) onShapeTap;

  const ShapeCard({
    super.key,
    required this.shapeItem,
    required this.language,
    required this.onShapeTap,
  });

  @override
  State<ShapeCard> createState() => _ShapeCardState();
}

class _ShapeCardState extends State<ShapeCard> {
  int _exampleIndex = 0;
  double _scale = 1.0;

  void _handleTap() {
    setState(() {
      _scale = 0.92;
      if (widget.shapeItem.exampleObjects.isNotEmpty) {
        _exampleIndex = (_exampleIndex + 1) % widget.shapeItem.exampleObjects.length;
      }
    });

    Future.delayed(const Duration(milliseconds: 120), () {
      if (mounted) {
        setState(() {
          _scale = 1.0;
        });
      }
    });

    final currentExample = widget.shapeItem.exampleObjects[_exampleIndex];
    final shapeName = widget.shapeItem.getName(widget.language);
    final exampleName = currentExample.getName(widget.language);

    // Speak: "Daire, Futbol Topu" / "Circle, Soccer Ball"
    widget.onShapeTap('$shapeName, $exampleName');
  }

  @override
  Widget build(BuildContext context) {
    final currentExample = widget.shapeItem.exampleObjects.isNotEmpty
        ? widget.shapeItem.exampleObjects[_exampleIndex]
        : const ShapeObject(nameTr: 'Şekil', nameEn: 'Shape', emoji: '🔺');

    final shapeName = widget.shapeItem.getName(widget.language);
    final description = widget.shapeItem.getDescription(widget.language);
    final exampleName = currentExample.getName(widget.language);

    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeInOut,
      child: Card(
        color: widget.shapeItem.cardColor,
        elevation: 4,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: widget.shapeItem.shapeColor.withValues(alpha: 0.6),
            width: 2,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: _handleTap,
          splashColor: widget.shapeItem.shapeColor.withValues(alpha: 0.2),
          highlightColor: widget.shapeItem.shapeColor.withValues(alpha: 0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top header with volume icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: widget.shapeItem.shapeColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        shapeName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: widget.shapeItem.shapeColor,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.volume_up_rounded,
                      size: 20,
                      color: widget.shapeItem.shapeColor,
                    ),
                  ],
                ),

                // Center Vector Shape
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ShapeWidget(
                    shapeType: widget.shapeItem.shapeType,
                    color: widget.shapeItem.shapeColor,
                    size: 68,
                  ),
                ),

                // Description badge
                Text(
                  description,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),

                // Bottom Real-world example container
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: widget.shapeItem.shapeColor.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentExample.emoji,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          exampleName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: widget.shapeItem.shapeColor,
                          ),
                        ),
                      ),
                    ],
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
