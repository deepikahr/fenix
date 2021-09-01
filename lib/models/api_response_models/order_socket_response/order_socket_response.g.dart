// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_socket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderSocketRequest _$_$_OrderSocketRequestFromJson(
    Map<String, dynamic> json) {
  return _$_OrderSocketRequest(
    orderStatus:
        _$enumDecodeNullable(_$ORDER_STATUSEnumMap, json['orderStatus']),
  );
}

Map<String, dynamic> _$_$_OrderSocketRequestToJson(
        _$_OrderSocketRequest instance) =>
    <String, dynamic>{
      'orderStatus': _$ORDER_STATUSEnumMap[instance.orderStatus],
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
