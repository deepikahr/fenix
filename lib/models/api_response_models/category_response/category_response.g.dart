// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryResponse _$_$_CategoryResponseFromJson(Map<String, dynamic> json) {
  return _$_CategoryResponse(
    id: json['_id'] as String?,
    title: json['title'] as String?,
    imageUrl: json['imageUrl'] as String?,
    imageId: json['imageId'] as String?,
    filePath: json['filePath'] as String?,
  );
}

Map<String, dynamic> _$_$_CategoryResponseToJson(
        _$_CategoryResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'imageId': instance.imageId,
      'filePath': instance.filePath,
    };
