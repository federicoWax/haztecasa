import 'package:geolocator/geolocator.dart' as geo;
import 'package:haztecasa/models/bases/base_state_notifier_model.dart';
import 'package:haztecasa/models/view_models/permissions_model.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class PermissionsViewModel extends BaseStateNotifier<PermissionsModel> {
  PermissionsViewModel() : super(PermissionsModel(locationStatus: geo.LocationPermission.denied, position: Position(29.072967, 110.955919))) {
    _init();
  }
  final geo.GeolocatorPlatform _geolocatorPlatform = geo.GeolocatorPlatform.instance;

  Future<void> _init() async {
    try {
      final hasPermission = await _handlePermission();

      if (!hasPermission) {
        return;
      }

      final position = await _geolocatorPlatform.getCurrentPosition();
      final locationStatus = await _geolocatorPlatform.checkPermission();

      state = state.copyWith(position: Position(position.latitude, position.longitude), locationStatus: locationStatus);
    } catch (e) {
      final error = e.toString();

      if (error == "User denied permissions to access the device's location.") return;

      state = state.copyWith(error: error);
    }
  }

  Future<bool> _handlePermission() async {
    try {
      geo.LocationPermission permission;
      bool serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return false;
      }

      permission = await _geolocatorPlatform.checkPermission();

      if (permission == geo.LocationPermission.deniedForever) {
        return false;
      }

      if (permission == geo.LocationPermission.denied) {
        permission = await _geolocatorPlatform.requestPermission();

        if (permission == geo.LocationPermission.denied) {
          return false;
        }
      }

      return true;
    } catch (e) {
      throw Exception("Error al solicitar permisos de ubicación.");
    }
  }
}
