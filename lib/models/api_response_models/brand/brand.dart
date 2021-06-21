import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant_saas/models/api_response_models/image/image_model.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'brand.freezed.dart';
part 'brand.g.dart';

@freezed
class Brand with BaseModel<Brand>, _$Brand {
  const Brand._();

  const factory Brand({
    ImageModel? logo,
    @JsonKey(name: '_id') String? id,
    String? restaurantName,
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  @override
  Brand fromMap(Map<String, dynamic> map) {
    return Brand.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
