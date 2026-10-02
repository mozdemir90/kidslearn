import '../../../constants/app_language.dart';

class NumberModel {
  final int digit;
  final String wordTr;
  final String wordEn;
  final List<String> emojis;
  final int colorValue;

  const NumberModel({
    required this.digit,
    required this.wordTr,
    required this.wordEn,
    required this.emojis,
    required this.colorValue,
  });

  String getWord(AppLanguage language) {
    switch (language) {
      case AppLanguage.tr:
        return wordTr;
      case AppLanguage.en:
        return wordEn;
    }
  }

  // Backwards compatibility getter
  String get word => wordTr;
}
