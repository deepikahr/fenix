// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDetailsResponse _$_$_ProductDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _$_ProductDetailsResponse(
    productImage: json['productImage'] == null
        ? null
        : ImageResponse.fromJson(json['productImage'] as Map<String, dynamic>),
    taxInfo: json['taxInfo'] == null
        ? null
        : TaxInfoModel.fromJson(json['taxInfo'] as Map<String, dynamic>),
    ingredients: (json['ingredients'] as List<dynamic>?)
        ?.map((e) => IngredientsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    addOnCategories: (json['addOnCategories'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    status: json['status'] as bool?,
    averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
    totalRating: json['totalRating'] as int?,
    noOfUsersRated: json['noOfUsersRated'] as int?,
    allergens: (json['allergens'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    relatedProducts: (json['relatedProducts'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => TagResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    isCopy: json['isCopy'] as bool?,
    id: json['_id'] as String?,
    offerPercentage: json['offerPercentage'] as int?,
    franchiseId: json['franchiseId'] as String?,
    category: json['category'] as String?,
    productName: json['productName'] as String?,
    productDescription: json['productDescription'] as String?,
    isVeg: json['isVeg'] as bool?,
    variants: (json['variants'] as List<dynamic>?)
            ?.map((e) => VariantResponse.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    addOnItems: (json['addOnItems'] as List<dynamic>?)
        ?.map((e) => AddOnCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    subCategory: json['subCategory'] as String?,
    ranking: json['ranking'] as int?,
    menuId: json['menuId'] as String?,
    vendorId: json['vendorId'] as String?,
    categoryName: json['categoryName'] as String?,
    franchiseName: json['franchiseName'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    categoryId: json['categoryId'] as String?,
    restaurantName: json['restaurantName'] as String?,
    originalPrice: (json['originalPrice'] as num?)?.toDouble() ?? 0,
    sellingPrice: (json['sellingPrice'] as num?)?.toDouble() ?? 0,
    discount: (json['discount'] as num?)?.toDouble() ?? 0,
    selectedAddOnItems: (json['selectedAddOnItems'] as List<dynamic>?)
            ?.map((e) => AddOnItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    preparationTime: json['preparationTime'] as int? ?? 0,
    totalProductPrice: (json['totalProductPrice'] as num?)?.toDouble() ?? 0,
    tax: (json['tax'] as num?)?.toDouble() ?? 0,
    productId: json['productId'] as String?,
    rate: (json['rate'] as num?)?.toDouble() ?? 0,
    rateDescription: json['rateDescription'] as String?,
    isLastUsedVariant: json['isLastUsedVariant'] as bool? ?? false,
    isCustomizable: json['isCustomizable'] as bool? ?? false,
    totalQuantity: json['totalQuantity'] as int? ?? 0,
    variantQuantity: json['variantQuantity'] as int? ?? 0,
    isSameProductMultipleTime:
        json['isSameProductMultipleTime'] as bool? ?? false,
    variant: json['variant'] == null
        ? null
        : VariantResponse.fromJson(json['variant'] as Map<String, dynamic>),
    productInstructions: json['productInstructions'] as String?,
    modified: json['modified'] as bool? ?? false,
    modifiedQuantity: json['modifiedQuantity'] as int?,
    totalPreviousQuantity: json['totalPreviousQuantity'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_ProductDetailsResponseToJson(
    _$_ProductDetailsResponse instance) {
  final val = <String, dynamic>{
    'productImage': instance.productImage,
    'taxInfo': instance.taxInfo,
    'ingredients': instance.ingredients,
    'addOnCategories': instance.addOnCategories,
    'status': instance.status,
    'averageRating': instance.averageRating,
    'totalRating': instance.totalRating,
    'noOfUsersRated': instance.noOfUsersRated,
    'allergens': instance.allergens,
    'relatedProducts': instance.relatedProducts,
    'tags': instance.tags,
    'isCopy': instance.isCopy,
    '_id': instance.id,
    'offerPercentage': instance.offerPercentage,
    'franchiseId': instance.franchiseId,
    'category': instance.category,
    'productName': instance.productName,
    'productDescription': instance.productDescription,
    'isVeg': instance.isVeg,
    'variants': instance.variants,
    'addOnItems': instance.addOnItems,
    'subCategory': instance.subCategory,
    'ranking': instance.ranking,
    'menuId': instance.menuId,
    'vendorId': instance.vendorId,
    'categoryName': instance.categoryName,
    'franchiseName': instance.franchiseName,
    'createdAt': instance.createdAt,
    'updatedAt': instance.updatedAt,
    'categoryId': instance.categoryId,
    'restaurantName': instance.restaurantName,
    'originalPrice': instance.originalPrice,
    'sellingPrice': instance.sellingPrice,
    'discount': instance.discount,
    'selectedAddOnItems': instance.selectedAddOnItems,
    'preparationTime': instance.preparationTime,
    'totalProductPrice': instance.totalProductPrice,
    'tax': instance.tax,
    'productId': instance.productId,
    'rate': instance.rate,
    'rateDescription': instance.rateDescription,
    'isLastUsedVariant': instance.isLastUsedVariant,
    'isCustomizable': instance.isCustomizable,
    'totalQuantity': instance.totalQuantity,
    'variantQuantity': instance.variantQuantity,
    'isSameProductMultipleTime': instance.isSameProductMultipleTime,
    'variant': instance.variant,
    'productInstructions': instance.productInstructions,
    'modified': instance.modified,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modifiedQuantity', instance.modifiedQuantity);
  val['totalPreviousQuantity'] = instance.totalPreviousQuantity;
  return val;
}
