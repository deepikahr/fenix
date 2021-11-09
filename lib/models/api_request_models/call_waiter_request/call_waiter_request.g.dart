// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_waiter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CallWaiterRequest _$_$_CallWaiterRequestFromJson(Map<String, dynamic> json) {
  return _$_CallWaiterRequest(
    title: json['title'] as String?,
    description: json['description'] as String?,
    orderId: json['orderId'] as String?,
  );
}

Map<String, dynamic> _$_$_CallWaiterRequestToJson(
    _$_CallWaiterRequest instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'description': instance.description,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderId', instance.orderId);
  return val;
}
