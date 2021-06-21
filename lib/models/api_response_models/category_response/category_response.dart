import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';

part 'category_response.freezed.dart';

part 'category_response.g.dart';

@freezed
class CategoryResponse with BaseModel<CategoryResponse>, _$CategoryResponse {
  const CategoryResponse._();

  const factory CategoryResponse({
    @JsonKey(name: '_id') String? id,
    String? title,
    String? description,
    @Default([]) List<Product> products,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  @override
  CategoryResponse fromMap(Map<String, dynamic> map) {
    return CategoryResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
