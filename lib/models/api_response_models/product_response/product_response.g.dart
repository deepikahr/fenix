// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductResponse _$_$_ProductResponseFromJson(Map<String, dynamic> json) {
  return _$_ProductResponse(
    id: json['_id'] as String?,
    productImage: json['productImage'] == null
        ? null
        : ImageResponse.fromJson(json['productImage'] as Map<String, dynamic>),
    allergens:
        (json['allergens'] as List<dynamic>?)?.map((e) => e as String).toList(),
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => TagResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    productName: json['productName'] as String?,
    productDescription: json['productDescription'] as String?,
    variant: json['variant'] == null
        ? null
        : VariantResponse.fromJson(json['variant'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ProductResponseToJson(_$_ProductResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'productImage': instance.productImage,
      'allergens': instance.allergens,
      'tags': instance.tags,
      'productName': instance.productName,
      'productDescription': instance.productDescription,
      'variant': instance.variant,
    };
