import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'base_model.dart';

abstract class BaseStateNotifier<T extends BaseModel> extends StateNotifier<T> {
  BaseStateNotifier(super.state);

  void clearError() {
    state = state.copyWith(error: null) as T;
  }
}
