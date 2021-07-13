import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/image_response/image_response.dart';
import 'package:fenix_user/models/api_response_models/ingredients_model/ingredients_model.dart';
import 'package:fenix_user/models/api_response_models/tag_response/tag_response.dart';
import 'package:fenix_user/models/api_response_models/tax_info_model/tax_info_model.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
class CartProduct with BaseModel<CartProduct>, _$CartProduct {
  const CartProduct._();

  const factory CartProduct({
    @JsonKey(name: '_id') String? id,
    String? productName,
    ImageResponse? productImage,
    String? categoryName,
    String? categoryId,
    @Default(0) int originalPrice,
    @Default(0) int sellingPrice,
    @Default(0) int tax,
    TaxInfoModel? taxInfo,
    @Default(1) quantity,
    @Default(0) double totalProductPrice,
    @Default([]) List<AddOnItem> addOnItems,
    VariantResponse? variants,
    @Default(false) bool isLastVariant,
    @Default(true) bool isCustomizable,
    @Default(0) int totalQuantity,
    @Default(false) bool isSameProductMultipleTime,
    String? restaurantName,
    String? franchiseName,
    String? franchiseId,
    String? vendorId,
    String? sizeName,


    List<IngredientsModel>? ingredients,
    List<String>? addOnCategories,
    bool? status,
    @Default(0) int averageRating,
    int? totalRating,
    int? noOfUsersRated,
    List<String>? allergens,
    List<String>? relatedProducts,
    List<TagResponse>? tags,
    bool? isCopy,
    String? category,
    String? productDescription,
    bool? isVeg,
    String? subCategory,
    int? ranking,
    String? menuId,
    String? createdAt,
    String? updatedAt,
    @Default(0) int discount,
    String? description,
    @Default([]) List<AddOnItem> selectedAddOnItems,
    @Default(0) int preparationTime,
    String? productId,
    @Default(0) double rate,
    String? rateDescription,
    VariantResponse? variant
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  @override
  CartProduct fromMap(Map<String, dynamic> map) {
    return CartProduct.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
