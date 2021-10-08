import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'sub_category_request.freezed.dart';

part 'sub_category_request.g.dart';

@freezed
class SubCategoryRequest
    with BaseModel<SubCategoryRequest>, _$SubCategoryRequest {
  const SubCategoryRequest._();

  const factory SubCategoryRequest({
    String? category,
    // int? page,
    // @Default(10) int limit,
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
