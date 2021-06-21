import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'product_size_request.freezed.dart';
part 'product_size_request.g.dart';

@freezed
class ProductSizeRequest
    with BaseModel<ProductSizeRequest>, _$ProductSizeRequest {
  const ProductSizeRequest._();

  const factory ProductSizeRequest({String? productsizeId}) =
      _ProductSizeRequest;

  factory ProductSizeRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductSizeRequestFromJson(json);

  @override
  ProductSizeRequest fromMap(Map<String, dynamic> map) {
    return ProductSizeRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
