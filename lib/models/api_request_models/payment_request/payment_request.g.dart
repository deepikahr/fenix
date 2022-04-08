// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentRequest _$_$_PaymentRequestFromJson(Map<String, dynamic> json) {
  return _$_PaymentRequest(
    orderId: json['orderId'] as String?,
    paymentType:
        _$enumDecodeNullable(_$PAYMENT_TYPEEnumMap, json['paymentType']),
    tableNumber: json['tableNumber'] as int?,
    amount: (json['amount'] as num?)?.toDouble(),
    tipAmount: (json['tipAmount'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_PaymentRequestToJson(_$_PaymentRequest instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'paymentType': _$PAYMENT_TYPEEnumMap[instance.paymentType],
      'tableNumber': instance.tableNumber,
      'amount': instance.amount,
      'tipAmount': instance.tipAmount,
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
