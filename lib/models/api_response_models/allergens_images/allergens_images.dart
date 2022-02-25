import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'allergens_images.freezed.dart';
part 'allergens_images.g.dart';

@freezed
class AllergenImageModel
    with BaseModel<AllergenImageModel>, _$AllergenImageModel {
  const AllergenImageModel._();
  const factory AllergenImageModel({
    String? title,
    String? imageUrl,
  }) = _AllergenImageModel;

  factory AllergenImageModel.fromJson(Map<String, dynamic> json) =>
      _$AllergenImageModelFromJson(json);

  @override
  AllergenImageModel fromMap(Map<String, dynamic> map) {
    return AllergenImageModel.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
