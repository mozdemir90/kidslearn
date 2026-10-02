import 'package:flutter/material.dart';
import '../../../constants/app_language.dart';

enum ShapeType {
  circle,
  square,
  triangle,
  rectangle,
  star,
  heart,
  oval,
  diamond,
  pentagon,
  crescent,
}

class ShapeObject {
  final String nameTr;
  final String nameEn;
  final String emoji;

  const ShapeObject({
    required this.nameTr,
    required this.nameEn,
    required this.emoji,
  });

  String getName(AppLanguage language) {
    return language == AppLanguage.tr ? nameTr : nameEn;
  }
}

class ShapeModel {
  final String id;
  final ShapeType shapeType;
  final String nameTr;
  final String nameEn;
  final String descriptionTr;
  final String descriptionEn;
  final Color shapeColor;
  final Color cardColor;
  final List<ShapeObject> exampleObjects;

  const ShapeModel({
    required this.id,
    required this.shapeType,
    required this.nameTr,
    required this.nameEn,
    required this.descriptionTr,
    required this.descriptionEn,
    required this.shapeColor,
    required this.cardColor,
    required this.exampleObjects,
  });

  String getName(AppLanguage language) {
    return language == AppLanguage.tr ? nameTr : nameEn;
  }

  String getDescription(AppLanguage language) {
    return language == AppLanguage.tr ? descriptionTr : descriptionEn;
  }
}
