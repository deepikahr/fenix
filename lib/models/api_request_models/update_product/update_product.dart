import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'update_product.freezed.dart';
part 'update_product.g.dart';

enum MODIFIED_STATUS {
  @JsonValue('QUANTITY_UPDATE')
  quanity_update,
  @JsonValue('NEW_ITEM')
  new_item
}

@freezed
class UpdateProduct with BaseModel<UpdateProduct>, _$UpdateProduct {
  const UpdateProduct._();

  const factory UpdateProduct({
    String? productId,
    String? sizeName,
    int? quantity,
    @Default([]) List<AddOnItem> addOnItems,
    @JsonKey(name: 'modify') MODIFIED_STATUS? modified_status,
    ProductDetailsResponse? productDetails,
  }) = _UpdateProduct;

  factory UpdateProduct.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductFromJson(json);

  @override
  UpdateProduct fromMap(Map<String, dynamic> map) {
    return UpdateProduct.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
