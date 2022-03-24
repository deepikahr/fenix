import 'package:fenix_user/screens/category/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'category_request.freezed.dart';

part 'category_request.g.dart';

@freezed
class CategoryRequest with BaseModel<CategoryRequest>, _$CategoryRequest {
  const CategoryRequest._();

  const factory CategoryRequest({
    @Default(10) int limit,
    int? page,
    CATEGORY_TYPE? topCategory,
    String? menuId,
  }) = _CategoryRequest;

  factory CategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CategoryRequestFromJson(json);

  @override
  CategoryRequest fromMap(Map<String, dynamic> map) {
    return CategoryRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
