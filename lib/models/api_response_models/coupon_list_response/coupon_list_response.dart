import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/coupon_response/coupon_response.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'coupon_list_response.freezed.dart';
part 'coupon_list_response.g.dart';

@freezed
class CouponListResponse
    with BaseModel<CouponListResponse>, _$CouponListResponse {
  const CouponListResponse._();

  const factory CouponListResponse({
    @Default(0) int total,
    @Default([]) List<CouponResponse> coupons,
  }) = _CouponListResponse;

  factory CouponListResponse.fromJson(Map<String, dynamic> json) =>
      _$CouponListResponseFromJson(json);

  @override
  CouponListResponse fromMap(Map<String, dynamic> map) {
    return CouponListResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
