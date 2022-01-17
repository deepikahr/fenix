// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginVerifyRequest _$_$_LoginVerifyRequestFromJson(
    Map<String, dynamic> json) {
  return _$_LoginVerifyRequest(
    tableNumber: json['tableNumber'] as int?,
    franchiseCode: json['franchiseCode'] as int?,
    password: json['password'] as int?,
  );
}

Map<String, dynamic> _$_$_LoginVerifyRequestToJson(
        _$_LoginVerifyRequest instance) =>
    <String, dynamic>{
      'tableNumber': instance.tableNumber,
      'franchiseCode': instance.franchiseCode,
      'password': instance.password,
    };
