import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/image_response/image_response.dart';
import 'package:fenix_user/models/api_response_models/ingredients_model/ingredients_model.dart';
import 'package:fenix_user/models/api_response_models/tag_response/tag_response.dart';
import 'package:fenix_user/models/api_response_models/tax_info_model/tax_info_model.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'product_details_response.freezed.dart';
part 'product_details_response.g.dart';

@freezed
class ProductDetailsResponse
    with BaseModel<ProductDetailsResponse>, _$ProductDetailsResponse {
  const ProductDetailsResponse._();

  const factory ProductDetailsResponse({
    ImageResponse? productImage,
    TaxInfoModel? taxInfo,
    List<IngredientsModel>? ingredients,
    List<String>? addOnCategories,
    bool? status,
    @Default(0) double averageRating,
    int? totalRating,
    int? noOfUsersRated,
    List<String>? allergens,
    List<String>? relatedProducts,
    List<TagResponse>? tags,
    bool? isCopy,
    @JsonKey(name: '_id') String? id,
    int? offerPercentage,
    String? franchiseId,
    String? category,
    String? productName,
    String? productDescription,
    bool? isVeg,
    @Default([]) List<VariantResponse> variants,
    @JsonKey(name: 'addOnItems') @Default([]) List<AddOnCategory>? addOnItems,
    String? subCategory,
    int? ranking,
    String? menuId,
    String? vendorId,
    String? categoryName,
    String? franchiseName,
    String? createdAt,
    String? updatedAt,
    String? categoryId,
    String? restaurantName,
    @Default(0) double originalPrice,
    @Default(0) double sellingPrice,
    @Default(0) double discount,
    @Default([]) List<AddOnItem> selectedAddOnItems,
    @Default(0) int preparationTime,
    @Default(0) double totalProductPrice,
    @Default(0) double tax,
    String? productId,
    @Default(0) double rate,
    String? rateDescription,
    @Default(false) bool isLastUsedVariant,
    @Default(false) bool isCustomizable,
    @Default(0) int totalQuantity,
    @Default(0) int variantQuantity,
    @Default(false) bool isSameProductMultipleTime,
    VariantResponse? variant,
    String? productInstructions,
    @JsonKey(ignore: true) @Default(false) bool modified,
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
