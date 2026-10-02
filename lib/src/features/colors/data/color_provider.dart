import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'color_repository.dart';
import '../domain/color_model.dart';

final colorRepositoryProvider = Provider<ColorRepository>((ref) {
  return ColorRepository();
});

final colorListProvider = Provider<List<ColorModel>>((ref) {
  return ref.watch(colorRepositoryProvider).getColors();
});
