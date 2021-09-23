import 'package:fenix_user/screens/category/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'sub_category_request.freezed.dart';

part 'sub_category_request.g.dart';

@freezed
class SubCategoryRequest with BaseModel<SubCategoryRequest>, _$SubCategoryRequest {
  const SubCategoryRequest._();

  const factory SubCategoryRequest({
    int? page,
    @Default(25) int limit,
    String? menuId,
  }) = _SubCategoryRequest;

  factory SubCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryRequestFromJson(json);

  @override
  SubCategoryRequest fromMap(Map<String, dynamic> map) {
    return SubCategoryRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
