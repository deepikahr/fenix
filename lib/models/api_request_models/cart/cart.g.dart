// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$_$_CartFromJson(Map<String, dynamic> json) {
  return _$_Cart(
    products: (json['cart'] as List<dynamic>)
        .map((e) => ProductDetailsResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    grandTotal: json['grandTotal'] ?? 0,
    subTotal: json['subTotal'] ?? 0,
    taxTotal: json['taxTotal'] ?? 0,
    deliveryType: json['deliveryType'] as String?,
    paymentType: json['paymentType'] as String?,
    restaurantName: json['restaurantName'] as String?,
    franchiseName: json['franchiseName'] as String?,
    franchiseId: json['franchiseId'] as String?,
    vendorId: json['vendorId'] as String?,
    userId: json['userId'] as String?,
    modifiedCart: json['modifiedCart'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'cart': instance.products,
      'grandTotal': instance.grandTotal,
      'subTotal': instance.subTotal,
      'taxTotal': instance.taxTotal,
      'deliveryType': instance.deliveryType,
      'paymentType': instance.paymentType,
      'restaurantName': instance.restaurantName,
      'franchiseName': instance.franchiseName,
      'franchiseId': instance.franchiseId,
      'vendorId': instance.vendorId,
      'userId': instance.userId,
      'modifiedCart': instance.modifiedCart,
    };
