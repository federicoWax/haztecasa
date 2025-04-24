import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haztecasa/models/view_models/permissions_model.dart';
import 'package:haztecasa/view_models/permissions_view_model.dart';

final permissionsProvider = StateNotifierProvider<PermissionsViewModel, PermissionsModel>((ref) => PermissionsViewModel());
