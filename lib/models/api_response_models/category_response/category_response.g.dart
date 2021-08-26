// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryResponse _$_$_CategoryResponseFromJson(Map<String, dynamic> json) {
  return _$_CategoryResponse(
    id: json['_id'] as String?,
    franchiseId: json['franchiseId'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    imageUrl: json['imageUrl'] as String?,
    imageId: json['imageId'] as String?,
    filePath: json['filePath'] as String?,
    topCategory: json['topCategory'] as String?,
  );
}

Map<String, dynamic> _$_$_CategoryResponseToJson(
        _$_CategoryResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'franchiseId': instance.franchiseId,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'imageId': instance.imageId,
      'filePath': instance.filePath,
      'topCategory': instance.topCategory,
    };
