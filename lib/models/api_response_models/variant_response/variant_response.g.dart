// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VariantResponse _$_$_VariantResponseFromJson(Map<String, dynamic> json) {
  return _$_VariantResponse(
    id: json['_id'] as String?,
    size: json['size'] as String?,
    price: json['price'] as int?,
    sizeName: json['sizeName'] as String?,
    isDefaultVariant: json['isDefaultVariant'] as bool?,
    outOfStock: json['outOfStock'] as bool?,
  );
}

Map<String, dynamic> _$_$_VariantResponseToJson(_$_VariantResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'size': instance.size,
      'price': instance.price,
      'sizeName': instance.sizeName,
      'isDefaultVariant': instance.isDefaultVariant,
      'outOfStock': instance.outOfStock,
    };
