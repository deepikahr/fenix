import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
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
