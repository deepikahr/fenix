import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'category_list_request.freezed.dart';
part 'category_list_request.g.dart';

@freezed
class CategoryListRequest
    with BaseModel<CategoryListRequest>, _$CategoryListRequest {
  const CategoryListRequest._();

  const factory CategoryListRequest({@Default(false) bool isVeg}) =
      _CategoryListRequest;

  factory CategoryListRequest.fromJson(Map<String, dynamic> json) =>
      _$CategoryListRequestFromJson(json);

  @override
  CategoryListRequest fromMap(Map<String, dynamic> map) {
    return CategoryListRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
