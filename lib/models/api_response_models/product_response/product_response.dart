import 'package:fenix_user/models/api_response_models/htmlDataResponse/htmlDataResponse.dart';
import 'package:fenix_user/models/api_response_models/image_response/image_response.dart';
import 'package:fenix_user/models/api_response_models/tag_response/tag_response.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
class ProductResponse with BaseModel<ProductResponse>, _$ProductResponse {
  const ProductResponse._();

  const factory ProductResponse({
    @JsonKey(name: '_id') String? id,
    ImageResponse? productImage,
    List<String>? allergens,
    List<TagResponse>? tags,
    String? productName,
    String? productDescription,
  // "productDescription": "<p>Gobi Manchurian</p>",
    VariantResponse? variant
  }) =
  _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  @override
  ProductResponse fromMap(Map<String, dynamic> map) {
    return ProductResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}

