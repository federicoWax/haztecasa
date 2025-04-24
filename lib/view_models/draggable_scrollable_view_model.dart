import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haztecasa/models/widgets/draggable_scrollable_model.dart';

class DraggableScrollableViewModel extends StateNotifier<DraggableScrollableModel> {
  final DraggableScrollableController controller = DraggableScrollableController();

  DraggableScrollableViewModel() : super(DraggableScrollableModel(dragSensitivity: 800, initialChildSize: 0.1, minChildSize: 0.1, maxChildSize: 0.9));

  void onVerticalDragUpdate(DragUpdateDetails details) {
    double newSize = controller.size - (details.primaryDelta ?? 0) / state.dragSensitivity;
    controller.jumpTo(newSize.clamp(0.1, 0.9));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
