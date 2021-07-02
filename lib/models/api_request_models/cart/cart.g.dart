// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$_$_CartFromJson(Map<String, dynamic> json) {
  return _$_Cart(
    vendorId: json['vendorId'] as String?,
    restaurantName: json['restaurantName'] as String?,
    franchiseName: json['franchiseName'] as String?,
    franchiseId: json['franchiseId'] as String?,
    preparationTime: json['preparationTime'] as int?,
    products: (json['cart'] as List<dynamic>)
        .map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    couponCode: json['couponCode'] as String?,
    couponAmount: (json['couponAmount'] as num?)?.toDouble() ?? 0,
    tipAmount: (json['tipAmount'] as num?)?.toDouble() ?? 0,
    subTotal: (json['subTotal'] as num?)?.toDouble() ?? 0,
    tax: (json['tax'] as num?)?.toDouble() ?? 0,
    deliveryCharges: (json['deliveryCharges'] as num?)?.toDouble() ?? 0,
    grandTotal: (json['grandTotal'] as num?)?.toDouble() ?? 0,
    orderFrom: json['orderFrom'] as String? ?? 'USER_APP',
    paymentType: json['paymentType'] as String? ?? 'COD',
    isWalletUsed: json['isWalletUsed'] as bool? ?? false,
    usedWalletAmount: (json['usedWalletAmount'] as num?)?.toDouble() ?? 0,
  );
}

Map<String, dynamic> _$_$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'vendorId': instance.vendorId,
      'restaurantName': instance.restaurantName,
      'franchiseName': instance.franchiseName,
      'franchiseId': instance.franchiseId,
      'preparationTime': instance.preparationTime,
      'cart': instance.products,
      'couponCode': instance.couponCode,
      'couponAmount': instance.couponAmount,
      'tipAmount': instance.tipAmount,
      'subTotal': instance.subTotal,
      'tax': instance.tax,
      'deliveryCharges': instance.deliveryCharges,
      'grandTotal': instance.grandTotal,
      'orderFrom': instance.orderFrom,
      'paymentType': instance.paymentType,
      'isWalletUsed': instance.isWalletUsed,
      'usedWalletAmount': instance.usedWalletAmount,
    };
