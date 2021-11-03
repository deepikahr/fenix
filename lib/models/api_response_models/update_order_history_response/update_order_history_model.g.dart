// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_order_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateOrderHistoryModel _$_$_UpdateOrderHistoryModelFromJson(
    Map<String, dynamic> json) {
  return _$_UpdateOrderHistoryModel(
    action: _$enumDecodeNullable(
            _$ACTION_MODIFICATIONEnumMap, json['modifyRequest']) ??
        ACTION_MODIFICATION.Pending,
    id: json['_id'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    localCart: json['localCart'] == null
        ? null
        : Cart.fromJson(json['localCart'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UpdateOrderHistoryModelToJson(
        _$_UpdateOrderHistoryModel instance) =>
    <String, dynamic>{
      'modifyRequest': _$ACTION_MODIFICATIONEnumMap[instance.action],
      '_id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
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
  ACTION_MODIFICATION.Pending: 'IN_PROGRESS',
};
