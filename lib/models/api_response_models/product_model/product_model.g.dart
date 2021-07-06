// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$_$_ProductModelFromJson(Map<String, dynamic> json) {
  return _$_ProductModel(
    data: (json['data'] as List<dynamic>?)
            ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    total: json['total'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };
