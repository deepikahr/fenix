// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDetailsResponse _$_$_OrderDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _$_OrderDetailsResponse(
    id: json['_id'] as String?,
    isAcceptedByDeliveryBoy: json['isAcceptedByDeliveryBoy'] as bool?,
    amountPaid: (json['amountPaid'] as num?)?.toDouble() ?? 0,
    cart: (json['cart'] as List<dynamic>?)
            ?.map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    grandTotal: (json['grandTotal'] as num?)?.toDouble() ?? 0,
    subTotal: (json['subTotal'] as num?)?.toDouble() ?? 0,
    paymentType: json['paymentType'] as String?,
    restaurantName: json['restaurantName'] as String?,
    franchiseName: json['franchiseName'] as String?,
    franchiseId: json['franchiseId'] as String?,
    vendorId: json['vendorId'] as String?,
    userId: json['userId'] as String?,
    currencyCode: json['currencyCode'] as String?,
    currencySymbol: json['currencySymbol'] as String?,
    orderStatus:
        _$enumDecodeNullable(_$ORDER_STATUSEnumMap, json['orderStatus']),
    orderID: json['orderID'] as int?,
    tableNumber: json['tableNumber'] as int?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$_$_OrderDetailsResponseToJson(
        _$_OrderDetailsResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'isAcceptedByDeliveryBoy': instance.isAcceptedByDeliveryBoy,
      'amountPaid': instance.amountPaid,
      'cart': instance.cart,
      'grandTotal': instance.grandTotal,
      'subTotal': instance.subTotal,
      'paymentType': instance.paymentType,
      'restaurantName': instance.restaurantName,
      'franchiseName': instance.franchiseName,
      'franchiseId': instance.franchiseId,
      'vendorId': instance.vendorId,
      'userId': instance.userId,
      'currencyCode': instance.currencyCode,
      'currencySymbol': instance.currencySymbol,
      'orderStatus': _$ORDER_STATUSEnumMap[instance.orderStatus],
      'orderID': instance.orderID,
      'tableNumber': instance.tableNumber,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
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

const _$ORDER_STATUSEnumMap = {
  ORDER_STATUS.pending: 'PENDING',
  ORDER_STATUS.confirmed: 'CONFIRMED',
  ORDER_STATUS.completed: 'COMPLETED',
  ORDER_STATUS.cancelled: 'CANCELLED',
};
