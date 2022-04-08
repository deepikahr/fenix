// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentResponse _$_$_PaymentResponseFromJson(Map<String, dynamic> json) {
  return _$_PaymentResponse(
    id: json['_id'] as String?,
    orderID: json['orderID'] as int?,
    message: json['message'] as String?,
    qrCode: json['qrCode'] as String?,
  );
}

Map<String, dynamic> _$_$_PaymentResponseToJson(_$_PaymentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'orderID': instance.orderID,
      'message': instance.message,
      'qrCode': instance.qrCode,
    };
