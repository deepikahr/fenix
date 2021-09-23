import 'package:fenix_user/models/api_response_models/franchise_model/franchise_model.dart';
import 'package:fenix_user/models/api_response_models/menu_response/menu_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';

part 'sub_category_response.freezed.dart';
part 'sub_category_response.g.dart';

@freezed
class SubCategoryResponse with BaseModel<SubCategoryResponse>, _$SubCategoryResponse {
  const SubCategoryResponse._();

  const factory SubCategoryResponse({

  @Default(false) bool status,
  @JsonKey(name: '_id') String? id,
  FranchiseModel? franchiseId,
  String? title,
  String? description,
  String? imageUrl,
  String? imageId,
  String? filePath,
  MenuResponse? menuId,
  String? categoryId,
  String? categoryName,
  String? franchiseName

  }) = _SubCategoryResponse;

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryResponseFromJson(json);

  @override
  SubCategoryResponse fromMap(Map<String, dynamic> map) {
    return SubCategoryResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
