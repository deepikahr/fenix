import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with BaseModel<ProductModel>, _$ProductModel {
  const ProductModel._();

  const factory ProductModel(
      {@Default([]) List<ProductDetailsResponse>? data,
      @Default(0) int total}) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  @override
  ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
