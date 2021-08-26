// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginVerifyResponse _$_$_LoginVerifyResponseFromJson(
    Map<String, dynamic> json) {
  return _$_LoginVerifyResponse(
    token: json['token'] as String?,
    role: json['role'] as String?,
    id: json['id'] as String?,
    franchiseId: json['franchiseId'] as String?,
    vendorId: json['vendorId'] as String?,
  );
}

Map<String, dynamic> _$_$_LoginVerifyResponseToJson(
        _$_LoginVerifyResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'role': instance.role,
      'id': instance.id,
      'franchiseId': instance.franchiseId,
      'vendorId': instance.vendorId,
    };
