import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/image_response/image_response.dart';
import 'package:fenix_user/models/api_response_models/ingredients_model/ingredients_model.dart';
import 'package:fenix_user/models/api_response_models/order_status_history/order_status_history.dart';
import 'package:fenix_user/models/api_response_models/tag_response/tag_response.dart';
import 'package:fenix_user/models/api_response_models/tax_info_model/tax_info_model.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
class CartProduct with BaseModel<CartProduct>, _$CartProduct {
  const CartProduct._();

  const factory CartProduct({
    @JsonKey(name: '_id') String? id,
  ImageResponse? productImage,
  TaxInfoModel? taxInfo,
  @Default([]) List<AddOnItem> addOnItems,
  @Default([]) List<OrderStatusHistory> orderStatusHistory,
  String? productName,
  String? categoryName,
  String? categoryId,
  @Default(0) int originalPrice,
  @Default(0) int sellingPrice,
  String? description,
  @Default(0) double totalProductPrice,
  @Default(1) quantity,
  String? productId,
  String? paymentStatus,
  String? orderStatus
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  @override
  CartProduct fromMap(Map<String, dynamic> map) {
    return CartProduct.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
