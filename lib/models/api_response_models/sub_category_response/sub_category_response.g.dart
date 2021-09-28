// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubCategoryResponse _$_$_SubCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return _$_SubCategoryResponse(
    status: json['status'] as bool? ?? false,
    id: json['_id'] as String?,
    franchiseId: json['franchiseId'] == null
        ? null
        : FranchiseModel.fromJson(json['franchiseId'] as Map<String, dynamic>),
    title: json['title'] as String?,
    description: json['description'] as String?,
    imageUrl: json['imageUrl'] as String?,
    imageId: json['imageId'] as String?,
    filePath: json['filePath'] as String?,
    menuId: json['menuId'] == null
        ? null
        : MenuResponse.fromJson(json['menuId'] as Map<String, dynamic>),
    categoryId: json['categoryId'] as String?,
    categoryName: json['categoryName'] as String?,
    franchiseName: json['franchiseName'] as String?,
  );
}

Map<String, dynamic> _$_$_SubCategoryResponseToJson(
        _$_SubCategoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      '_id': instance.id,
      'franchiseId': instance.franchiseId,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'imageId': instance.imageId,
      'filePath': instance.filePath,
      'menuId': instance.menuId,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'franchiseName': instance.franchiseName,
    };
