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
    franchiseName: json['franchiseName'] as String?,
    averageRating: json['averageRating'] as int? ?? 0,
    franchiseId: json['franchiseId'] as String?,
    categoryName: json['categoryName'] as String?,
    categoryId: json['categoryId'] as String?,
    vendorId: json['vendorId'] as String?,
    restaurantName: json['restaurantName'] as String?,
    originalPrice: json['originalPrice'] as int? ?? 0,
    sellingPrice: json['sellingPrice'] as int? ?? 0,
    discount: json['discount'] as int? ?? 0,
    sizeName: json['sizeName'] as String?,
    isVeg: json['isVeg'] as bool?,
    description: json['description'] as String?,
    addOnItems: (json['addOnItems'] as List<dynamic>?)
            ?.map((e) => AddOnItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    preparationTime: json['preparationTime'] as int? ?? 0,
    totalProductPrice: (json['totalProductPrice'] as num?)?.toDouble() ?? 0,
    quantity: json['quantity'] as int? ?? 1,
    productId: json['productId'] as String?,
    rate: (json['rate'] as num?)?.toDouble() ?? 0,
    rateDescription: json['rateDescription'] as String?,
    isLastVeriant: json['isLastVeriant'] as bool? ?? false,
    isCustomization: json['isCustomization'] as bool? ?? true,
    totalQuantity: json['totalQuantity'] as int? ?? 0,
    isSameProductMultipleTime:
        json['isSameProductMultipleTime'] as bool? ?? false,
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
      'franchiseName': instance.franchiseName,
      'averageRating': instance.averageRating,
      'franchiseId': instance.franchiseId,
      'categoryName': instance.categoryName,
      'categoryId': instance.categoryId,
      'vendorId': instance.vendorId,
      'restaurantName': instance.restaurantName,
      'originalPrice': instance.originalPrice,
      'sellingPrice': instance.sellingPrice,
      'discount': instance.discount,
      'sizeName': instance.sizeName,
      'isVeg': instance.isVeg,
      'description': instance.description,
      'addOnItems': instance.addOnItems,
      'preparationTime': instance.preparationTime,
      'totalProductPrice': instance.totalProductPrice,
      'quantity': instance.quantity,
      'productId': instance.productId,
      'rate': instance.rate,
      'rateDescription': instance.rateDescription,
      'isLastVeriant': instance.isLastVeriant,
      'isCustomization': instance.isCustomization,
      'totalQuantity': instance.totalQuantity,
      'isSameProductMultipleTime': instance.isSameProductMultipleTime,
      'variant': instance.variant,
    };
