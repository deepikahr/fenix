import 'package:fenix_user/models/api_response_models/product_response/product_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with BaseModel<Cart>, _$Cart {
  Cart._();

  factory Cart({
    String? vendorId,
    String? restaurantName,
    String? franchiseName,
    String? franchiseId,
    int? preparationTime,
    @JsonKey(name: 'cart') @Default([]) List<ProductResponse> products,
    String? couponCode,
    @Default(0) double couponAmount,
    @Default(0) double tipAmount,
    @Default(0) double subTotal,
    @Default(0) double tax,
    @Default(0) double deliveryCharges,
    @Default(0) double grandTotal,
    // UserAddress? address,
    @Default('USER_APP') String orderFrom,
    @Default('COD') String paymentType,
    @Default(false) bool isWalletUsed,
    @Default(0) double usedWalletAmount,
    // CartStripeInfo? paymentInfo,
  }) = _Cart;

  late final int cartCount = products.length;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  @override
  Cart fromMap(Map<String, dynamic> map) {
    return Cart.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
