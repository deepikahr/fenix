// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderStatusHistory _$_$_OrderStatusHistoryFromJson(
    Map<String, dynamic> json) {
  return _$_OrderStatusHistory(
    id: json['_id'] as String?,
    timestamp: json['timestamp'] as int?,
    orderStatus:
        _$enumDecodeNullable(_$ORDER_STATUSEnumMap, json['orderStatus']),
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$_$_OrderStatusHistoryToJson(
        _$_OrderStatusHistory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'timestamp': instance.timestamp,
      'orderStatus': _$ORDER_STATUSEnumMap[instance.orderStatus],
      'message': instance.message,
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
