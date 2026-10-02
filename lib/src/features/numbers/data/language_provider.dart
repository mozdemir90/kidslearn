import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/app_language.dart';

final appLanguageProvider = StateProvider<AppLanguage>((ref) {
  return AppLanguage.tr;
});
