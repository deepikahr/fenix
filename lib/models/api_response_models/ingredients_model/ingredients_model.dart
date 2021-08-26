import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';

part 'ingredients_model.freezed.dart';
part 'ingredients_model.g.dart';

@freezed
class IngredientsModel with BaseModel<IngredientsModel>, _$IngredientsModel {
  const IngredientsModel._();

  const factory IngredientsModel({
    @JsonKey(name: '_id') String? id,
    String? title,
  }) =
  _IngredientsModel;

  factory IngredientsModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientsModelFromJson(json);

  @override
  IngredientsModel fromMap(Map<String, dynamic> map) {
    return IngredientsModel.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}

