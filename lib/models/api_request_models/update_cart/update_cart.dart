import 'package:fenix_user/models/api_request_models/update_product/update_product.dart';
import 'package:fenix_user/models/api_response_models/cart_product/cart_product.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/product_response/product_response.dart';
import 'package:fenix_user/screens/product/product_details/productDetails.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'update_cart.freezed.dart';
part 'update_cart.g.dart';

@freezed
class UpdateCart with BaseModel<UpdateCart>, _$UpdateCart {
  UpdateCart._();

  factory UpdateCart({
    String? orderId,
    @Default([]) List<UpdateProduct> products,
  }) = _UpdateCart;

  factory UpdateCart.fromJson(Map<String, dynamic> json) => _$UpdateCartFromJson(json);

  @override
  UpdateCart fromMap(Map<String, dynamic> map) {
    return UpdateCart.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
