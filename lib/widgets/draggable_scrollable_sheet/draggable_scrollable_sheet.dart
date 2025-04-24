import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haztecasa/models/widgets/draggable_scrollable_model.dart';
import 'package:haztecasa/providers/draggable_scrollable_provider.dart';
import 'package:haztecasa/view_models/draggable_scrollable_view_model.dart';
import 'package:haztecasa/widgets/draggable_scrollable_sheet/grabber.dart';

class DraggableScrollableSheetWidget extends ConsumerWidget {
  const DraggableScrollableSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DraggableScrollableViewModel viewModel = ref.watch(draggableScrollableProvider.notifier);
    final DraggableScrollableModel model = ref.watch(draggableScrollableProvider);

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      controller: viewModel.controller,
      initialChildSize: model.initialChildSize,
      minChildSize: model.minChildSize,
      maxChildSize: model.maxChildSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(color: colorScheme.surface, borderRadius: const BorderRadius.vertical(top: Radius.circular(16))),
          child: Column(
            children: <Widget>[
              Grabber(onVerticalDragUpdate: viewModel.onVerticalDragUpdate),
              const SizedBox(height: 12), // Espacio entre el grabber y el texto
              Center(
                child: Container(
                  height: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0), // Añade espacio a los lados
                  decoration: BoxDecoration(
                    color: colorScheme.primary, // Cambia el color aquí
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      "Propiedades disponibles",
                      style: TextStyle(color: colorScheme.onPrimary, fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('Item $index', style: TextStyle(color: colorScheme.onSurface)));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
