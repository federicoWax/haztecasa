import 'package:haztecasa/models/bases/base_state_notifier_model.dart';
import '../models/widgets/map_model.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapViewModel extends BaseStateNotifier<MapModel> {
  MapViewModel()
    : super(
        MapModel(
          accessToken: const String.fromEnvironment("ACCESS_TOKEN"),
          camera: CameraOptions(center: Point(coordinates: Position(-110.9773, 29.1026)), zoom: 6, bearing: 0, pitch: 0),
        ),
      ) {
    MapboxOptions.setAccessToken(state.accessToken);
  }

  void setController(MapboxMap controller) {
    state = state.copyWith(controller: controller);
  }

  void moveCameraWhitAnimation(CameraOptions camera) {
    state.controller?.flyTo(camera, MapAnimationOptions(duration: 1500));
    state = state.copyWith(camera: camera);
  }
}
