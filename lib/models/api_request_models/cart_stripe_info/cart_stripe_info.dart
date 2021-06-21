import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'cart_stripe_info.freezed.dart';
part 'cart_stripe_info.g.dart';

@freezed
class CartStripeInfo with BaseModel<CartStripeInfo>, _$CartStripeInfo {
  const CartStripeInfo._();

  const factory CartStripeInfo({
    String? paymentMethodId,
    String? paymentMethodType,
  }) = _CartStripeInfo;
  factory CartStripeInfo.fromJson(Map<String, dynamic> json) =>
      _$CartStripeInfoFromJson(json);

  @override
  CartStripeInfo fromMap(Map<String, dynamic> map) {
    return CartStripeInfo.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
