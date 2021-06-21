import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';
import 'package:restaurant_saas/models/api_response_models/brand/brand.dart';

part 'brand_response.freezed.dart';

part 'brand_response.g.dart';

@freezed
class BrandResponse with BaseModel<BrandResponse>, _$BrandResponse {
  const BrandResponse._();

  const factory BrandResponse(
      {@Default([]) List<Brand> data, @Default(0) int total}) = _BrandResponse;

  factory BrandResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseFromJson(json);

  @override
  BrandResponse fromMap(Map<String, dynamic> map) {
    return BrandResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
