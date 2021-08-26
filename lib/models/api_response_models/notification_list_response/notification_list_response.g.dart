// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationListResponse _$_$_NotificationListResponseFromJson(
    Map<String, dynamic> json) {
  return _$_NotificationListResponse(
    data: (json['data'] as List<dynamic>?)
            ?.map(
                (e) => NotificationResponse.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_NotificationListResponseToJson(
        _$_NotificationListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
