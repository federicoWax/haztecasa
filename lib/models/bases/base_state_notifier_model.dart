import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haztecasa/models/bases/base_model.dart';

class BaseStateNotifier<T extends BaseModel> extends StateNotifier<T> {
  BaseStateNotifier(super.state);

  void clearError() {
    state = state.copyWith(error: null) as T;
  }
}
