import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/image_response/image_response.dart';
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
    VariantResponse? variant,
    TaxInfoModel? taxInfo,
    bool? isPaid,
    List<TagResponse>? tags,
    @Default([]) List<AddOnItem> selectedAddOnItems,
    String? category,
    String? productName,
    bool? isVeg,
    String? subCategory,
    String? menuId,
    String? categoryName,
    String? productDescription,
    @Default(0) double totalProductPrice,
    @Default(1) variantQuantity,
    @Default(0) double tax,
    String? productId,
    String? productInstructions,
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
