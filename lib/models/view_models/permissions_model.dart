import 'package:geolocator/geolocator.dart' as geo;
import 'package:haztecasa/models/bases/base_model.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class PermissionsModel extends BaseModel {
  final geo.LocationPermission locationStatus;
  final Position position;

  const PermissionsModel({required this.locationStatus, required this.position, super.error});

  @override
  PermissionsModel copyWith({geo.LocationPermission? locationStatus, Position? position, String? error}) {
    return PermissionsModel(locationStatus: locationStatus ?? this.locationStatus, position: position ?? this.position, error: error ?? this.error);
  }
}
