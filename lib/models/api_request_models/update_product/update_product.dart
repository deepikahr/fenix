import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/image_response/image_response.dart';
import 'package:fenix_user/models/api_response_models/ingredients_model/ingredients_model.dart';
import 'package:fenix_user/models/api_response_models/tag_response/tag_response.dart';
import 'package:fenix_user/models/api_response_models/tax_info_model/tax_info_model.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';

part 'update_product.freezed.dart';
part 'update_product.g.dart';

@freezed
class UpdateProduct with BaseModel<UpdateProduct>, _$UpdateProduct {
  const UpdateProduct._();

  const factory UpdateProduct({
    String? productId,
    String? sizeName,
    int? quantity,
    @Default([]) List<AddOnItem> addOnItems,
  }) =
  _UpdateProduct;

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