import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/models/api_response_models/coupon_response/coupon_response.dart';

part 'applyCouponState.freezed.dart';

@freezed
class ApplyCouponState with _$ApplyCouponState {
  const factory ApplyCouponState({
    @Default(true) bool isLoading,
    @Default([]) List<CouponResponse> couponsList,
    @Default(1) int pageNumber,
    @Default(0) int total,
    Cart? cart,
    String? currencySymbol,
  }) = _Default;
}
