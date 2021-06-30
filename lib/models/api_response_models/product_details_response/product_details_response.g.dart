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
    averageRating: json['averageRating'] as int?,
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
    id: json['_id'] as String?,
    offerPercentage: json['offerPercentage'] as int?,
    franchiseId: json['franchiseId'] as String?,
    category: json['category'] as String?,
    productName: json['productName'] as String?,
    productDescription: json['productDescription'] as String?,
    isVeg: json['isVeg'] as bool?,
    variants: (json['variants'] as List<dynamic>?)
        ?.map((e) => VariantResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
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
  );
}

Map<String, dynamic> _$_$_ProductDetailsResponseToJson(
        _$_ProductDetailsResponse instance) =>
    <String, dynamic>{
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
    };
