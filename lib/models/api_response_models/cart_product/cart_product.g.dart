// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartProduct _$_$_CartProductFromJson(Map<String, dynamic> json) {
  return _$_CartProduct(
    id: json['_id'] as String?,
    productImage: json['productImage'] == null
        ? null
        : ImageResponse.fromJson(json['productImage'] as Map<String, dynamic>),
    taxInfo: json['taxInfo'] == null
        ? null
        : TaxInfoModel.fromJson(json['taxInfo'] as Map<String, dynamic>),
    addOnItems: (json['addOnItems'] as List<dynamic>?)
            ?.map((e) => AddOnItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    orderStatusHistory: (json['orderStatusHistory'] as List<dynamic>?)
            ?.map((e) => OrderStatusHistory.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    productName: json['productName'] as String?,
    categoryName: json['categoryName'] as String?,
    categoryId: json['categoryId'] as String?,
    originalPrice: json['originalPrice'] as int? ?? 0,
    sellingPrice: json['sellingPrice'] as int? ?? 0,
    description: json['description'] as String?,
    totalProductPrice: (json['totalProductPrice'] as num?)?.toDouble() ?? 0,
    quantity: json['quantity'] ?? 1,
    productId: json['productId'] as String?,
    paymentStatus: json['paymentStatus'] as String?,
    orderStatus: json['orderStatus'] as String?,
  );
}

Map<String, dynamic> _$_$_CartProductToJson(_$_CartProduct instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'productImage': instance.productImage,
      'taxInfo': instance.taxInfo,
      'addOnItems': instance.addOnItems,
      'orderStatusHistory': instance.orderStatusHistory,
      'productName': instance.productName,
      'categoryName': instance.categoryName,
      'categoryId': instance.categoryId,
      'originalPrice': instance.originalPrice,
      'sellingPrice': instance.sellingPrice,
      'description': instance.description,
      'totalProductPrice': instance.totalProductPrice,
      'quantity': instance.quantity,
      'productId': instance.productId,
      'paymentStatus': instance.paymentStatus,
      'orderStatus': instance.orderStatus,
    };
