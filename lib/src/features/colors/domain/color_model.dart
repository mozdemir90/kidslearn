import 'package:flutter/material.dart';
import '../../../constants/app_language.dart';

class ColorObject {
  final String nameTr;
  final String nameEn;
  final String emoji;

  const ColorObject({
    required this.nameTr,
    required this.nameEn,
    required this.emoji,
  });

  String getName(AppLanguage language) {
    return language == AppLanguage.tr ? nameTr : nameEn;
  }
}

class ColorModel {
  final String id;
  final String nameTr;
  final String nameEn;
  final Color color;
  final Color textColor;
  final List<ColorObject> objects;

  const ColorModel({
    required this.id,
    required this.nameTr,
    required this.nameEn,
    required this.color,
    this.textColor = Colors.white,
    required this.objects,
  });

  String getName(AppLanguage language) {
    return language == AppLanguage.tr ? nameTr : nameEn;
  }
}
