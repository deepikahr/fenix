// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductDetailsResponse _$ProductDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductDetailsResponse.fromJson(json);
}

/// @nodoc
class _$ProductDetailsResponseTearOff {
  const _$ProductDetailsResponseTearOff();

  _ProductDetailsResponse call(
      {ImageResponse? productImage,
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
      @JsonKey(name: 'addOnItems') List<AddOnCategory>? addOnItems = const [],
      String? subCategory,
      int? ranking,
      String? menuId,
      String? vendorId,
      String? categoryName,
      String? franchiseName,
      String? createdAt,
      String? updatedAt}) {
    return _ProductDetailsResponse(
      productImage: productImage,
      taxInfo: taxInfo,
      ingredients: ingredients,
      addOnCategories: addOnCategories,
      status: status,
      averageRating: averageRating,
      totalRating: totalRating,
      noOfUsersRated: noOfUsersRated,
      allergens: allergens,
      relatedProducts: relatedProducts,
      tags: tags,
      isCopy: isCopy,
      id: id,
      offerPercentage: offerPercentage,
      franchiseId: franchiseId,
      category: category,
      productName: productName,
      productDescription: productDescription,
      isVeg: isVeg,
      variants: variants,
      addOnItems: addOnItems,
      subCategory: subCategory,
      ranking: ranking,
      menuId: menuId,
      vendorId: vendorId,
      categoryName: categoryName,
      franchiseName: franchiseName,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  ProductDetailsResponse fromJson(Map<String, Object> json) {
    return ProductDetailsResponse.fromJson(json);
  }
}

/// @nodoc
const $ProductDetailsResponse = _$ProductDetailsResponseTearOff();

/// @nodoc
mixin _$ProductDetailsResponse {
  ImageResponse? get productImage => throw _privateConstructorUsedError;
  TaxInfoModel? get taxInfo => throw _privateConstructorUsedError;
  List<IngredientsModel>? get ingredients => throw _privateConstructorUsedError;
  List<String>? get addOnCategories => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;
  int? get averageRating => throw _privateConstructorUsedError;
  int? get totalRating => throw _privateConstructorUsedError;
  int? get noOfUsersRated => throw _privateConstructorUsedError;
  List<String>? get allergens => throw _privateConstructorUsedError;
  List<String>? get relatedProducts => throw _privateConstructorUsedError;
  List<TagResponse>? get tags => throw _privateConstructorUsedError;
  bool? get isCopy => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  int? get offerPercentage => throw _privateConstructorUsedError;
  String? get franchiseId => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get productDescription => throw _privateConstructorUsedError;
  bool? get isVeg => throw _privateConstructorUsedError;
  List<VariantResponse>? get variants => throw _privateConstructorUsedError;
  @JsonKey(name: 'addOnItems')
  List<AddOnCategory>? get addOnItems => throw _privateConstructorUsedError;
  String? get subCategory => throw _privateConstructorUsedError;
  int? get ranking => throw _privateConstructorUsedError;
  String? get menuId => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get franchiseName => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDetailsResponseCopyWith<ProductDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsResponseCopyWith<$Res> {
  factory $ProductDetailsResponseCopyWith(ProductDetailsResponse value,
          $Res Function(ProductDetailsResponse) then) =
      _$ProductDetailsResponseCopyWithImpl<$Res>;
  $Res call(
      {ImageResponse? productImage,
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
      @JsonKey(name: 'addOnItems') List<AddOnCategory>? addOnItems,
      String? subCategory,
      int? ranking,
      String? menuId,
      String? vendorId,
      String? categoryName,
      String? franchiseName,
      String? createdAt,
      String? updatedAt});

  $ImageResponseCopyWith<$Res>? get productImage;
  $TaxInfoModelCopyWith<$Res>? get taxInfo;
}

/// @nodoc
class _$ProductDetailsResponseCopyWithImpl<$Res>
    implements $ProductDetailsResponseCopyWith<$Res> {
  _$ProductDetailsResponseCopyWithImpl(this._value, this._then);

  final ProductDetailsResponse _value;
  // ignore: unused_field
  final $Res Function(ProductDetailsResponse) _then;

  @override
  $Res call({
    Object? productImage = freezed,
    Object? taxInfo = freezed,
    Object? ingredients = freezed,
    Object? addOnCategories = freezed,
    Object? status = freezed,
    Object? averageRating = freezed,
    Object? totalRating = freezed,
    Object? noOfUsersRated = freezed,
    Object? allergens = freezed,
    Object? relatedProducts = freezed,
    Object? tags = freezed,
    Object? isCopy = freezed,
    Object? id = freezed,
    Object? offerPercentage = freezed,
    Object? franchiseId = freezed,
    Object? category = freezed,
    Object? productName = freezed,
    Object? productDescription = freezed,
    Object? isVeg = freezed,
    Object? variants = freezed,
    Object? addOnItems = freezed,
    Object? subCategory = freezed,
    Object? ranking = freezed,
    Object? menuId = freezed,
    Object? vendorId = freezed,
    Object? categoryName = freezed,
    Object? franchiseName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      productImage: productImage == freezed
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as ImageResponse?,
      taxInfo: taxInfo == freezed
          ? _value.taxInfo
          : taxInfo // ignore: cast_nullable_to_non_nullable
              as TaxInfoModel?,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientsModel>?,
      addOnCategories: addOnCategories == freezed
          ? _value.addOnCategories
          : addOnCategories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      averageRating: averageRating == freezed
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRating: totalRating == freezed
          ? _value.totalRating
          : totalRating // ignore: cast_nullable_to_non_nullable
              as int?,
      noOfUsersRated: noOfUsersRated == freezed
          ? _value.noOfUsersRated
          : noOfUsersRated // ignore: cast_nullable_to_non_nullable
              as int?,
      allergens: allergens == freezed
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      relatedProducts: relatedProducts == freezed
          ? _value.relatedProducts
          : relatedProducts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>?,
      isCopy: isCopy == freezed
          ? _value.isCopy
          : isCopy // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      offerPercentage: offerPercentage == freezed
          ? _value.offerPercentage
          : offerPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescription: productDescription == freezed
          ? _value.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      isVeg: isVeg == freezed
          ? _value.isVeg
          : isVeg // ignore: cast_nullable_to_non_nullable
              as bool?,
      variants: variants == freezed
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<VariantResponse>?,
      addOnItems: addOnItems == freezed
          ? _value.addOnItems
          : addOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnCategory>?,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      ranking: ranking == freezed
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ImageResponseCopyWith<$Res>? get productImage {
    if (_value.productImage == null) {
      return null;
    }

    return $ImageResponseCopyWith<$Res>(_value.productImage!, (value) {
      return _then(_value.copyWith(productImage: value));
    });
  }

  @override
  $TaxInfoModelCopyWith<$Res>? get taxInfo {
    if (_value.taxInfo == null) {
      return null;
    }

    return $TaxInfoModelCopyWith<$Res>(_value.taxInfo!, (value) {
      return _then(_value.copyWith(taxInfo: value));
    });
  }
}

/// @nodoc
abstract class _$ProductDetailsResponseCopyWith<$Res>
    implements $ProductDetailsResponseCopyWith<$Res> {
  factory _$ProductDetailsResponseCopyWith(_ProductDetailsResponse value,
          $Res Function(_ProductDetailsResponse) then) =
      __$ProductDetailsResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {ImageResponse? productImage,
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
      @JsonKey(name: 'addOnItems') List<AddOnCategory>? addOnItems,
      String? subCategory,
      int? ranking,
      String? menuId,
      String? vendorId,
      String? categoryName,
      String? franchiseName,
      String? createdAt,
      String? updatedAt});

  @override
  $ImageResponseCopyWith<$Res>? get productImage;
  @override
  $TaxInfoModelCopyWith<$Res>? get taxInfo;
}

/// @nodoc
class __$ProductDetailsResponseCopyWithImpl<$Res>
    extends _$ProductDetailsResponseCopyWithImpl<$Res>
    implements _$ProductDetailsResponseCopyWith<$Res> {
  __$ProductDetailsResponseCopyWithImpl(_ProductDetailsResponse _value,
      $Res Function(_ProductDetailsResponse) _then)
      : super(_value, (v) => _then(v as _ProductDetailsResponse));

  @override
  _ProductDetailsResponse get _value => super._value as _ProductDetailsResponse;

  @override
  $Res call({
    Object? productImage = freezed,
    Object? taxInfo = freezed,
    Object? ingredients = freezed,
    Object? addOnCategories = freezed,
    Object? status = freezed,
    Object? averageRating = freezed,
    Object? totalRating = freezed,
    Object? noOfUsersRated = freezed,
    Object? allergens = freezed,
    Object? relatedProducts = freezed,
    Object? tags = freezed,
    Object? isCopy = freezed,
    Object? id = freezed,
    Object? offerPercentage = freezed,
    Object? franchiseId = freezed,
    Object? category = freezed,
    Object? productName = freezed,
    Object? productDescription = freezed,
    Object? isVeg = freezed,
    Object? variants = freezed,
    Object? addOnItems = freezed,
    Object? subCategory = freezed,
    Object? ranking = freezed,
    Object? menuId = freezed,
    Object? vendorId = freezed,
    Object? categoryName = freezed,
    Object? franchiseName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_ProductDetailsResponse(
      productImage: productImage == freezed
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as ImageResponse?,
      taxInfo: taxInfo == freezed
          ? _value.taxInfo
          : taxInfo // ignore: cast_nullable_to_non_nullable
              as TaxInfoModel?,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientsModel>?,
      addOnCategories: addOnCategories == freezed
          ? _value.addOnCategories
          : addOnCategories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      averageRating: averageRating == freezed
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRating: totalRating == freezed
          ? _value.totalRating
          : totalRating // ignore: cast_nullable_to_non_nullable
              as int?,
      noOfUsersRated: noOfUsersRated == freezed
          ? _value.noOfUsersRated
          : noOfUsersRated // ignore: cast_nullable_to_non_nullable
              as int?,
      allergens: allergens == freezed
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      relatedProducts: relatedProducts == freezed
          ? _value.relatedProducts
          : relatedProducts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>?,
      isCopy: isCopy == freezed
          ? _value.isCopy
          : isCopy // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      offerPercentage: offerPercentage == freezed
          ? _value.offerPercentage
          : offerPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescription: productDescription == freezed
          ? _value.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      isVeg: isVeg == freezed
          ? _value.isVeg
          : isVeg // ignore: cast_nullable_to_non_nullable
              as bool?,
      variants: variants == freezed
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<VariantResponse>?,
      addOnItems: addOnItems == freezed
          ? _value.addOnItems
          : addOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnCategory>?,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      ranking: ranking == freezed
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductDetailsResponse extends _ProductDetailsResponse {
  const _$_ProductDetailsResponse(
      {this.productImage,
      this.taxInfo,
      this.ingredients,
      this.addOnCategories,
      this.status,
      this.averageRating,
      this.totalRating,
      this.noOfUsersRated,
      this.allergens,
      this.relatedProducts,
      this.tags,
      this.isCopy,
      @JsonKey(name: '_id') this.id,
      this.offerPercentage,
      this.franchiseId,
      this.category,
      this.productName,
      this.productDescription,
      this.isVeg,
      this.variants,
      @JsonKey(name: 'addOnItems') this.addOnItems = const [],
      this.subCategory,
      this.ranking,
      this.menuId,
      this.vendorId,
      this.categoryName,
      this.franchiseName,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$_ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductDetailsResponseFromJson(json);

  @override
  final ImageResponse? productImage;
  @override
  final TaxInfoModel? taxInfo;
  @override
  final List<IngredientsModel>? ingredients;
  @override
  final List<String>? addOnCategories;
  @override
  final bool? status;
  @override
  final int? averageRating;
  @override
  final int? totalRating;
  @override
  final int? noOfUsersRated;
  @override
  final List<String>? allergens;
  @override
  final List<String>? relatedProducts;
  @override
  final List<TagResponse>? tags;
  @override
  final bool? isCopy;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final int? offerPercentage;
  @override
  final String? franchiseId;
  @override
  final String? category;
  @override
  final String? productName;
  @override
  final String? productDescription;
  @override
  final bool? isVeg;
  @override
  final List<VariantResponse>? variants;
  @override
  @JsonKey(name: 'addOnItems')
  final List<AddOnCategory>? addOnItems;
  @override
  final String? subCategory;
  @override
  final int? ranking;
  @override
  final String? menuId;
  @override
  final String? vendorId;
  @override
  final String? categoryName;
  @override
  final String? franchiseName;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'ProductDetailsResponse(productImage: $productImage, taxInfo: $taxInfo, ingredients: $ingredients, addOnCategories: $addOnCategories, status: $status, averageRating: $averageRating, totalRating: $totalRating, noOfUsersRated: $noOfUsersRated, allergens: $allergens, relatedProducts: $relatedProducts, tags: $tags, isCopy: $isCopy, id: $id, offerPercentage: $offerPercentage, franchiseId: $franchiseId, category: $category, productName: $productName, productDescription: $productDescription, isVeg: $isVeg, variants: $variants, addOnItems: $addOnItems, subCategory: $subCategory, ranking: $ranking, menuId: $menuId, vendorId: $vendorId, categoryName: $categoryName, franchiseName: $franchiseName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductDetailsResponse &&
            (identical(other.productImage, productImage) ||
                const DeepCollectionEquality()
                    .equals(other.productImage, productImage)) &&
            (identical(other.taxInfo, taxInfo) ||
                const DeepCollectionEquality()
                    .equals(other.taxInfo, taxInfo)) &&
            (identical(other.ingredients, ingredients) ||
                const DeepCollectionEquality()
                    .equals(other.ingredients, ingredients)) &&
            (identical(other.addOnCategories, addOnCategories) ||
                const DeepCollectionEquality()
                    .equals(other.addOnCategories, addOnCategories)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.averageRating, averageRating) ||
                const DeepCollectionEquality()
                    .equals(other.averageRating, averageRating)) &&
            (identical(other.totalRating, totalRating) ||
                const DeepCollectionEquality()
                    .equals(other.totalRating, totalRating)) &&
            (identical(other.noOfUsersRated, noOfUsersRated) ||
                const DeepCollectionEquality()
                    .equals(other.noOfUsersRated, noOfUsersRated)) &&
            (identical(other.allergens, allergens) ||
                const DeepCollectionEquality()
                    .equals(other.allergens, allergens)) &&
            (identical(other.relatedProducts, relatedProducts) ||
                const DeepCollectionEquality()
                    .equals(other.relatedProducts, relatedProducts)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.isCopy, isCopy) ||
                const DeepCollectionEquality().equals(other.isCopy, isCopy)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.offerPercentage, offerPercentage) ||
                const DeepCollectionEquality()
                    .equals(other.offerPercentage, offerPercentage)) &&
            (identical(other.franchiseId, franchiseId) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseId, franchiseId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.productName, productName) ||
                const DeepCollectionEquality()
                    .equals(other.productName, productName)) &&
            (identical(other.productDescription, productDescription) ||
                const DeepCollectionEquality()
                    .equals(other.productDescription, productDescription)) &&
            (identical(other.isVeg, isVeg) ||
                const DeepCollectionEquality().equals(other.isVeg, isVeg)) &&
            (identical(other.variants, variants) ||
                const DeepCollectionEquality()
                    .equals(other.variants, variants)) &&
            (identical(other.addOnItems, addOnItems) ||
                const DeepCollectionEquality()
                    .equals(other.addOnItems, addOnItems)) &&
            (identical(other.subCategory, subCategory) ||
                const DeepCollectionEquality()
                    .equals(other.subCategory, subCategory)) &&
            (identical(other.ranking, ranking) ||
                const DeepCollectionEquality()
                    .equals(other.ranking, ranking)) &&
            (identical(other.menuId, menuId) ||
                const DeepCollectionEquality().equals(other.menuId, menuId)) &&
            (identical(other.vendorId, vendorId) ||
                const DeepCollectionEquality().equals(other.vendorId, vendorId)) &&
            (identical(other.categoryName, categoryName) || const DeepCollectionEquality().equals(other.categoryName, categoryName)) &&
            (identical(other.franchiseName, franchiseName) || const DeepCollectionEquality().equals(other.franchiseName, franchiseName)) &&
            (identical(other.createdAt, createdAt) || const DeepCollectionEquality().equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) || const DeepCollectionEquality().equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(productImage) ^
      const DeepCollectionEquality().hash(taxInfo) ^
      const DeepCollectionEquality().hash(ingredients) ^
      const DeepCollectionEquality().hash(addOnCategories) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(averageRating) ^
      const DeepCollectionEquality().hash(totalRating) ^
      const DeepCollectionEquality().hash(noOfUsersRated) ^
      const DeepCollectionEquality().hash(allergens) ^
      const DeepCollectionEquality().hash(relatedProducts) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(isCopy) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(offerPercentage) ^
      const DeepCollectionEquality().hash(franchiseId) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(productName) ^
      const DeepCollectionEquality().hash(productDescription) ^
      const DeepCollectionEquality().hash(isVeg) ^
      const DeepCollectionEquality().hash(variants) ^
      const DeepCollectionEquality().hash(addOnItems) ^
      const DeepCollectionEquality().hash(subCategory) ^
      const DeepCollectionEquality().hash(ranking) ^
      const DeepCollectionEquality().hash(menuId) ^
      const DeepCollectionEquality().hash(vendorId) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(franchiseName) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$ProductDetailsResponseCopyWith<_ProductDetailsResponse> get copyWith =>
      __$ProductDetailsResponseCopyWithImpl<_ProductDetailsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductDetailsResponseToJson(this);
  }
}

abstract class _ProductDetailsResponse extends ProductDetailsResponse {
  const factory _ProductDetailsResponse(
      {ImageResponse? productImage,
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
      @JsonKey(name: 'addOnItems') List<AddOnCategory>? addOnItems,
      String? subCategory,
      int? ranking,
      String? menuId,
      String? vendorId,
      String? categoryName,
      String? franchiseName,
      String? createdAt,
      String? updatedAt}) = _$_ProductDetailsResponse;
  const _ProductDetailsResponse._() : super._();

  factory _ProductDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductDetailsResponse.fromJson;

  @override
  ImageResponse? get productImage => throw _privateConstructorUsedError;
  @override
  TaxInfoModel? get taxInfo => throw _privateConstructorUsedError;
  @override
  List<IngredientsModel>? get ingredients => throw _privateConstructorUsedError;
  @override
  List<String>? get addOnCategories => throw _privateConstructorUsedError;
  @override
  bool? get status => throw _privateConstructorUsedError;
  @override
  int? get averageRating => throw _privateConstructorUsedError;
  @override
  int? get totalRating => throw _privateConstructorUsedError;
  @override
  int? get noOfUsersRated => throw _privateConstructorUsedError;
  @override
  List<String>? get allergens => throw _privateConstructorUsedError;
  @override
  List<String>? get relatedProducts => throw _privateConstructorUsedError;
  @override
  List<TagResponse>? get tags => throw _privateConstructorUsedError;
  @override
  bool? get isCopy => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  int? get offerPercentage => throw _privateConstructorUsedError;
  @override
  String? get franchiseId => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  String? get productName => throw _privateConstructorUsedError;
  @override
  String? get productDescription => throw _privateConstructorUsedError;
  @override
  bool? get isVeg => throw _privateConstructorUsedError;
  @override
  List<VariantResponse>? get variants => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'addOnItems')
  List<AddOnCategory>? get addOnItems => throw _privateConstructorUsedError;
  @override
  String? get subCategory => throw _privateConstructorUsedError;
  @override
  int? get ranking => throw _privateConstructorUsedError;
  @override
  String? get menuId => throw _privateConstructorUsedError;
  @override
  String? get vendorId => throw _privateConstructorUsedError;
  @override
  String? get categoryName => throw _privateConstructorUsedError;
  @override
  String? get franchiseName => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductDetailsResponseCopyWith<_ProductDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
