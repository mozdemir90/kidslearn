import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'shape_repository.dart';
import '../domain/shape_model.dart';

final shapeRepositoryProvider = Provider<ShapeRepository>((ref) {
  return ShapeRepository();
});

final shapeListProvider = Provider<List<ShapeModel>>((ref) {
  return ref.watch(shapeRepositoryProvider).getShapes();
});
