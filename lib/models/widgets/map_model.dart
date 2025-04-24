import 'package:haztecasa/models/bases/base_model.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapModel extends BaseModel {
  final CameraOptions camera;
  final String accessToken;
  final MapboxMap? controller;

  const MapModel({required this.camera, required this.accessToken, this.controller});

  @override
  MapModel copyWith({CameraOptions? camera, String? accessToken, MapboxMap? controller, String? error}) {
    return MapModel(camera: camera ?? this.camera, accessToken: accessToken ?? this.accessToken, controller: controller ?? this.controller);
  }
}
