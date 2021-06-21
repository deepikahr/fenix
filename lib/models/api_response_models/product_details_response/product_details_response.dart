import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:restaurant_saas/models/api_response_models/image/image_model.dart';
import 'package:restaurant_saas/models/api_response_models/ingredient/ingredient.dart';
import 'package:restaurant_saas/models/api_response_models/variant/variant.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'product_details_response.freezed.dart';
part 'product_details_response.g.dart';

@freezed
class ProductDetailsResponse
    with BaseModel<ProductDetailsResponse>, _$ProductDetailsResponse {
  const ProductDetailsResponse._();

  const factory ProductDetailsResponse({
    @JsonKey(name: '_id') String? id,
    String? productName,
    String? franchiseName,
    @Default(0) double averageRating,
    ImageModel? productImage,
    String? description,
    String? franchiseId,
    String? restaurantName,
    String? categoryName,
    String? categoryId,
    String? vendorId,
    @Default(0) int preparationTime,
    @Default(0) double originalPrice,
    @Default(0) double sellingPrice,
    @Default(0) double discount,
    String? sizeName,
    @Default(false) bool isVeg,
    @Default([]) List<Ingredient> ingrediants,
    @Default([]) List<Variant> variants,
    @JsonKey(name: 'addOnItems')
    @Default([])
        List<AddOnCategory> addOnCategories,
  }) = _ProductDetailsResponse;

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);

  @override
  ProductDetailsResponse fromMap(Map<String, dynamic> map) {
    return ProductDetailsResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
