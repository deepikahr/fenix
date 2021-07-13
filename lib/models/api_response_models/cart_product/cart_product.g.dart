// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartProduct _$_$_CartProductFromJson(Map<String, dynamic> json) {
  return _$_CartProduct(
    id: json['_id'] as String?,
    productName: json['productName'] as String?,
    productImage: json['productImage'] == null
        ? null
        : ImageResponse.fromJson(json['productImage'] as Map<String, dynamic>),
    categoryName: json['categoryName'] as String?,
    categoryId: json['categoryId'] as String?,
    originalPrice: json['originalPrice'] as int? ?? 0,
    sellingPrice: json['sellingPrice'] as int? ?? 0,
    tax: json['tax'] as int? ?? 0,
    taxInfo: json['taxInfo'] == null
        ? null
        : TaxInfoModel.fromJson(json['taxInfo'] as Map<String, dynamic>),
    quantity: json['quantity'] ?? 1,
    totalProductPrice: (json['totalProductPrice'] as num?)?.toDouble() ?? 0,
    addOnItems: (json['addOnItems'] as List<dynamic>?)
            ?.map((e) => AddOnItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    variants: json['variants'] == null
        ? null
        : VariantResponse.fromJson(json['variants'] as Map<String, dynamic>),
    isLastVariant: json['isLastVariant'] as bool? ?? false,
    isCustomizable: json['isCustomizable'] as bool? ?? true,
    totalQuantity: json['totalQuantity'] as int? ?? 0,
    isSameProductMultipleTime:
        json['isSameProductMultipleTime'] as bool? ?? false,
    restaurantName: json['restaurantName'] as String?,
    franchiseName: json['franchiseName'] as String?,
    franchiseId: json['franchiseId'] as String?,
    vendorId: json['vendorId'] as String?,
    sizeName: json['sizeName'] as String?,
    ingredients: (json['ingredients'] as List<dynamic>?)
        ?.map((e) => IngredientsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    addOnCategories: (json['addOnCategories'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    status: json['status'] as bool?,
    averageRating: json['averageRating'] as int? ?? 0,
    totalRating: json['totalRating'] as int?,
    noOfUsersRated: json['noOfUsersRated'] as int?,
    allergens:
        (json['allergens'] as List<dynamic>?)?.map((e) => e as String).toList(),
    relatedProducts: (json['relatedProducts'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => TagResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    isCopy: json['isCopy'] as bool?,
    category: json['category'] as String?,
    productDescription: json['productDescription'] as String?,
    isVeg: json['isVeg'] as bool?,
    subCategory: json['subCategory'] as String?,
    ranking: json['ranking'] as int?,
    menuId: json['menuId'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    discount: json['discount'] as int? ?? 0,
    description: json['description'] as String?,
    selectedAddOnItems: (json['selectedAddOnItems'] as List<dynamic>?)
            ?.map((e) => AddOnItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    preparationTime: json['preparationTime'] as int? ?? 0,
    productId: json['productId'] as String?,
    rate: (json['rate'] as num?)?.toDouble() ?? 0,
    rateDescription: json['rateDescription'] as String?,
    variant: json['variant'] == null
        ? null
        : VariantResponse.fromJson(json['variant'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_CartProductToJson(_$_CartProduct instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'categoryName': instance.categoryName,
      'categoryId': instance.categoryId,
      'originalPrice': instance.originalPrice,
      'sellingPrice': instance.sellingPrice,
      'tax': instance.tax,
      'taxInfo': instance.taxInfo,
      'quantity': instance.quantity,
      'totalProductPrice': instance.totalProductPrice,
      'addOnItems': instance.addOnItems,
      'variants': instance.variants,
      'isLastVariant': instance.isLastVariant,
      'isCustomizable': instance.isCustomizable,
      'totalQuantity': instance.totalQuantity,
      'isSameProductMultipleTime': instance.isSameProductMultipleTime,
      'restaurantName': instance.restaurantName,
      'franchiseName': instance.franchiseName,
      'franchiseId': instance.franchiseId,
      'vendorId': instance.vendorId,
      'sizeName': instance.sizeName,
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
      'category': instance.category,
      'productDescription': instance.productDescription,
      'isVeg': instance.isVeg,
      'subCategory': instance.subCategory,
      'ranking': instance.ranking,
      'menuId': instance.menuId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'discount': instance.discount,
      'description': instance.description,
      'selectedAddOnItems': instance.selectedAddOnItems,
      'preparationTime': instance.preparationTime,
      'productId': instance.productId,
      'rate': instance.rate,
      'rateDescription': instance.rateDescription,
      'variant': instance.variant,
    };
