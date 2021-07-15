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
    orderStatus: json['orderStatus'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$_$_OrderStatusHistoryToJson(
        _$_OrderStatusHistory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'timestamp': instance.timestamp,
      'orderStatus': instance.orderStatus,
      'message': instance.message,
    };
