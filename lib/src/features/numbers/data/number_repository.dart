import '../domain/number_model.dart';

class NumberRepository {
  List<NumberModel> getNumbers() {
    return [
      const NumberModel(
        digit: 1,
        wordTr: 'Bir',
        wordEn: 'One',
        emojis: ['🍎', '⭐️', '🚗', '🦁', '🎈'],
        colorValue: 0xFFFFCDD2, // Pastel Red
      ),
      const NumberModel(
        digit: 2,
        wordTr: 'İki',
        wordEn: 'Two',
        emojis: ['🍒', '🐱', '🚀', '🍓', '👟'],
        colorValue: 0xFFE1BEE7, // Pastel Purple
      ),
      const NumberModel(
        digit: 3,
        wordTr: 'Üç',
        wordEn: 'Three',
        emojis: ['🍌', '🐶', '⚽️', '🚲', '🍕'],
        colorValue: 0xFFC5CAE9, // Pastel Indigo
      ),
      const NumberModel(
        digit: 4,
        wordTr: 'Dört',
        wordEn: 'Four',
        emojis: ['🍇', '🐰', '✈️', '🍔', '🌸'],
        colorValue: 0xFFB3E5FC, // Pastel Light Blue
      ),
      const NumberModel(
        digit: 5,
        wordTr: 'Beş',
        wordEn: 'Five',
        emojis: ['🍉', '🐼', '⛵️', '🍩', '🐥'],
        colorValue: 0xFFB2DFDB, // Pastel Teal
      ),
      const NumberModel(
        digit: 6,
        wordTr: 'Altı',
        wordEn: 'Six',
        emojis: ['🍊', '🐻', '🚁', '🍪', '🌼'],
        colorValue: 0xFFDCEDC8, // Pastel Light Green
      ),
      const NumberModel(
        digit: 7,
        wordTr: 'Yedi',
        wordEn: 'Seven',
        emojis: ['🍍', '🦊', '🚂', '🍦', '🌈'],
        colorValue: 0xFFFFF9C4, // Pastel Yellow
      ),
      const NumberModel(
        digit: 8,
        wordTr: 'Sekiz',
        wordEn: 'Eight',
        emojis: ['🥝', '🐵', '🚒', '🧁', '🌻'],
        colorValue: 0xFFFFE0B2, // Pastel Orange
      ),
      const NumberModel(
        digit: 9,
        wordTr: 'Dokuz',
        wordEn: 'Nine',
        emojis: ['🍑', '🐸', '🏎️', '🍭', '🦋'],
        colorValue: 0xFFD7CCC8, // Pastel Brown
      ),
      const NumberModel(
        digit: 10,
        wordTr: 'On',
        wordEn: 'Ten',
        emojis: ['🥭', '🦄', '🚀', '🍬', '✨'],
        colorValue: 0xFFCFD8DC, // Pastel Blue Grey
      ),
    ];
  }
}
