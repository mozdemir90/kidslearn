import 'package:flutter/material.dart';
import '../domain/shape_model.dart';

class ShapeRepository {
  List<ShapeModel> getShapes() {
    return [
      const ShapeModel(
        id: 'circle',
        shapeType: ShapeType.circle,
        nameTr: 'Daire',
        nameEn: 'Circle',
        descriptionTr: 'Kenarsız ve yuvarlak',
        descriptionEn: 'Round with no corners',
        shapeColor: Color(0xFFEF5350), // Red
        cardColor: Color(0xFFFFEBEE),
        exampleObjects: [
          ShapeObject(nameTr: 'Futbol Topu', nameEn: 'Soccer Ball', emoji: '⚽️'),
          ShapeObject(nameTr: 'Pizza Dilimi', nameEn: 'Pizza', emoji: '🍕'),
          ShapeObject(nameTr: 'Duvar Saati', nameEn: 'Clock', emoji: '⏰'),
          ShapeObject(nameTr: 'Bozuk Para', nameEn: 'Coin', emoji: '🪙'),
        ],
      ),
      const ShapeModel(
        id: 'square',
        shapeType: ShapeType.square,
        nameTr: 'Kare',
        nameEn: 'Square',
        descriptionTr: '4 eşit kenar',
        descriptionEn: '4 equal sides',
        shapeColor: Color(0xFF42A5F5), // Blue
        cardColor: Color(0xFFE3F2FD),
        exampleObjects: [
          ShapeObject(nameTr: 'Hediye Kutusu', nameEn: 'Gift Box', emoji: '🎁'),
          ShapeObject(nameTr: 'Zar', nameEn: 'Dice', emoji: '🎲'),
          ShapeObject(nameTr: 'Pencere', nameEn: 'Window', emoji: '🪟'),
          ShapeObject(nameTr: 'Resim Çerçevesi', nameEn: 'Picture Frame', emoji: '🖼️'),
        ],
      ),
      const ShapeModel(
        id: 'triangle',
        shapeType: ShapeType.triangle,
        nameTr: 'Üçgen',
        nameEn: 'Triangle',
        descriptionTr: '3 köşe ve 3 kenar',
        descriptionEn: '3 corners and 3 sides',
        shapeColor: Color(0xFFFFB300), // Amber
        cardColor: Color(0xFFFFF8E1),
        exampleObjects: [
          ShapeObject(nameTr: 'Kamp Çadırı', nameEn: 'Tent', emoji: '⛺️'),
          ShapeObject(nameTr: 'Trafik Konisi', nameEn: 'Traffic Cone', emoji: '🔺'),
          ShapeObject(nameTr: 'Sandviç', nameEn: 'Sandwich', emoji: '🥪'),
          ShapeObject(nameTr: 'Dağ Zirvesi', nameEn: 'Mountain', emoji: '⛰️'),
        ],
      ),
      const ShapeModel(
        id: 'rectangle',
        shapeType: ShapeType.rectangle,
        nameTr: 'Dikdörtgen',
        nameEn: 'Rectangle',
        descriptionTr: '2 uzun 2 kısa kenar',
        descriptionEn: '2 long and 2 short sides',
        shapeColor: Color(0xFF66BB6A), // Green
        cardColor: Color(0xFFE8F5E9),
        exampleObjects: [
          ShapeObject(nameTr: 'Akıllı Telefon', nameEn: 'Smartphone', emoji: '📱'),
          ShapeObject(nameTr: 'Oda Kapısı', nameEn: 'Door', emoji: '🚪'),
          ShapeObject(nameTr: 'Televizyon', nameEn: 'Television', emoji: '📺'),
          ShapeObject(nameTr: 'Çikolata Tableti', nameEn: 'Chocolate Bar', emoji: '🍫'),
        ],
      ),
      const ShapeModel(
        id: 'star',
        shapeType: ShapeType.star,
        nameTr: 'Yıldız',
        nameEn: 'Star',
        descriptionTr: '5 parlak köşe',
        descriptionEn: '5 shining points',
        shapeColor: Color(0xFFFF7043), // Deep Orange
        cardColor: Color(0xFFFBE9E7),
        exampleObjects: [
          ShapeObject(nameTr: 'Gökyüzü Yıldızı', nameEn: 'Night Star', emoji: '⭐'),
          ShapeObject(nameTr: 'Denizyıldızı', nameEn: 'Starfish', emoji: '🌟'),
          ShapeObject(nameTr: 'Altın Madalya', nameEn: 'Gold Medal', emoji: '🎖️'),
          ShapeObject(nameTr: 'Sihirli Değnek', nameEn: 'Magic Wand', emoji: '🪄'),
        ],
      ),
      const ShapeModel(
        id: 'heart',
        shapeType: ShapeType.heart,
        nameTr: 'Kalp',
        nameEn: 'Heart',
        descriptionTr: 'Sevgi dolu şekil',
        descriptionEn: 'Loving shape',
        shapeColor: Color(0xFFEC407A), // Pink
        cardColor: Color(0xFFFCE4EC),
        exampleObjects: [
          ShapeObject(nameTr: 'Kırmızı Kalp', nameEn: 'Red Heart', emoji: '❤️'),
          ShapeObject(nameTr: 'Kalp Balonu', nameEn: 'Heart Balloon', emoji: '🎈'),
          ShapeObject(nameTr: 'Sevgi Mektubu', nameEn: 'Love Letter', emoji: '💌'),
          ShapeObject(nameTr: 'Tatlı Çilek', nameEn: 'Strawberry', emoji: '🍓'),
        ],
      ),
      const ShapeModel(
        id: 'oval',
        shapeType: ShapeType.oval,
        nameTr: 'Oval',
        nameEn: 'Oval',
        descriptionTr: 'Uzatılmış daire',
        descriptionEn: 'Stretched circle',
        shapeColor: Color(0xFFAB47BC), // Purple
        cardColor: Color(0xFFF3E5F5),
        exampleObjects: [
          ShapeObject(nameTr: 'Yumurta', nameEn: 'Egg', emoji: '🥚'),
          ShapeObject(nameTr: 'Ragbi Topu', nameEn: 'Rugby Ball', emoji: '🏉'),
          ShapeObject(nameTr: 'El Aynası', nameEn: 'Mirror', emoji: '🪞'),
          ShapeObject(nameTr: 'Karpuz', nameEn: 'Watermelon', emoji: '🍉'),
        ],
      ),
      const ShapeModel(
        id: 'diamond',
        shapeType: ShapeType.diamond,
        nameTr: 'Eşkenar Dörtgen',
        nameEn: 'Diamond',
        descriptionTr: 'Uçurtma gibi 4 köşe',
        descriptionEn: 'Like a soaring kite',
        shapeColor: Color(0xFF26A69A), // Teal
        cardColor: Color(0xFFE0F2F1),
        exampleObjects: [
          ShapeObject(nameTr: 'Renkli Uçurtma', nameEn: 'Kite', emoji: '🪁'),
          ShapeObject(nameTr: 'Parlak Elmas', nameEn: 'Gemstone', emoji: '💎'),
          ShapeObject(nameTr: 'Karo Deseni', nameEn: 'Diamond Suit', emoji: '🔶'),
          ShapeObject(nameTr: 'Değerli Yüzük', nameEn: 'Ring', emoji: '💍'),
        ],
      ),
      const ShapeModel(
        id: 'pentagon',
        shapeType: ShapeType.pentagon,
        nameTr: 'Beşgen',
        nameEn: 'Pentagon',
        descriptionTr: '5 kenarlı şekil',
        descriptionEn: '5 sided polygon',
        shapeColor: Color(0xFF7E57C2), // Deep Purple
        cardColor: Color(0xFFEDE7F6),
        exampleObjects: [
          ShapeObject(nameTr: 'Kuş Yuvası', nameEn: 'Bird House', emoji: '🏠'),
          ShapeObject(nameTr: 'Futbol Deseni', nameEn: 'Ball Pattern', emoji: '⚽️'),
          ShapeObject(nameTr: 'Dur İşareti', nameEn: 'Sign', emoji: '🛑'),
          ShapeObject(nameTr: 'Çadır Çatısı', nameEn: 'Roof', emoji: '⛺️'),
        ],
      ),
      const ShapeModel(
        id: 'crescent',
        shapeType: ShapeType.crescent,
        nameTr: 'Hilal',
        nameEn: 'Crescent',
        descriptionTr: 'Gece gökyüzündeki Ay',
        descriptionEn: 'The Moon in the night',
        shapeColor: Color(0xFF5C6BC0), // Indigo
        cardColor: Color(0xFFE8EAF6),
        exampleObjects: [
          ShapeObject(nameTr: 'Hilal Ay', nameEn: 'Crescent Moon', emoji: '🌙'),
          ShapeObject(nameTr: 'Kruvasan', nameEn: 'Croissant', emoji: '🥐'),
          ShapeObject(nameTr: 'Sarı Muz', nameEn: 'Yellow Banana', emoji: '🍌'),
          ShapeObject(nameTr: 'Gece Işığı', nameEn: 'Night Sky', emoji: '✨'),
        ],
      ),
    ];
  }
}
