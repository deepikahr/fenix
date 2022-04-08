// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$_$_CartFromJson(Map<String, dynamic> json) {
  return _$_Cart(
    products: (json['cart'] as List<dynamic>)
        .map((e) => ProductDetailsResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    grandTotal: json['grandTotal'] ?? 0,
    subTotal: json['subTotal'] ?? 0,
    taxTotal: json['taxTotal'] ?? 0,
    deliveryType: json['deliveryType'] as String?,
    paymentType:
        _$enumDecodeNullable(_$PAYMENT_TYPEEnumMap, json['paymentType']) ??
            PAYMENT_TYPE.payInCash,
    restaurantName: json['restaurantName'] as String?,
    franchiseName: json['franchiseName'] as String?,
    franchiseId: json['franchiseId'] as String?,
    vendorId: json['vendorId'] as String?,
    userId: json['userId'] as String?,
    modifiedCart: json['modifiedCart'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'cart': instance.products,
      'grandTotal': instance.grandTotal,
      'subTotal': instance.subTotal,
      'taxTotal': instance.taxTotal,
      'deliveryType': instance.deliveryType,
      'paymentType': _$PAYMENT_TYPEEnumMap[instance.paymentType],
      'restaurantName': instance.restaurantName,
      'franchiseName': instance.franchiseName,
      'franchiseId': instance.franchiseId,
      'vendorId': instance.vendorId,
      'userId': instance.userId,
      'modifiedCart': instance.modifiedCart,
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

const _$PAYMENT_TYPEEnumMap = {
  PAYMENT_TYPE.payInCash: 'PAY_IN_CASH',
  PAYMENT_TYPE.payWithCard: 'PAY_WITH_CARD',
  PAYMENT_TYPE.payWithQR: 'PAY_WITH_QR',
  PAYMENT_TYPE.nfc: 'NFC',
};
