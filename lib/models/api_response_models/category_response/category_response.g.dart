// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryResponse _$_$_CategoryResponseFromJson(Map<String, dynamic> json) {
  return _$_CategoryResponse(
    subCategoryCount: json['subCategoryCount'] as int? ?? 0,
    isDealAvailable: json['isDealAvailable'] as bool? ?? false,
    status: json['status'] as bool? ?? false,
    isCopy: json['isCopy'] as bool? ?? false,
    id: json['_id'] as String?,
    franchiseId: json['franchiseId'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    imageUrl: json['imageUrl'] as String?,
    imageId: json['imageId'] as String?,
    filePath: json['filePath'] as String?,
    topCategory: json['topCategory'] as String?,
    vendorId: json['vendorId'] as String?,
    menuId: json['menuId'] as String?,
    franchiseName: json['franchiseName'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$_$_CategoryResponseToJson(
        _$_CategoryResponse instance) =>
    <String, dynamic>{
      'subCategoryCount': instance.subCategoryCount,
      'isDealAvailable': instance.isDealAvailable,
      'status': instance.status,
      'isCopy': instance.isCopy,
      '_id': instance.id,
      'franchiseId': instance.franchiseId,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'imageId': instance.imageId,
      'filePath': instance.filePath,
      'topCategory': instance.topCategory,
      'vendorId': instance.vendorId,
      'menuId': instance.menuId,
      'franchiseName': instance.franchiseName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
