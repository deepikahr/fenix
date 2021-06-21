import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:restaurant_saas/models/api_response_models/image/image_model.dart';

import 'package:restaurant_saas/models/base_model.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with BaseModel<Product>, _$Product {
  const Product._();

  const factory Product({
    @JsonKey(name: '_id') String? id,
    String? productName,
    String? franchiseName,
    @Default(0) double averageRating,
    ImageModel? productImage,
    String? franchiseId,
    String? categoryName,
    String? categoryId,
    String? vendorId,
    String? restaurantName,
    @Default(0) double originalPrice,
    @Default(0) double sellingPrice,
    @Default(0) double discount,
    String? sizeName,
    bool? isVeg,
    String? description,
    @Default([]) List<AddOnItem> addOnItems,
    @Default(0) int preparationTime,
    @Default(0) double totalProductPrice,
    @Default(1) int quantity,
    String? productId,
    @Default(0) double rate,
    String? rateDescription,
    @Default(false) bool isLastVeriant,
    @Default(true) bool isCustomization,
    @Default(0) int totalQuantity,
    @Default(false) bool isSameProductMultipleTime,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  Product fromMap(Map<String, dynamic> map) {
    return Product.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
