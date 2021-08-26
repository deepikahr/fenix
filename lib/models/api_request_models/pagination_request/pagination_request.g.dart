// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginationRequest _$_$_PaginationRequestFromJson(Map<String, dynamic> json) {
  return _$_PaginationRequest(
    limit: json['limit'] as int? ?? 10,
    page: json['page'] as int?,
  );
}

Map<String, dynamic> _$_$_PaginationRequestToJson(
        _$_PaginationRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
    };
