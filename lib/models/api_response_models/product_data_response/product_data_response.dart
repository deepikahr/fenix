import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fenix_user/models/api_response_models/product_model/product_model.dart';
import '../../base_model.dart';

part 'product_data_response.freezed.dart';
part 'product_data_response.g.dart';

@freezed
class ProductDataResponse with BaseModel<ProductDataResponse>, _$ProductDataResponse {
  const ProductDataResponse._();

  const factory ProductDataResponse({
    String? categoryTitle,
    ProductModel? product
  }) =
  _ProductDataResponse;

  factory ProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDataResponseFromJson(json);

  @override
  ProductDataResponse fromMap(Map<String, dynamic> map) {
    return ProductDataResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}

