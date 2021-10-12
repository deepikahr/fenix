// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateCart _$_$_UpdateCartFromJson(Map<String, dynamic> json) {
  return _$_UpdateCart(
    orderId: json['orderId'] as String?,
    products: (json['products'] as List<dynamic>?)
            ?.map((e) => UpdateProduct.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    localCart: json['localCart'] == null
        ? null
        : Cart.fromJson(json['localCart'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UpdateCartToJson(_$_UpdateCart instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'products': instance.products,
      'localCart': instance.localCart,
    };
