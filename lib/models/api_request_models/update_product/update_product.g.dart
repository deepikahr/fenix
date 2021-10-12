// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateProduct _$_$_UpdateProductFromJson(Map<String, dynamic> json) {
  return _$_UpdateProduct(
    productId: json['productId'] as String?,
    sizeName: json['sizeName'] as String?,
    quantity: json['quantity'] as int?,
    addOnItems: (json['addOnItems'] as List<dynamic>?)
            ?.map((e) => AddOnItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    modified_status:
        _$enumDecodeNullable(_$MODIFIED_STATUSEnumMap, json['modify']),
    productDetails: json['productDetails'] == null
        ? null
        : ProductDetailsResponse.fromJson(
            json['productDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UpdateProductToJson(_$_UpdateProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'sizeName': instance.sizeName,
      'quantity': instance.quantity,
      'addOnItems': instance.addOnItems,
      'modify': _$MODIFIED_STATUSEnumMap[instance.modified_status],
      'productDetails': instance.productDetails,
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

const _$MODIFIED_STATUSEnumMap = {
  MODIFIED_STATUS.quanity_update: 'QUANTITY_UPDATE',
  MODIFIED_STATUS.new_item: 'NEW_ITEM',
};
