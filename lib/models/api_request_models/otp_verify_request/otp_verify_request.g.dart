// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OtpVerifyRequest _$_$_OtpVerifyRequestFromJson(Map<String, dynamic> json) {
  return _$_OtpVerifyRequest(
    tableNumber: json['tableNumber'] as int?,
    franchiseCode: json['franchiseCode'] as int?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$_$_OtpVerifyRequestToJson(
        _$_OtpVerifyRequest instance) =>
    <String, dynamic>{
      'tableNumber': instance.tableNumber,
      'franchiseCode': instance.franchiseCode,
      'password': instance.password,
    };
