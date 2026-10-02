enum AppLanguage {
  tr(
    code: 'tr',
    title: 'Türkçe',
    ttsLocale: 'tr-TR',
    flag: '🇹🇷',
  ),
  en(
    code: 'en',
    title: 'English',
    ttsLocale: 'en-US',
    flag: '🇬🇧',
  );

  final String code;
  final String title;
  final String ttsLocale;
  final String flag;

  const AppLanguage({
    required this.code,
    required this.title,
    required this.ttsLocale,
    required this.flag,
  });
}
