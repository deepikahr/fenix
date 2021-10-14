import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fenix_user/models/api_response_models/product_model/product_model.dart';
import '../../base_model.dart';

part 'sub_category_product_data_response.freezed.dart';
part 'sub_category_product_data_response.g.dart';

@freezed
class SubCategoryProductDataResponse
    with
        BaseModel<SubCategoryProductDataResponse>,
        _$SubCategoryProductDataResponse {
  const SubCategoryProductDataResponse._();

  const factory SubCategoryProductDataResponse(
      {String? subCategoryTitle,
      ProductModel? product}) = _SubCategoryProductDataResponse;

  factory SubCategoryProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryProductDataResponseFromJson(json);

  @override
  SubCategoryProductDataResponse fromMap(Map<String, dynamic> map) {
    return SubCategoryProductDataResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
