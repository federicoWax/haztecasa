class BaseModel {
  final String? error;

  const BaseModel({this.error});

  BaseModel copyWith({String? error}) {
    return BaseModel(error: error ?? this.error);
  }
}
