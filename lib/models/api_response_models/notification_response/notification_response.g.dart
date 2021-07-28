// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationResponse _$_$_NotificationResponseFromJson(
    Map<String, dynamic> json) {
  return _$_NotificationResponse(
    id: json['_id'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    tableNumber: json['tableNumber'] as int?,
    franchiseId: json['franchiseId'] as String?,
    notifyType: json['notifyType'] as String?,
    createdAt: json['createdAt'] as String?,
  );
}

Map<String, dynamic> _$_$_NotificationResponseToJson(
        _$_NotificationResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'tableNumber': instance.tableNumber,
      'franchiseId': instance.franchiseId,
      'notifyType': instance.notifyType,
      'createdAt': instance.createdAt,
    };
