// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_order_socket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateOrderSocketResponse _$_$_UpdateOrderSocketResponseFromJson(
    Map<String, dynamic> json) {
  return _$_UpdateOrderSocketResponse(
    action:
        _$enumDecodeNullable(_$ACTION_MODIFICATIONEnumMap, json['action']) ??
            ACTION_MODIFICATION.reject,
    id: json['_id'] as String?,
    localCart: json['localCart'] == null
        ? null
        : Cart.fromJson(json['localCart'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UpdateOrderSocketResponseToJson(
        _$_UpdateOrderSocketResponse instance) =>
    <String, dynamic>{
      'action': _$ACTION_MODIFICATIONEnumMap[instance.action],
      '_id': instance.id,
      'localCart': instance.localCart,
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

const _$ACTION_MODIFICATIONEnumMap = {
  ACTION_MODIFICATION.accept: 'ACCEPTED',
  ACTION_MODIFICATION.reject: 'REJECTED',
};
