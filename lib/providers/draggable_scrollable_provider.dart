import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haztecasa/models/widgets/draggable_scrollable_model.dart';
import 'package:haztecasa/view_models/draggable_scrollable_view_model.dart';

final draggableScrollableProvider = StateNotifierProvider<DraggableScrollableViewModel, DraggableScrollableModel>(
  (ref) => DraggableScrollableViewModel(),
);
