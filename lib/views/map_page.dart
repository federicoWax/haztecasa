import 'package:flutter/material.dart';
import 'package:haztecasa/models/property/property.dart';
import 'package:haztecasa/widgets/draggable_scrollable_sheet/draggable_scrollable_sheet.dart';
import 'package:haztecasa/widgets/list_properties/list_properties.dart';
import 'package:haztecasa/widgets/list_properties/list_properties_header.dart';
import 'package:haztecasa/widgets/mapbox/mapbox.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Mapbox(),
          DraggableScrollableSheetWidget(
            headerList: ListPropertiesHeader(totalList: listPropertyDummy.length),
            listBuilder: (scrollController) => ListProperties(scrollController: scrollController),
          ),
        ],
      ),
    );
  }
}
