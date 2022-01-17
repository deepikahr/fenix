// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChangePasswordRequest _$_$_ChangePasswordRequestFromJson(
    Map<String, dynamic> json) {
  return _$_ChangePasswordRequest(
    currentPassword: json['currentPassword'] as int?,
    newPassword: json['newPassword'] as int?,
  );
}

Map<String, dynamic> _$_$_ChangePasswordRequestToJson(
        _$_ChangePasswordRequest instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };
