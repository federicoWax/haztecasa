import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haztecasa/models/view_models/permissions_model.dart';
import 'package:haztecasa/providers/map_provider.dart';
import 'package:haztecasa/providers/permissions_provider.dart';
import 'package:haztecasa/widgets/my_consumer_widget/my_consumer_widget.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;

class Mapbox extends ConsumerStatefulWidget {
  const Mapbox({super.key});

  @override
  ConsumerState<Mapbox> createState() => _MapboxState();
}

class _MapboxState extends ConsumerState<Mapbox> {
  @override
  Widget build(BuildContext context) {
    ref.listen<PermissionsModel>(permissionsProvider, (previous, next) {
      if (previous?.locationStatus == next.locationStatus ||
          (next.locationStatus == geo.LocationPermission.denied) ||
          next.locationStatus == geo.LocationPermission.deniedForever) {
        return;
      }

      final position = next.position;

      ref
          .read(mapProvider.notifier)
          .moveCameraWhitAnimation(CameraOptions(center: Point(coordinates: Position(position.lat, position.lng)), zoom: 8, bearing: 0, pitch: 0));
    });

    return MyConsumerWidget(
      providers: [mapProvider, permissionsProvider],
      builder: (context, ref) {
        ref.watch(permissionsProvider);
        final mapModel = ref.watch(mapProvider);

        return MapWidget(
          cameraOptions: mapModel.camera,
          onMapCreated: (controller) {
            ref.read(mapProvider.notifier).setController(controller);
          },
        );
      },
    );
  }
}
