import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';
import 'package:restaurant_saas/models/api_response_models/cuisine/cuisine.dart';
part 'cuisine_response.freezed.dart';

part 'cuisine_response.g.dart';

@freezed
class CuisineResponse with BaseModel<CuisineResponse>, _$CuisineResponse {
  const CuisineResponse._();

  const factory CuisineResponse(
      {@Default([]) List<Cuisine> data,
      @Default(0) int total}) = _CuisineResponse;

  factory CuisineResponse.fromJson(Map<String, dynamic> json) =>
      _$CuisineResponseFromJson(json);

  @override
  CuisineResponse fromMap(Map<String, dynamic> map) {
    return CuisineResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
