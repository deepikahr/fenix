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
    selectionType:
        _$enumDecodeNullable(_$SELECTION_TYPEEnumMap, json['selectionType']),
    allItemSelected: json['allItemSelected'] as bool?,
    isRequired: json['required'] as bool?,
    addOnItems: (json['addOnItems'] as List<dynamic>?)
            ?.map((e) => AddOnItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    selectionValue: json['selectionValue'] as int?,
    limitNumber: json['limitNumber'] as int?,
  );
}

Map<String, dynamic> _$_$_AddOnCategoryToJson(_$_AddOnCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'addOnCategoryId': instance.addOnCategoryId,
      'addOnCategoryName': instance.addOnCategoryName,
      'selectionType': _$SELECTION_TYPEEnumMap[instance.selectionType],
      'allItemSelected': instance.allItemSelected,
      'required': instance.isRequired,
      'addOnItems': instance.addOnItems,
      'selectionValue': instance.selectionValue,
      'limitNumber': instance.limitNumber,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$SELECTION_TYPEEnumMap = {
  SELECTION_TYPE.multiple: 'MULTI_SELECT',
  SELECTION_TYPE.single: 'SINGLE_SELECT',
};
