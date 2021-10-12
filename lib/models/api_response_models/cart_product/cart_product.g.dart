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
    variant: json['variant'] == null
        ? null
        : VariantResponse.fromJson(json['variant'] as Map<String, dynamic>),
    taxInfo: json['taxInfo'] == null
        ? null
        : TaxInfoModel.fromJson(json['taxInfo'] as Map<String, dynamic>),
    isPaid: json['isPaid'] as bool?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => TagResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    selectedAddOnItems: (json['selectedAddOnItems'] as List<dynamic>?)
            ?.map((e) => AddOnItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    category: json['category'] as String?,
    productName: json['productName'] as String?,
    isVeg: json['isVeg'] as bool?,
    subCategory: json['subCategory'] as String?,
    menuId: json['menuId'] as String?,
    categoryName: json['categoryName'] as String?,
    productDescription: json['productDescription'] as String?,
    totalProductPrice: (json['totalProductPrice'] as num?)?.toDouble() ?? 0,
    variantQuantity: json['variantQuantity'] ?? 1,
    tax: (json['tax'] as num?)?.toDouble() ?? 0,
    productId: json['productId'] as String?,
    productInstructions: json['productInstructions'] as String?,
    modified: json['modified'] as bool? ?? false,
    modifiedQuantity: json['modifiedQuantity'] as int?,
  );
}

Map<String, dynamic> _$_$_CartProductToJson(_$_CartProduct instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'productImage': instance.productImage,
    'variant': instance.variant,
    'taxInfo': instance.taxInfo,
    'isPaid': instance.isPaid,
    'tags': instance.tags,
    'selectedAddOnItems': instance.selectedAddOnItems,
    'category': instance.category,
    'productName': instance.productName,
    'isVeg': instance.isVeg,
    'subCategory': instance.subCategory,
    'menuId': instance.menuId,
    'categoryName': instance.categoryName,
    'productDescription': instance.productDescription,
    'totalProductPrice': instance.totalProductPrice,
    'variantQuantity': instance.variantQuantity,
    'tax': instance.tax,
    'productId': instance.productId,
    'productInstructions': instance.productInstructions,
    'modified': instance.modified,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modifiedQuantity', instance.modifiedQuantity);
  return val;
}
