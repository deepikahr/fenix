import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'coupon_response.freezed.dart';
part 'coupon_response.g.dart';

enum COUPON_TYPS {
  @JsonValue('PERCENTAGE')
  percentage,
  @JsonValue('AMOUNT')
  amount,
}

enum COUPON_FOR {
  @JsonValue('ORDER')
  order,
  @JsonValue('CATEGORY')
  category,
  @JsonValue('PRODUCT')
  product,
}

@freezed
class CouponResponse with BaseModel<CouponResponse>, _$CouponResponse {
  const CouponResponse._();

  const factory CouponResponse({
    @JsonKey(name: '_id') String? id,
    String? description,
    String? couponCode,
    COUPON_TYPS? couponType,
    COUPON_FOR? couponFor,
    String? categoryId,
    String? franchiseId,
    String? productId,
    bool? status,
    @Default(0) double offerValue,
    @Default(0) double minimumOrderAmount,
    int? startDate,
    int? expiryDate,
  }) = _CouponResponse;

  factory CouponResponse.fromJson(Map<String, dynamic> json) =>
      _$CouponResponseFromJson(json);

  @override
  CouponResponse fromMap(Map<String, dynamic> map) {
    return CouponResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
