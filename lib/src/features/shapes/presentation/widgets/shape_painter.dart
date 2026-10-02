import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../domain/shape_model.dart';

class ShapeWidget extends StatelessWidget {
  final ShapeType shapeType;
  final Color color;
  final double size;

  const ShapeWidget({
    super.key,
    required this.shapeType,
    required this.color,
    this.size = 64,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ShapePainter(shapeType: shapeType, color: color),
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {
  final ShapeType shapeType;
  final Color color;

  _ShapePainter({required this.shapeType, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..isAntiAlias = true;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 * 0.9;

    final Path path = Path();

    switch (shapeType) {
      case ShapeType.circle:
        canvas.drawCircle(center, radius, fillPaint);
        canvas.drawCircle(center, radius, borderPaint);
        return;

      case ShapeType.square:
        final rect = Rect.fromCenter(center: center, width: radius * 1.7, height: radius * 1.7);
        final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(12));
        canvas.drawRRect(rrect, fillPaint);
        canvas.drawRRect(rrect, borderPaint);
        return;

      case ShapeType.rectangle:
        final rect = Rect.fromCenter(center: center, width: radius * 2.0, height: radius * 1.25);
        final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(10));
        canvas.drawRRect(rrect, fillPaint);
        canvas.drawRRect(rrect, borderPaint);
        return;

      case ShapeType.oval:
        final rect = Rect.fromCenter(center: center, width: radius * 1.9, height: radius * 1.3);
        canvas.drawOval(rect, fillPaint);
        canvas.drawOval(rect, borderPaint);
        return;

      case ShapeType.triangle:
        final double topY = center.dy - radius;
        final double bottomY = center.dy + radius * 0.9;
        final double sideX = radius * math.cos(math.pi / 6);

        path.moveTo(center.dx, topY);
        path.lineTo(center.dx + sideX, bottomY);
        path.lineTo(center.dx - sideX, bottomY);
        path.close();
        break;

      case ShapeType.diamond:
        path.moveTo(center.dx, center.dy - radius);
        path.lineTo(center.dx + radius * 0.85, center.dy);
        path.lineTo(center.dx, center.dy + radius);
        path.lineTo(center.dx - radius * 0.85, center.dy);
        path.close();
        break;

      case ShapeType.pentagon:
        const int sides = 5;
        for (int i = 0; i < sides; i++) {
          final double angle = -math.pi / 2 + (2 * math.pi * i / sides);
          final double x = center.dx + radius * math.cos(angle);
          final double y = center.dy + radius * math.sin(angle);
          if (i == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
        path.close();
        break;

      case ShapeType.star:
        const int points = 5;
        final double outerRadius = radius;
        final double innerRadius = radius * 0.45;
        for (int i = 0; i < points * 2; i++) {
          final double r = i.isEven ? outerRadius : innerRadius;
          final double angle = -math.pi / 2 + (i * math.pi / points);
          final double x = center.dx + r * math.cos(angle);
          final double y = center.dy + r * math.sin(angle);
          if (i == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
        path.close();
        break;

      case ShapeType.heart:
        final double w = radius * 1.8;
        final double h = radius * 1.8;
        final double left = center.dx - w / 2;
        final double top = center.dy - h / 2;

        path.moveTo(left + w / 2, top + h * 0.8);
        path.cubicTo(
          left + w * 0.05, top + h * 0.45,
          left, top + h * 0.1,
          left + w * 0.25, top,
        );
        path.cubicTo(
          left + w * 0.45, top,
          left + w / 2, top + h * 0.25,
          left + w / 2, top + h * 0.25,
        );
        path.cubicTo(
          left + w / 2, top + h * 0.25,
          left + w * 0.55, top,
          left + w * 0.75, top,
        );
        path.cubicTo(
          left + w, top + h * 0.1,
          left + w * 0.95, top + h * 0.45,
          left + w / 2, top + h * 0.8,
        );
        path.close();
        break;

      case ShapeType.crescent:
        final mainRadius = radius;
        final innerCenter = Offset(center.dx + radius * 0.45, center.dy - radius * 0.1);
        final innerRadius = radius * 0.85;

        final outerPath = Path()..addOval(Rect.fromCircle(center: center, radius: mainRadius));
        final innerPath = Path()..addOval(Rect.fromCircle(center: innerCenter, radius: innerRadius));

        path.addPath(Path.combine(PathOperation.difference, outerPath, innerPath), Offset.zero);
        break;
    }

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _ShapePainter oldDelegate) {
    return oldDelegate.shapeType != shapeType || oldDelegate.color != color;
  }
}
