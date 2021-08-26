// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDetailsResponse _$_$_OrderDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _$_OrderDetailsResponse(
    id: json['_id'] as String?,
    isAcceptedByDeliveryBoy: json['isAcceptedByDeliveryBoy'] as bool?,
    cart: (json['cart'] as List<dynamic>?)
            ?.map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    grandTotal: (json['grandTotal'] as num?)?.toDouble(),
    subTotal: (json['subTotal'] as num?)?.toDouble(),
    paymentType: json['paymentType'] as String?,
    restaurantName: json['restaurantName'] as String?,
    franchiseName: json['franchiseName'] as String?,
    franchiseId: json['franchiseId'] as String?,
    vendorId: json['vendorId'] as String?,
    userId: json['userId'] as String?,
    currencyCode: json['currencyCode'] as String?,
    currencySymbol: json['currencySymbol'] as String?,
    orderStatus: json['orderStatus'] as String?,
    orderID: json['orderID'] as int?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$_$_OrderDetailsResponseToJson(
        _$_OrderDetailsResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'isAcceptedByDeliveryBoy': instance.isAcceptedByDeliveryBoy,
      'cart': instance.cart,
      'grandTotal': instance.grandTotal,
      'subTotal': instance.subTotal,
      'paymentType': instance.paymentType,
      'restaurantName': instance.restaurantName,
      'franchiseName': instance.franchiseName,
      'franchiseId': instance.franchiseId,
      'vendorId': instance.vendorId,
      'userId': instance.userId,
      'currencyCode': instance.currencyCode,
      'currencySymbol': instance.currencySymbol,
      'orderStatus': instance.orderStatus,
      'orderID': instance.orderID,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
