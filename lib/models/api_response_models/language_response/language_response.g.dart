// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LanguageResponse _$_$_LanguageResponseFromJson(Map<String, dynamic> json) {
  return _$_LanguageResponse(
    id: json['_id'] as String?,
    title: json['title'] as String?,
    isDefault: json['isDefault'] as int?,
    languageCode: json['languageCode'] as String?,
    languageName: json['languageName'] as String?,
    filePath: json['filePath'] as String?,
    imageId: json['imageId'] as String?,
    imageUrl: json['imageUrl'] as String?,
  );
}

Map<String, dynamic> _$_$_LanguageResponseToJson(
        _$_LanguageResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'isDefault': instance.isDefault,
      'languageCode': instance.languageCode,
      'languageName': instance.languageName,
      'filePath': instance.filePath,
      'imageId': instance.imageId,
      'imageUrl': instance.imageUrl,
    };
