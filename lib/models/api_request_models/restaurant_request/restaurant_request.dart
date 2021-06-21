import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'restaurant_request.freezed.dart';
part 'restaurant_request.g.dart';

@freezed
class RestaurantRequest with BaseModel<RestaurantRequest>, _$RestaurantRequest {
  const RestaurantRequest._();

  const factory RestaurantRequest({
    String? vendorId,
    @JsonKey(includeIfNull: false) String? categoryId,
  }) = _RestaurantRequest;

  factory RestaurantRequest.fromJson(Map<String, dynamic> json) =>
      _$RestaurantRequestFromJson(json);

  @override
  RestaurantRequest fromMap(Map<String, dynamic> map) {
    return RestaurantRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
