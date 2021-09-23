// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubCategoryRequest _$_$_SubCategoryRequestFromJson(
    Map<String, dynamic> json) {
  return _$_SubCategoryRequest(
    page: json['page'] as int?,
    limit: json['limit'] as int? ?? 25,
    menuId: json['menuId'] as String?,
  );
}

Map<String, dynamic> _$_$_SubCategoryRequestToJson(
        _$_SubCategoryRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'menuId': instance.menuId,
    };
