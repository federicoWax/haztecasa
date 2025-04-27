import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haztecasa/models/widgets/draggable_scrollable_model.dart';
import 'package:haztecasa/providers/draggable_scrollable_provider.dart';
import 'package:haztecasa/view_models/draggable_scrollable_view_model.dart';
import 'package:haztecasa/widgets/draggable_scrollable_sheet/grabber.dart';

class DraggableScrollableSheetWidget<T> extends ConsumerWidget {
  final Widget headerList;
  final Widget Function(ScrollController scrollController) listBuilder;
  const DraggableScrollableSheetWidget({super.key, required this.listBuilder, required this.headerList});

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
          decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
          child: Column(
            children: <Widget>[
              Grabber(onVerticalDragUpdate: viewModel.onVerticalDragUpdate),
              SizedBox(height: 4.h),
              GestureDetector(behavior: HitTestBehavior.translucent, onVerticalDragUpdate: viewModel.onVerticalDragUpdate, child: headerList),
              SizedBox(height: 12.h),
              Flexible(child: listBuilder(scrollController)),
            ],
          ),
        );
      },
    );
  }
}
