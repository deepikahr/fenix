// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorResponse _$_$_ErrorResponseFromJson(Map<String, dynamic> json) {
  return _$_ErrorResponse(
    status: json['status'] as int?,
    success: json['success'] as bool?,
    errors:
        (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$_$_ErrorResponseToJson(_$_ErrorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'errors': instance.errors,
      'message': instance.message,
    };
