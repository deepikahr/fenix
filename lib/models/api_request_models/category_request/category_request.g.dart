// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryRequest _$_$_CategoryRequestFromJson(Map<String, dynamic> json) {
  return _$_CategoryRequest(
    limit: json['limit'] as int? ?? 10,
    page: json['page'] as int?,
    topCategory:
        _$enumDecodeNullable(_$CATEGORY_TYPEEnumMap, json['topCategory']),
    menuId: json['menuId'] as String?,
  );
}

Map<String, dynamic> _$_$_CategoryRequestToJson(_$_CategoryRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'topCategory': _$CATEGORY_TYPEEnumMap[instance.topCategory],
      'menuId': instance.menuId,
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

const _$CATEGORY_TYPEEnumMap = {
  CATEGORY_TYPE.beverageCategory: 'BEVERAGE_CATEGORY',
  CATEGORY_TYPE.foodCategory: 'FOOD_CATEGORY',
};
