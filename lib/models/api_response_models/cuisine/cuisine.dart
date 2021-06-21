import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'cuisine.freezed.dart';
part 'cuisine.g.dart';

@freezed
class Cuisine with BaseModel<Cuisine>, _$Cuisine {
  const Cuisine._();

  const factory Cuisine({
    @JsonKey(name: '_id') String? id,
    String? cuisineName,
    String? imageUrl,
    String? filePath,
  }) = _Cuisine;

  factory Cuisine.fromJson(Map<String, dynamic> json) =>
      _$CuisineFromJson(json);

  @override
  Cuisine fromMap(Map<String, dynamic> map) {
    return Cuisine.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
