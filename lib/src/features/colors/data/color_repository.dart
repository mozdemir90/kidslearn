import 'package:flutter/material.dart';
import '../domain/color_model.dart';

class ColorRepository {
  List<ColorModel> getColors() {
    return [
      const ColorModel(
        id: 'red',
        nameTr: 'Kırmızı',
        nameEn: 'Red',
        color: Color(0xFFEF5350),
        textColor: Colors.white,
        objects: [
          ColorObject(nameTr: 'Elma', nameEn: 'Apple', emoji: '🍎'),
          ColorObject(nameTr: 'Çilek', nameEn: 'Strawberry', emoji: '🍓'),
          ColorObject(nameTr: 'İtfaiye', nameEn: 'Fire Truck', emoji: '🚒'),
          ColorObject(nameTr: 'Gül', nameEn: 'Rose', emoji: '🌹'),
          ColorObject(nameTr: 'Balon', nameEn: 'Balloon', emoji: '🎈'),
        ],
      ),
      const ColorModel(
        id: 'blue',
        nameTr: 'Mavi',
        nameEn: 'Blue',
        color: Color(0xFF42A5F5),
        textColor: Colors.white,
        objects: [
          ColorObject(nameTr: 'Balina', nameEn: 'Whale', emoji: '🐳'),
          ColorObject(nameTr: 'Deniz Dalgası', nameEn: 'Ocean Wave', emoji: '🌊'),
          ColorObject(nameTr: 'Yaban Mersini', nameEn: 'Blueberry', emoji: '🫐'),
          ColorObject(nameTr: 'Mavi Araba', nameEn: 'Blue Car', emoji: '🚙'),
          ColorObject(nameTr: 'Su Damlası', nameEn: 'Water Drop', emoji: '💧'),
        ],
      ),
      const ColorModel(
        id: 'yellow',
        nameTr: 'Sarı',
        nameEn: 'Yellow',
        color: Color(0xFFFFEE58),
        textColor: Color(0xFF5D4037),
        objects: [
          ColorObject(nameTr: 'Güneş', nameEn: 'Sun', emoji: '☀️'),
          ColorObject(nameTr: 'Muz', nameEn: 'Banana', emoji: '🍌'),
          ColorObject(nameTr: 'Civciv', nameEn: 'Baby Chick', emoji: '🐥'),
          ColorObject(nameTr: 'Limon', nameEn: 'Lemon', emoji: '🍋'),
          ColorObject(nameTr: 'Yıldız', nameEn: 'Star', emoji: '⭐'),
        ],
      ),
      const ColorModel(
        id: 'green',
        nameTr: 'Yeşil',
        nameEn: 'Green',
        color: Color(0xFF66BB6A),
        textColor: Colors.white,
        objects: [
          ColorObject(nameTr: 'Kurbağa', nameEn: 'Frog', emoji: '🐸'),
          ColorObject(nameTr: 'Brokoli', nameEn: 'Broccoli', emoji: '🥦'),
          ColorObject(nameTr: 'Yaprak', nameEn: 'Leaf', emoji: '🍃'),
          ColorObject(nameTr: 'Avokado', nameEn: 'Avocado', emoji: '🥑'),
          ColorObject(nameTr: 'Kaplumbağa', nameEn: 'Turtle', emoji: '🐢'),
        ],
      ),
      const ColorModel(
        id: 'orange',
        nameTr: 'Turuncu',
        nameEn: 'Orange',
        color: Color(0xFFFFA726),
        textColor: Colors.white,
        objects: [
          ColorObject(nameTr: 'Portakal', nameEn: 'Orange', emoji: '🍊'),
          ColorObject(nameTr: 'Havuç', nameEn: 'Carrot', emoji: '🥕'),
          ColorObject(nameTr: 'Basketbol Topu', nameEn: 'Basketball', emoji: '🏀'),
          ColorObject(nameTr: 'Tilki', nameEn: 'Fox', emoji: '🦊'),
          ColorObject(nameTr: 'Balkabağı', nameEn: 'Pumpkin', emoji: '🎃'),
        ],
      ),
      const ColorModel(
        id: 'purple',
        nameTr: 'Mor',
        nameEn: 'Purple',
        color: Color(0xFFAB47BC),
        textColor: Colors.white,
        objects: [
          ColorObject(nameTr: 'Üzüm', nameEn: 'Grapes', emoji: '🍇'),
          ColorObject(nameTr: 'Patlıcan', nameEn: 'Eggplant', emoji: '🍆'),
          ColorObject(nameTr: 'Kristal Küre', nameEn: 'Crystal', emoji: '🔮'),
          ColorObject(nameTr: 'Tek Boynuzlu At', nameEn: 'Unicorn', emoji: '🦄'),
          ColorObject(nameTr: 'Çiçek', nameEn: 'Flower', emoji: '🪻'),
        ],
      ),
      const ColorModel(
        id: 'pink',
        nameTr: 'Pembe',
        nameEn: 'Pink',
        color: Color(0xFFEC407A),
        textColor: Colors.white,
        objects: [
          ColorObject(nameTr: 'Flamingo', nameEn: 'Flamingo', emoji: '🦩'),
          ColorObject(nameTr: 'Kiraz Çiçeği', nameEn: 'Blossom', emoji: '🌸'),
          ColorObject(nameTr: 'Dondurma', nameEn: 'Ice Cream', emoji: '🍧'),
          ColorObject(nameTr: 'Fiyonk', nameEn: 'Ribbon', emoji: '🎀'),
          ColorObject(nameTr: 'Domuzcuk', nameEn: 'Piggy', emoji: '🐷'),
        ],
      ),
      const ColorModel(
        id: 'brown',
        nameTr: 'Kahverengi',
        nameEn: 'Brown',
        color: Color(0xFF8D6E63),
        textColor: Colors.white,
        objects: [
          ColorObject(nameTr: 'Ayı', nameEn: 'Bear', emoji: '🐻'),
          ColorObject(nameTr: 'Çikolata', nameEn: 'Chocolate', emoji: '🍫'),
          ColorObject(nameTr: 'Kütük', nameEn: 'Log', emoji: '🪵'),
          ColorObject(nameTr: 'Hindistan Cevizi', nameEn: 'Coconut', emoji: '🥥'),
          ColorObject(nameTr: 'Kestane', nameEn: 'Chestnut', emoji: '🌰'),
        ],
      ),
      const ColorModel(
        id: 'black',
        nameTr: 'Siyah',
        nameEn: 'Black',
        color: Color(0xFF37474F),
        textColor: Colors.white,
        objects: [
          ColorObject(nameTr: 'Kara Kedi', nameEn: 'Black Cat', emoji: '🐈‍⬛'),
          ColorObject(nameTr: 'Şapka', nameEn: 'Top Hat', emoji: '🎩'),
          ColorObject(nameTr: 'Tekerlek', nameEn: 'Tire', emoji: '🛞'),
          ColorObject(nameTr: 'Karınca', nameEn: 'Ant', emoji: '🐜'),
          ColorObject(nameTr: 'Güneş Gözlüğü', nameEn: 'Sunglasses', emoji: '🕶️'),
        ],
      ),
      const ColorModel(
        id: 'white',
        nameTr: 'Beyaz',
        nameEn: 'White',
        color: Color(0xFFECEFF1),
        textColor: Color(0xFF37474F),
        objects: [
          ColorObject(nameTr: 'Kuzu', nameEn: 'Little Lamb', emoji: '🐑'),
          ColorObject(nameTr: 'Kardan Adam', nameEn: 'Snowman', emoji: '⛄'),
          ColorObject(nameTr: 'Bulut', nameEn: 'Cloud', emoji: '☁️'),
          ColorObject(nameTr: 'Süt', nameEn: 'Milk', emoji: '🥛'),
          ColorObject(nameTr: 'Yumurta', nameEn: 'Egg', emoji: '🥚'),
        ],
      ),
    ];
  }
}
