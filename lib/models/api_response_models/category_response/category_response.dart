import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'category_response.freezed.dart';
part 'category_response.g.dart';

@freezed
class CategoryResponse with BaseModel<CategoryResponse>, _$CategoryResponse {
  const CategoryResponse._();

  const factory CategoryResponse({
    @Default(0) int subCategoryCount,
    @Default(false) bool isDealAvailable,
    @Default(false) bool status,
    @Default(false) bool isCopy,
    @JsonKey(name: '_id') String? id,
    String? franchiseId,
    String? title,
    String? description,
    String? imageUrl,
    String? imageId,
    String? filePath,
    String? topCategory,
    String? vendorId,
    String? menuId,
    String? franchiseName,
    String? createdAt,
    String? updatedAt,
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
