import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
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
class ProductDetailsResponse with BaseModel<ProductDetailsResponse>, _$ProductDetailsResponse {
  const ProductDetailsResponse._();

  const factory ProductDetailsResponse({
    ImageResponse? productImage,
    TaxInfoModel? taxInfo,
    List<IngredientsModel>? ingredients,
    List<String>? addOnCategories,
    bool? status,
    int? averageRating,
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
    List<VariantResponse>? variants,
    @JsonKey(name: 'addOnItems')
    @Default([]) List<AddOnCategory>? addOnItems,
    String? subCategory,
    int? ranking,
    String? menuId,
    String? vendorId,
    String? categoryName,
    String? franchiseName,
    String? createdAt,
    String? updatedAt,

  }) =
  _ProductDetailsResponse;

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
