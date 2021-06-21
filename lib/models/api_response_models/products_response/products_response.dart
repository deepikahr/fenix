import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'products_response.freezed.dart';

part 'products_response.g.dart';

@freezed
class ProductsResponse with BaseModel<ProductsResponse>, _$ProductsResponse {
  const ProductsResponse._();

  const factory ProductsResponse(
      {@Default([]) List<Product> data,
      @Default(0) int total}) = _ProductsResponse;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  @override
  ProductsResponse fromMap(Map<String, dynamic> map) {
    return ProductsResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
