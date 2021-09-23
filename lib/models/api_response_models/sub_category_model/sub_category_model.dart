import 'package:fenix_user/models/api_response_models/sub_category_response/sub_category_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'sub_category_model.freezed.dart';
part 'sub_category_model.g.dart';

@freezed
class SubCategoryModel with BaseModel<SubCategoryModel>, _$SubCategoryModel {
  const SubCategoryModel._();

  const factory SubCategoryModel({
    @Default([]) List<SubCategoryResponse> data,
    @Default(0) int total
  }) = _SubCategoryModel;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  @override
  SubCategoryModel fromMap(Map<String, dynamic> map) {
    return SubCategoryModel.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
