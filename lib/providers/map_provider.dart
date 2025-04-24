import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haztecasa/models/widgets/map_model.dart';
import 'package:haztecasa/view_models/map_view_model.dart';

final mapProvider = StateNotifierProvider<MapViewModel, MapModel>((ref) => MapViewModel());
