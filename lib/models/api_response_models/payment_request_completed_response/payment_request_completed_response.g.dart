// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request_completed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentRequestCompletedResponse _$_$_PaymentRequestCompletedResponseFromJson(
    Map<String, dynamic> json) {
  return _$_PaymentRequestCompletedResponse(
    id: json['_id'] as String?,
    waiterId: json['waiterId'] as String?,
    paymentStatus:
        _$enumDecodeNullable(_$PAYMENT_STATUSEnumMap, json['paymentStatus']),
    message: json['message'] as String?,
    orderId: json['orderId'] as String?,
    paymentType:
        _$enumDecodeNullable(_$PAYMENT_TPESEnumMap, json['paymentType']),
  );
}

Map<String, dynamic> _$_$_PaymentRequestCompletedResponseToJson(
        _$_PaymentRequestCompletedResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'waiterId': instance.waiterId,
      'paymentStatus': _$PAYMENT_STATUSEnumMap[instance.paymentStatus],
      'message': instance.message,
      'orderId': instance.orderId,
      'paymentType': _$PAYMENT_TPESEnumMap[instance.paymentType],
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

const _$PAYMENT_STATUSEnumMap = {
  PAYMENT_STATUS.pending: 'PENDING',
  PAYMENT_STATUS.completed: 'COMPLETED',
  PAYMENT_STATUS.inProgress: 'IN_PROGRESS',
};

const _$PAYMENT_TPESEnumMap = {
  PAYMENT_TPES.payInCash: 'PAY_IN_CASH',
  PAYMENT_TPES.payWithCard: 'PAY_WITH_CARD',
  PAYMENT_TPES.nfc: 'NFC',
};
