// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return _ProductResponse.fromJson(json);
}

/// @nodoc
class _$ProductResponseTearOff {
  const _$ProductResponseTearOff();

  _ProductResponse call(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      List<String>? allergens,
      List<TagResponse>? tags,
      String? productName,
      String? productDescription,
      String? franchiseName,
      int averageRating = 0,
      String? franchiseId,
      String? categoryName,
      String? category,
      String? subCategory,
      String? vendorId,
      String? menuId,
      String? restaurantName,
      double originalPrice = 0,
      double sellingPrice = 0,
      int discount = 0,
      int? ranking,
      String? sizeName,
      bool? isVeg,
      String? description,
      List<AddOnItem> addOnItems = const [],
      int preparationTime = 0,
      double totalProductPrice = 0,
      int quantity = 1,
      String? productId,
      double rate = 0,
      String? rateDescription,
      bool isLastUsedVariant = false,
      bool isCustomizable = true,
      int totalQuantity = 0,
      bool isSameProductMultipleTime = false,
      VariantResponse? variant}) {
    return _ProductResponse(
      id: id,
      productImage: productImage,
      allergens: allergens,
      tags: tags,
      productName: productName,
      productDescription: productDescription,
      franchiseName: franchiseName,
      averageRating: averageRating,
      franchiseId: franchiseId,
      categoryName: categoryName,
      category: category,
      subCategory: subCategory,
      vendorId: vendorId,
      menuId: menuId,
      restaurantName: restaurantName,
      originalPrice: originalPrice,
      sellingPrice: sellingPrice,
      discount: discount,
      ranking: ranking,
      sizeName: sizeName,
      isVeg: isVeg,
      description: description,
      addOnItems: addOnItems,
      preparationTime: preparationTime,
      totalProductPrice: totalProductPrice,
      quantity: quantity,
      productId: productId,
      rate: rate,
      rateDescription: rateDescription,
      isLastUsedVariant: isLastUsedVariant,
      isCustomizable: isCustomizable,
      totalQuantity: totalQuantity,
      isSameProductMultipleTime: isSameProductMultipleTime,
      variant: variant,
    );
  }

  ProductResponse fromJson(Map<String, Object> json) {
    return ProductResponse.fromJson(json);
  }
}

/// @nodoc
const $ProductResponse = _$ProductResponseTearOff();

/// @nodoc
mixin _$ProductResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  ImageResponse? get productImage => throw _privateConstructorUsedError;
  List<String>? get allergens => throw _privateConstructorUsedError;
  List<TagResponse>? get tags => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get productDescription => throw _privateConstructorUsedError;
  String? get franchiseName => throw _privateConstructorUsedError;
  int get averageRating => throw _privateConstructorUsedError;
  String? get franchiseId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get subCategory => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  String? get menuId => throw _privateConstructorUsedError;
  String? get restaurantName => throw _privateConstructorUsedError;
  double get originalPrice => throw _privateConstructorUsedError;
  double get sellingPrice => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  int? get ranking => throw _privateConstructorUsedError;
  String? get sizeName => throw _privateConstructorUsedError;
  bool? get isVeg => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<AddOnItem> get addOnItems => throw _privateConstructorUsedError;
  int get preparationTime => throw _privateConstructorUsedError;
  double get totalProductPrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get productId => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  String? get rateDescription => throw _privateConstructorUsedError;
  bool get isLastUsedVariant => throw _privateConstructorUsedError;
  bool get isCustomizable => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  bool get isSameProductMultipleTime => throw _privateConstructorUsedError;
  VariantResponse? get variant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductResponseCopyWith<ProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductResponseCopyWith<$Res> {
  factory $ProductResponseCopyWith(
          ProductResponse value, $Res Function(ProductResponse) then) =
      _$ProductResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      List<String>? allergens,
      List<TagResponse>? tags,
      String? productName,
      String? productDescription,
      String? franchiseName,
      int averageRating,
      String? franchiseId,
      String? categoryName,
      String? category,
      String? subCategory,
      String? vendorId,
      String? menuId,
      String? restaurantName,
      double originalPrice,
      double sellingPrice,
      int discount,
      int? ranking,
      String? sizeName,
      bool? isVeg,
      String? description,
      List<AddOnItem> addOnItems,
      int preparationTime,
      double totalProductPrice,
      int quantity,
      String? productId,
      double rate,
      String? rateDescription,
      bool isLastUsedVariant,
      bool isCustomizable,
      int totalQuantity,
      bool isSameProductMultipleTime,
      VariantResponse? variant});

  $ImageResponseCopyWith<$Res>? get productImage;
  $VariantResponseCopyWith<$Res>? get variant;
}

/// @nodoc
class _$ProductResponseCopyWithImpl<$Res>
    implements $ProductResponseCopyWith<$Res> {
  _$ProductResponseCopyWithImpl(this._value, this._then);

  final ProductResponse _value;
  // ignore: unused_field
  final $Res Function(ProductResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productImage = freezed,
    Object? allergens = freezed,
    Object? tags = freezed,
    Object? productName = freezed,
    Object? productDescription = freezed,
    Object? franchiseName = freezed,
    Object? averageRating = freezed,
    Object? franchiseId = freezed,
    Object? categoryName = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? vendorId = freezed,
    Object? menuId = freezed,
    Object? restaurantName = freezed,
    Object? originalPrice = freezed,
    Object? sellingPrice = freezed,
    Object? discount = freezed,
    Object? ranking = freezed,
    Object? sizeName = freezed,
    Object? isVeg = freezed,
    Object? description = freezed,
    Object? addOnItems = freezed,
    Object? preparationTime = freezed,
    Object? totalProductPrice = freezed,
    Object? quantity = freezed,
    Object? productId = freezed,
    Object? rate = freezed,
    Object? rateDescription = freezed,
    Object? isLastUsedVariant = freezed,
    Object? isCustomizable = freezed,
    Object? totalQuantity = freezed,
    Object? isSameProductMultipleTime = freezed,
    Object? variant = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productImage: productImage == freezed
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as ImageResponse?,
      allergens: allergens == freezed
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescription: productDescription == freezed
          ? _value.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      averageRating: averageRating == freezed
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as int,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
      originalPrice: originalPrice == freezed
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      sellingPrice: sellingPrice == freezed
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      ranking: ranking == freezed
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int?,
      sizeName: sizeName == freezed
          ? _value.sizeName
          : sizeName // ignore: cast_nullable_to_non_nullable
              as String?,
      isVeg: isVeg == freezed
          ? _value.isVeg
          : isVeg // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnItems: addOnItems == freezed
          ? _value.addOnItems
          : addOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnItem>,
      preparationTime: preparationTime == freezed
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: totalProductPrice == freezed
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      rateDescription: rateDescription == freezed
          ? _value.rateDescription
          : rateDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      isLastUsedVariant: isLastUsedVariant == freezed
          ? _value.isLastUsedVariant
          : isLastUsedVariant // ignore: cast_nullable_to_non_nullable
              as bool,
      isCustomizable: isCustomizable == freezed
          ? _value.isCustomizable
          : isCustomizable // ignore: cast_nullable_to_non_nullable
              as bool,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isSameProductMultipleTime: isSameProductMultipleTime == freezed
          ? _value.isSameProductMultipleTime
          : isSameProductMultipleTime // ignore: cast_nullable_to_non_nullable
              as bool,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as VariantResponse?,
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
  $VariantResponseCopyWith<$Res>? get variant {
    if (_value.variant == null) {
      return null;
    }

    return $VariantResponseCopyWith<$Res>(_value.variant!, (value) {
      return _then(_value.copyWith(variant: value));
    });
  }
}

/// @nodoc
abstract class _$ProductResponseCopyWith<$Res>
    implements $ProductResponseCopyWith<$Res> {
  factory _$ProductResponseCopyWith(
          _ProductResponse value, $Res Function(_ProductResponse) then) =
      __$ProductResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      List<String>? allergens,
      List<TagResponse>? tags,
      String? productName,
      String? productDescription,
      String? franchiseName,
      int averageRating,
      String? franchiseId,
      String? categoryName,
      String? category,
      String? subCategory,
      String? vendorId,
      String? menuId,
      String? restaurantName,
      double originalPrice,
      double sellingPrice,
      int discount,
      int? ranking,
      String? sizeName,
      bool? isVeg,
      String? description,
      List<AddOnItem> addOnItems,
      int preparationTime,
      double totalProductPrice,
      int quantity,
      String? productId,
      double rate,
      String? rateDescription,
      bool isLastUsedVariant,
      bool isCustomizable,
      int totalQuantity,
      bool isSameProductMultipleTime,
      VariantResponse? variant});

  @override
  $ImageResponseCopyWith<$Res>? get productImage;
  @override
  $VariantResponseCopyWith<$Res>? get variant;
}

/// @nodoc
class __$ProductResponseCopyWithImpl<$Res>
    extends _$ProductResponseCopyWithImpl<$Res>
    implements _$ProductResponseCopyWith<$Res> {
  __$ProductResponseCopyWithImpl(
      _ProductResponse _value, $Res Function(_ProductResponse) _then)
      : super(_value, (v) => _then(v as _ProductResponse));

  @override
  _ProductResponse get _value => super._value as _ProductResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? productImage = freezed,
    Object? allergens = freezed,
    Object? tags = freezed,
    Object? productName = freezed,
    Object? productDescription = freezed,
    Object? franchiseName = freezed,
    Object? averageRating = freezed,
    Object? franchiseId = freezed,
    Object? categoryName = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? vendorId = freezed,
    Object? menuId = freezed,
    Object? restaurantName = freezed,
    Object? originalPrice = freezed,
    Object? sellingPrice = freezed,
    Object? discount = freezed,
    Object? ranking = freezed,
    Object? sizeName = freezed,
    Object? isVeg = freezed,
    Object? description = freezed,
    Object? addOnItems = freezed,
    Object? preparationTime = freezed,
    Object? totalProductPrice = freezed,
    Object? quantity = freezed,
    Object? productId = freezed,
    Object? rate = freezed,
    Object? rateDescription = freezed,
    Object? isLastUsedVariant = freezed,
    Object? isCustomizable = freezed,
    Object? totalQuantity = freezed,
    Object? isSameProductMultipleTime = freezed,
    Object? variant = freezed,
  }) {
    return _then(_ProductResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productImage: productImage == freezed
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as ImageResponse?,
      allergens: allergens == freezed
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescription: productDescription == freezed
          ? _value.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      averageRating: averageRating == freezed
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as int,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
      originalPrice: originalPrice == freezed
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      sellingPrice: sellingPrice == freezed
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      ranking: ranking == freezed
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int?,
      sizeName: sizeName == freezed
          ? _value.sizeName
          : sizeName // ignore: cast_nullable_to_non_nullable
              as String?,
      isVeg: isVeg == freezed
          ? _value.isVeg
          : isVeg // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnItems: addOnItems == freezed
          ? _value.addOnItems
          : addOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnItem>,
      preparationTime: preparationTime == freezed
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: totalProductPrice == freezed
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      rateDescription: rateDescription == freezed
          ? _value.rateDescription
          : rateDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      isLastUsedVariant: isLastUsedVariant == freezed
          ? _value.isLastUsedVariant
          : isLastUsedVariant // ignore: cast_nullable_to_non_nullable
              as bool,
      isCustomizable: isCustomizable == freezed
          ? _value.isCustomizable
          : isCustomizable // ignore: cast_nullable_to_non_nullable
              as bool,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isSameProductMultipleTime: isSameProductMultipleTime == freezed
          ? _value.isSameProductMultipleTime
          : isSameProductMultipleTime // ignore: cast_nullable_to_non_nullable
              as bool,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as VariantResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductResponse extends _ProductResponse {
  const _$_ProductResponse(
      {@JsonKey(name: '_id') this.id,
      this.productImage,
      this.allergens,
      this.tags,
      this.productName,
      this.productDescription,
      this.franchiseName,
      this.averageRating = 0,
      this.franchiseId,
      this.categoryName,
      this.category,
      this.subCategory,
      this.vendorId,
      this.menuId,
      this.restaurantName,
      this.originalPrice = 0,
      this.sellingPrice = 0,
      this.discount = 0,
      this.ranking,
      this.sizeName,
      this.isVeg,
      this.description,
      this.addOnItems = const [],
      this.preparationTime = 0,
      this.totalProductPrice = 0,
      this.quantity = 1,
      this.productId,
      this.rate = 0,
      this.rateDescription,
      this.isLastUsedVariant = false,
      this.isCustomizable = true,
      this.totalQuantity = 0,
      this.isSameProductMultipleTime = false,
      this.variant})
      : super._();

  factory _$_ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final ImageResponse? productImage;
  @override
  final List<String>? allergens;
  @override
  final List<TagResponse>? tags;
  @override
  final String? productName;
  @override
  final String? productDescription;
  @override
  final String? franchiseName;
  @JsonKey(defaultValue: 0)
  @override
  final int averageRating;
  @override
  final String? franchiseId;
  @override
  final String? categoryName;
  @override
  final String? category;
  @override
  final String? subCategory;
  @override
  final String? vendorId;
  @override
  final String? menuId;
  @override
  final String? restaurantName;
  @JsonKey(defaultValue: 0)
  @override
  final double originalPrice;
  @JsonKey(defaultValue: 0)
  @override
  final double sellingPrice;
  @JsonKey(defaultValue: 0)
  @override
  final int discount;
  @override
  final int? ranking;
  @override
  final String? sizeName;
  @override
  final bool? isVeg;
  @override
  final String? description;
  @JsonKey(defaultValue: const [])
  @override
  final List<AddOnItem> addOnItems;
  @JsonKey(defaultValue: 0)
  @override
  final int preparationTime;
  @JsonKey(defaultValue: 0)
  @override
  final double totalProductPrice;
  @JsonKey(defaultValue: 1)
  @override
  final int quantity;
  @override
  final String? productId;
  @JsonKey(defaultValue: 0)
  @override
  final double rate;
  @override
  final String? rateDescription;
  @JsonKey(defaultValue: false)
  @override
  final bool isLastUsedVariant;
  @JsonKey(defaultValue: true)
  @override
  final bool isCustomizable;
  @JsonKey(defaultValue: 0)
  @override
  final int totalQuantity;
  @JsonKey(defaultValue: false)
  @override
  final bool isSameProductMultipleTime;
  @override
  final VariantResponse? variant;

  @override
  String toString() {
    return 'ProductResponse(id: $id, productImage: $productImage, allergens: $allergens, tags: $tags, productName: $productName, productDescription: $productDescription, franchiseName: $franchiseName, averageRating: $averageRating, franchiseId: $franchiseId, categoryName: $categoryName, category: $category, subCategory: $subCategory, vendorId: $vendorId, menuId: $menuId, restaurantName: $restaurantName, originalPrice: $originalPrice, sellingPrice: $sellingPrice, discount: $discount, ranking: $ranking, sizeName: $sizeName, isVeg: $isVeg, description: $description, addOnItems: $addOnItems, preparationTime: $preparationTime, totalProductPrice: $totalProductPrice, quantity: $quantity, productId: $productId, rate: $rate, rateDescription: $rateDescription, isLastUsedVariant: $isLastUsedVariant, isCustomizable: $isCustomizable, totalQuantity: $totalQuantity, isSameProductMultipleTime: $isSameProductMultipleTime, variant: $variant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.productImage, productImage) ||
                const DeepCollectionEquality()
                    .equals(other.productImage, productImage)) &&
            (identical(other.allergens, allergens) ||
                const DeepCollectionEquality()
                    .equals(other.allergens, allergens)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.productName, productName) ||
                const DeepCollectionEquality()
                    .equals(other.productName, productName)) &&
            (identical(other.productDescription, productDescription) ||
                const DeepCollectionEquality()
                    .equals(other.productDescription, productDescription)) &&
            (identical(other.franchiseName, franchiseName) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseName, franchiseName)) &&
            (identical(other.averageRating, averageRating) ||
                const DeepCollectionEquality()
                    .equals(other.averageRating, averageRating)) &&
            (identical(other.franchiseId, franchiseId) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseId, franchiseId)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.subCategory, subCategory) ||
                const DeepCollectionEquality()
                    .equals(other.subCategory, subCategory)) &&
            (identical(other.vendorId, vendorId) ||
                const DeepCollectionEquality()
                    .equals(other.vendorId, vendorId)) &&
            (identical(other.menuId, menuId) ||
                const DeepCollectionEquality().equals(other.menuId, menuId)) &&
            (identical(other.restaurantName, restaurantName) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantName, restaurantName)) &&
            (identical(other.originalPrice, originalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.originalPrice, originalPrice)) &&
            (identical(other.sellingPrice, sellingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.sellingPrice, sellingPrice)) &&
            (identical(other.discount, discount) ||
                const DeepCollectionEquality()
                    .equals(other.discount, discount)) &&
            (identical(other.ranking, ranking) ||
                const DeepCollectionEquality()
                    .equals(other.ranking, ranking)) &&
            (identical(other.sizeName, sizeName) ||
                const DeepCollectionEquality()
                    .equals(other.sizeName, sizeName)) &&
            (identical(other.isVeg, isVeg) ||
                const DeepCollectionEquality().equals(other.isVeg, isVeg)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.addOnItems, addOnItems) ||
                const DeepCollectionEquality()
                    .equals(other.addOnItems, addOnItems)) &&
            (identical(other.preparationTime, preparationTime) ||
                const DeepCollectionEquality().equals(other.preparationTime, preparationTime)) &&
            (identical(other.totalProductPrice, totalProductPrice) || const DeepCollectionEquality().equals(other.totalProductPrice, totalProductPrice)) &&
            (identical(other.quantity, quantity) || const DeepCollectionEquality().equals(other.quantity, quantity)) &&
            (identical(other.productId, productId) || const DeepCollectionEquality().equals(other.productId, productId)) &&
            (identical(other.rate, rate) || const DeepCollectionEquality().equals(other.rate, rate)) &&
            (identical(other.rateDescription, rateDescription) || const DeepCollectionEquality().equals(other.rateDescription, rateDescription)) &&
            (identical(other.isLastUsedVariant, isLastUsedVariant) || const DeepCollectionEquality().equals(other.isLastUsedVariant, isLastUsedVariant)) &&
            (identical(other.isCustomizable, isCustomizable) || const DeepCollectionEquality().equals(other.isCustomizable, isCustomizable)) &&
            (identical(other.totalQuantity, totalQuantity) || const DeepCollectionEquality().equals(other.totalQuantity, totalQuantity)) &&
            (identical(other.isSameProductMultipleTime, isSameProductMultipleTime) || const DeepCollectionEquality().equals(other.isSameProductMultipleTime, isSameProductMultipleTime)) &&
            (identical(other.variant, variant) || const DeepCollectionEquality().equals(other.variant, variant)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(productImage) ^
      const DeepCollectionEquality().hash(allergens) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(productName) ^
      const DeepCollectionEquality().hash(productDescription) ^
      const DeepCollectionEquality().hash(franchiseName) ^
      const DeepCollectionEquality().hash(averageRating) ^
      const DeepCollectionEquality().hash(franchiseId) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(subCategory) ^
      const DeepCollectionEquality().hash(vendorId) ^
      const DeepCollectionEquality().hash(menuId) ^
      const DeepCollectionEquality().hash(restaurantName) ^
      const DeepCollectionEquality().hash(originalPrice) ^
      const DeepCollectionEquality().hash(sellingPrice) ^
      const DeepCollectionEquality().hash(discount) ^
      const DeepCollectionEquality().hash(ranking) ^
      const DeepCollectionEquality().hash(sizeName) ^
      const DeepCollectionEquality().hash(isVeg) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(addOnItems) ^
      const DeepCollectionEquality().hash(preparationTime) ^
      const DeepCollectionEquality().hash(totalProductPrice) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(productId) ^
      const DeepCollectionEquality().hash(rate) ^
      const DeepCollectionEquality().hash(rateDescription) ^
      const DeepCollectionEquality().hash(isLastUsedVariant) ^
      const DeepCollectionEquality().hash(isCustomizable) ^
      const DeepCollectionEquality().hash(totalQuantity) ^
      const DeepCollectionEquality().hash(isSameProductMultipleTime) ^
      const DeepCollectionEquality().hash(variant);

  @JsonKey(ignore: true)
  @override
  _$ProductResponseCopyWith<_ProductResponse> get copyWith =>
      __$ProductResponseCopyWithImpl<_ProductResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductResponseToJson(this);
  }
}

abstract class _ProductResponse extends ProductResponse {
  const factory _ProductResponse(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      List<String>? allergens,
      List<TagResponse>? tags,
      String? productName,
      String? productDescription,
      String? franchiseName,
      int averageRating,
      String? franchiseId,
      String? categoryName,
      String? category,
      String? subCategory,
      String? vendorId,
      String? menuId,
      String? restaurantName,
      double originalPrice,
      double sellingPrice,
      int discount,
      int? ranking,
      String? sizeName,
      bool? isVeg,
      String? description,
      List<AddOnItem> addOnItems,
      int preparationTime,
      double totalProductPrice,
      int quantity,
      String? productId,
      double rate,
      String? rateDescription,
      bool isLastUsedVariant,
      bool isCustomizable,
      int totalQuantity,
      bool isSameProductMultipleTime,
      VariantResponse? variant}) = _$_ProductResponse;
  const _ProductResponse._() : super._();

  factory _ProductResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  ImageResponse? get productImage => throw _privateConstructorUsedError;
  @override
  List<String>? get allergens => throw _privateConstructorUsedError;
  @override
  List<TagResponse>? get tags => throw _privateConstructorUsedError;
  @override
  String? get productName => throw _privateConstructorUsedError;
  @override
  String? get productDescription => throw _privateConstructorUsedError;
  @override
  String? get franchiseName => throw _privateConstructorUsedError;
  @override
  int get averageRating => throw _privateConstructorUsedError;
  @override
  String? get franchiseId => throw _privateConstructorUsedError;
  @override
  String? get categoryName => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  String? get subCategory => throw _privateConstructorUsedError;
  @override
  String? get vendorId => throw _privateConstructorUsedError;
  @override
  String? get menuId => throw _privateConstructorUsedError;
  @override
  String? get restaurantName => throw _privateConstructorUsedError;
  @override
  double get originalPrice => throw _privateConstructorUsedError;
  @override
  double get sellingPrice => throw _privateConstructorUsedError;
  @override
  int get discount => throw _privateConstructorUsedError;
  @override
  int? get ranking => throw _privateConstructorUsedError;
  @override
  String? get sizeName => throw _privateConstructorUsedError;
  @override
  bool? get isVeg => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  List<AddOnItem> get addOnItems => throw _privateConstructorUsedError;
  @override
  int get preparationTime => throw _privateConstructorUsedError;
  @override
  double get totalProductPrice => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  String? get productId => throw _privateConstructorUsedError;
  @override
  double get rate => throw _privateConstructorUsedError;
  @override
  String? get rateDescription => throw _privateConstructorUsedError;
  @override
  bool get isLastUsedVariant => throw _privateConstructorUsedError;
  @override
  bool get isCustomizable => throw _privateConstructorUsedError;
  @override
  int get totalQuantity => throw _privateConstructorUsedError;
  @override
  bool get isSameProductMultipleTime => throw _privateConstructorUsedError;
  @override
  VariantResponse? get variant => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductResponseCopyWith<_ProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
