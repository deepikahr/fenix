// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_on_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddOnCategory _$_$_AddOnCategoryFromJson(Map<String, dynamic> json) {
  return _$_AddOnCategory(
    id: json['_id'] as String?,
    addOnCategoryId: json['addOnCategoryId'] as String?,
    addOnCategoryName: json['addOnCategoryName'] as String?,
    selectionType: json['selectionType'] as String?,
    allItemSelected: json['allItemSelected'] as bool?,
    isRequired: json['required'] as bool?,
    addOnItems: (json['addOnItems'] as List<dynamic>?)
            ?.map((e) => AddOnItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_AddOnCategoryToJson(_$_AddOnCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'addOnCategoryId': instance.addOnCategoryId,
      'addOnCategoryName': instance.addOnCategoryName,
      'selectionType': instance.selectionType,
      'allItemSelected': instance.allItemSelected,
      'required': instance.isRequired,
      'addOnItems': instance.addOnItems,
    };
