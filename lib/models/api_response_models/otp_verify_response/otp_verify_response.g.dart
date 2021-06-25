// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OtpVerifyResponse _$_$_OtpVerifyResponseFromJson(Map<String, dynamic> json) {
  return _$_OtpVerifyResponse(
    token: json['token'] as String?,
    role: json['role'] as String?,
    id: json['id'] as String?,
    franchiseId: json['franchiseId'] as String?,
    vendorId: json['vendorId'] as String?,
  );
}

Map<String, dynamic> _$_$_OtpVerifyResponseToJson(
        _$_OtpVerifyResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'role': instance.role,
      'id': instance.id,
      'franchiseId': instance.franchiseId,
      'vendorId': instance.vendorId,
    };
