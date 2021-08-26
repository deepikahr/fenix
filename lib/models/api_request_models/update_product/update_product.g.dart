// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateProduct _$_$_UpdateProductFromJson(Map<String, dynamic> json) {
  return _$_UpdateProduct(
    productId: json['productId'] as String?,
    sizeName: json['sizeName'] as String?,
    quantity: json['quantity'] as int?,
    addOnItems: (json['addOnItems'] as List<dynamic>?)
            ?.map((e) => AddOnItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_UpdateProductToJson(_$_UpdateProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'sizeName': instance.sizeName,
      'quantity': instance.quantity,
      'addOnItems': instance.addOnItems,
    };
