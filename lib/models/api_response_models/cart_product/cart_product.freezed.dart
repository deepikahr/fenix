// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cart_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartProduct _$CartProductFromJson(Map<String, dynamic> json) {
  return _CartProduct.fromJson(json);
}

/// @nodoc
class _$CartProductTearOff {
  const _$CartProductTearOff();

  _CartProduct call(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      VariantResponse? variant,
      TaxInfoModel? taxInfo,
      bool? isPaid,
      List<TagResponse>? tags,
      List<AddOnItem> selectedAddOnItems = const [],
      String? category,
      String? productName,
      bool? isVeg,
      String? subCategory,
      String? menuId,
      String? categoryName,
      String? productDescription,
      double totalProductPrice = 0,
      dynamic variantQuantity = 1,
      double tax = 0,
      String? productId,
      String? productInstructions,
      bool modified = false,
      @JsonKey(includeIfNull: false) int? modifiedQuantity}) {
    return _CartProduct(
      id: id,
      productImage: productImage,
      variant: variant,
      taxInfo: taxInfo,
      isPaid: isPaid,
      tags: tags,
      selectedAddOnItems: selectedAddOnItems,
      category: category,
      productName: productName,
      isVeg: isVeg,
      subCategory: subCategory,
      menuId: menuId,
      categoryName: categoryName,
      productDescription: productDescription,
      totalProductPrice: totalProductPrice,
      variantQuantity: variantQuantity,
      tax: tax,
      productId: productId,
      productInstructions: productInstructions,
      modified: modified,
      modifiedQuantity: modifiedQuantity,
    );
  }

  CartProduct fromJson(Map<String, Object> json) {
    return CartProduct.fromJson(json);
  }
}

/// @nodoc
const $CartProduct = _$CartProductTearOff();

/// @nodoc
mixin _$CartProduct {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  ImageResponse? get productImage => throw _privateConstructorUsedError;
  VariantResponse? get variant => throw _privateConstructorUsedError;
  TaxInfoModel? get taxInfo => throw _privateConstructorUsedError;
  bool? get isPaid => throw _privateConstructorUsedError;
  List<TagResponse>? get tags => throw _privateConstructorUsedError;
  List<AddOnItem> get selectedAddOnItems => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  bool? get isVeg => throw _privateConstructorUsedError;
  String? get subCategory => throw _privateConstructorUsedError;
  String? get menuId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get productDescription => throw _privateConstructorUsedError;
  double get totalProductPrice => throw _privateConstructorUsedError;
  dynamic get variantQuantity => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  String? get productId => throw _privateConstructorUsedError;
  String? get productInstructions => throw _privateConstructorUsedError;
  bool get modified => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get modifiedQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartProductCopyWith<CartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductCopyWith<$Res> {
  factory $CartProductCopyWith(
          CartProduct value, $Res Function(CartProduct) then) =
      _$CartProductCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      VariantResponse? variant,
      TaxInfoModel? taxInfo,
      bool? isPaid,
      List<TagResponse>? tags,
      List<AddOnItem> selectedAddOnItems,
      String? category,
      String? productName,
      bool? isVeg,
      String? subCategory,
      String? menuId,
      String? categoryName,
      String? productDescription,
      double totalProductPrice,
      dynamic variantQuantity,
      double tax,
      String? productId,
      String? productInstructions,
      bool modified,
      @JsonKey(includeIfNull: false) int? modifiedQuantity});

  $ImageResponseCopyWith<$Res>? get productImage;
  $VariantResponseCopyWith<$Res>? get variant;
  $TaxInfoModelCopyWith<$Res>? get taxInfo;
}

/// @nodoc
class _$CartProductCopyWithImpl<$Res> implements $CartProductCopyWith<$Res> {
  _$CartProductCopyWithImpl(this._value, this._then);

  final CartProduct _value;
  // ignore: unused_field
  final $Res Function(CartProduct) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productImage = freezed,
    Object? variant = freezed,
    Object? taxInfo = freezed,
    Object? isPaid = freezed,
    Object? tags = freezed,
    Object? selectedAddOnItems = freezed,
    Object? category = freezed,
    Object? productName = freezed,
    Object? isVeg = freezed,
    Object? subCategory = freezed,
    Object? menuId = freezed,
    Object? categoryName = freezed,
    Object? productDescription = freezed,
    Object? totalProductPrice = freezed,
    Object? variantQuantity = freezed,
    Object? tax = freezed,
    Object? productId = freezed,
    Object? productInstructions = freezed,
    Object? modified = freezed,
    Object? modifiedQuantity = freezed,
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
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as VariantResponse?,
      taxInfo: taxInfo == freezed
          ? _value.taxInfo
          : taxInfo // ignore: cast_nullable_to_non_nullable
              as TaxInfoModel?,
      isPaid: isPaid == freezed
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>?,
      selectedAddOnItems: selectedAddOnItems == freezed
          ? _value.selectedAddOnItems
          : selectedAddOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnItem>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      isVeg: isVeg == freezed
          ? _value.isVeg
          : isVeg // ignore: cast_nullable_to_non_nullable
              as bool?,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescription: productDescription == freezed
          ? _value.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      totalProductPrice: totalProductPrice == freezed
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double,
      variantQuantity: variantQuantity == freezed
          ? _value.variantQuantity
          : variantQuantity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productInstructions: productInstructions == freezed
          ? _value.productInstructions
          : productInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: modified == freezed
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as bool,
      modifiedQuantity: modifiedQuantity == freezed
          ? _value.modifiedQuantity
          : modifiedQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$CartProductCopyWith<$Res>
    implements $CartProductCopyWith<$Res> {
  factory _$CartProductCopyWith(
          _CartProduct value, $Res Function(_CartProduct) then) =
      __$CartProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      VariantResponse? variant,
      TaxInfoModel? taxInfo,
      bool? isPaid,
      List<TagResponse>? tags,
      List<AddOnItem> selectedAddOnItems,
      String? category,
      String? productName,
      bool? isVeg,
      String? subCategory,
      String? menuId,
      String? categoryName,
      String? productDescription,
      double totalProductPrice,
      dynamic variantQuantity,
      double tax,
      String? productId,
      String? productInstructions,
      bool modified,
      @JsonKey(includeIfNull: false) int? modifiedQuantity});

  @override
  $ImageResponseCopyWith<$Res>? get productImage;
  @override
  $VariantResponseCopyWith<$Res>? get variant;
  @override
  $TaxInfoModelCopyWith<$Res>? get taxInfo;
}

/// @nodoc
class __$CartProductCopyWithImpl<$Res> extends _$CartProductCopyWithImpl<$Res>
    implements _$CartProductCopyWith<$Res> {
  __$CartProductCopyWithImpl(
      _CartProduct _value, $Res Function(_CartProduct) _then)
      : super(_value, (v) => _then(v as _CartProduct));

  @override
  _CartProduct get _value => super._value as _CartProduct;

  @override
  $Res call({
    Object? id = freezed,
    Object? productImage = freezed,
    Object? variant = freezed,
    Object? taxInfo = freezed,
    Object? isPaid = freezed,
    Object? tags = freezed,
    Object? selectedAddOnItems = freezed,
    Object? category = freezed,
    Object? productName = freezed,
    Object? isVeg = freezed,
    Object? subCategory = freezed,
    Object? menuId = freezed,
    Object? categoryName = freezed,
    Object? productDescription = freezed,
    Object? totalProductPrice = freezed,
    Object? variantQuantity = freezed,
    Object? tax = freezed,
    Object? productId = freezed,
    Object? productInstructions = freezed,
    Object? modified = freezed,
    Object? modifiedQuantity = freezed,
  }) {
    return _then(_CartProduct(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productImage: productImage == freezed
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as ImageResponse?,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as VariantResponse?,
      taxInfo: taxInfo == freezed
          ? _value.taxInfo
          : taxInfo // ignore: cast_nullable_to_non_nullable
              as TaxInfoModel?,
      isPaid: isPaid == freezed
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>?,
      selectedAddOnItems: selectedAddOnItems == freezed
          ? _value.selectedAddOnItems
          : selectedAddOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnItem>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      isVeg: isVeg == freezed
          ? _value.isVeg
          : isVeg // ignore: cast_nullable_to_non_nullable
              as bool?,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescription: productDescription == freezed
          ? _value.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      totalProductPrice: totalProductPrice == freezed
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double,
      variantQuantity:
          variantQuantity == freezed ? _value.variantQuantity : variantQuantity,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productInstructions: productInstructions == freezed
          ? _value.productInstructions
          : productInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: modified == freezed
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as bool,
      modifiedQuantity: modifiedQuantity == freezed
          ? _value.modifiedQuantity
          : modifiedQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartProduct extends _CartProduct {
  const _$_CartProduct(
      {@JsonKey(name: '_id') this.id,
      this.productImage,
      this.variant,
      this.taxInfo,
      this.isPaid,
      this.tags,
      this.selectedAddOnItems = const [],
      this.category,
      this.productName,
      this.isVeg,
      this.subCategory,
      this.menuId,
      this.categoryName,
      this.productDescription,
      this.totalProductPrice = 0,
      this.variantQuantity = 1,
      this.tax = 0,
      this.productId,
      this.productInstructions,
      this.modified = false,
      @JsonKey(includeIfNull: false) this.modifiedQuantity})
      : super._();

  factory _$_CartProduct.fromJson(Map<String, dynamic> json) =>
      _$_$_CartProductFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final ImageResponse? productImage;
  @override
  final VariantResponse? variant;
  @override
  final TaxInfoModel? taxInfo;
  @override
  final bool? isPaid;
  @override
  final List<TagResponse>? tags;
  @JsonKey(defaultValue: const [])
  @override
  final List<AddOnItem> selectedAddOnItems;
  @override
  final String? category;
  @override
  final String? productName;
  @override
  final bool? isVeg;
  @override
  final String? subCategory;
  @override
  final String? menuId;
  @override
  final String? categoryName;
  @override
  final String? productDescription;
  @JsonKey(defaultValue: 0)
  @override
  final double totalProductPrice;
  @JsonKey(defaultValue: 1)
  @override
  final dynamic variantQuantity;
  @JsonKey(defaultValue: 0)
  @override
  final double tax;
  @override
  final String? productId;
  @override
  final String? productInstructions;
  @JsonKey(defaultValue: false)
  @override
  final bool modified;
  @override
  @JsonKey(includeIfNull: false)
  final int? modifiedQuantity;

  @override
  String toString() {
    return 'CartProduct(id: $id, productImage: $productImage, variant: $variant, taxInfo: $taxInfo, isPaid: $isPaid, tags: $tags, selectedAddOnItems: $selectedAddOnItems, category: $category, productName: $productName, isVeg: $isVeg, subCategory: $subCategory, menuId: $menuId, categoryName: $categoryName, productDescription: $productDescription, totalProductPrice: $totalProductPrice, variantQuantity: $variantQuantity, tax: $tax, productId: $productId, productInstructions: $productInstructions, modified: $modified, modifiedQuantity: $modifiedQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CartProduct &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.productImage, productImage) ||
                const DeepCollectionEquality()
                    .equals(other.productImage, productImage)) &&
            (identical(other.variant, variant) ||
                const DeepCollectionEquality()
                    .equals(other.variant, variant)) &&
            (identical(other.taxInfo, taxInfo) ||
                const DeepCollectionEquality()
                    .equals(other.taxInfo, taxInfo)) &&
            (identical(other.isPaid, isPaid) ||
                const DeepCollectionEquality().equals(other.isPaid, isPaid)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.selectedAddOnItems, selectedAddOnItems) ||
                const DeepCollectionEquality()
                    .equals(other.selectedAddOnItems, selectedAddOnItems)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.productName, productName) ||
                const DeepCollectionEquality()
                    .equals(other.productName, productName)) &&
            (identical(other.isVeg, isVeg) ||
                const DeepCollectionEquality().equals(other.isVeg, isVeg)) &&
            (identical(other.subCategory, subCategory) ||
                const DeepCollectionEquality()
                    .equals(other.subCategory, subCategory)) &&
            (identical(other.menuId, menuId) ||
                const DeepCollectionEquality().equals(other.menuId, menuId)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.productDescription, productDescription) ||
                const DeepCollectionEquality()
                    .equals(other.productDescription, productDescription)) &&
            (identical(other.totalProductPrice, totalProductPrice) ||
                const DeepCollectionEquality()
                    .equals(other.totalProductPrice, totalProductPrice)) &&
            (identical(other.variantQuantity, variantQuantity) ||
                const DeepCollectionEquality()
                    .equals(other.variantQuantity, variantQuantity)) &&
            (identical(other.tax, tax) ||
                const DeepCollectionEquality().equals(other.tax, tax)) &&
            (identical(other.productId, productId) ||
                const DeepCollectionEquality()
                    .equals(other.productId, productId)) &&
            (identical(other.productInstructions, productInstructions) ||
                const DeepCollectionEquality()
                    .equals(other.productInstructions, productInstructions)) &&
            (identical(other.modified, modified) ||
                const DeepCollectionEquality()
                    .equals(other.modified, modified)) &&
            (identical(other.modifiedQuantity, modifiedQuantity) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedQuantity, modifiedQuantity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(productImage) ^
      const DeepCollectionEquality().hash(variant) ^
      const DeepCollectionEquality().hash(taxInfo) ^
      const DeepCollectionEquality().hash(isPaid) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(selectedAddOnItems) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(productName) ^
      const DeepCollectionEquality().hash(isVeg) ^
      const DeepCollectionEquality().hash(subCategory) ^
      const DeepCollectionEquality().hash(menuId) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(productDescription) ^
      const DeepCollectionEquality().hash(totalProductPrice) ^
      const DeepCollectionEquality().hash(variantQuantity) ^
      const DeepCollectionEquality().hash(tax) ^
      const DeepCollectionEquality().hash(productId) ^
      const DeepCollectionEquality().hash(productInstructions) ^
      const DeepCollectionEquality().hash(modified) ^
      const DeepCollectionEquality().hash(modifiedQuantity);

  @JsonKey(ignore: true)
  @override
  _$CartProductCopyWith<_CartProduct> get copyWith =>
      __$CartProductCopyWithImpl<_CartProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CartProductToJson(this);
  }
}

abstract class _CartProduct extends CartProduct {
  const factory _CartProduct(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      VariantResponse? variant,
      TaxInfoModel? taxInfo,
      bool? isPaid,
      List<TagResponse>? tags,
      List<AddOnItem> selectedAddOnItems,
      String? category,
      String? productName,
      bool? isVeg,
      String? subCategory,
      String? menuId,
      String? categoryName,
      String? productDescription,
      double totalProductPrice,
      dynamic variantQuantity,
      double tax,
      String? productId,
      String? productInstructions,
      bool modified,
      @JsonKey(includeIfNull: false) int? modifiedQuantity}) = _$_CartProduct;
  const _CartProduct._() : super._();

  factory _CartProduct.fromJson(Map<String, dynamic> json) =
      _$_CartProduct.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  ImageResponse? get productImage => throw _privateConstructorUsedError;
  @override
  VariantResponse? get variant => throw _privateConstructorUsedError;
  @override
  TaxInfoModel? get taxInfo => throw _privateConstructorUsedError;
  @override
  bool? get isPaid => throw _privateConstructorUsedError;
  @override
  List<TagResponse>? get tags => throw _privateConstructorUsedError;
  @override
  List<AddOnItem> get selectedAddOnItems => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  String? get productName => throw _privateConstructorUsedError;
  @override
  bool? get isVeg => throw _privateConstructorUsedError;
  @override
  String? get subCategory => throw _privateConstructorUsedError;
  @override
  String? get menuId => throw _privateConstructorUsedError;
  @override
  String? get categoryName => throw _privateConstructorUsedError;
  @override
  String? get productDescription => throw _privateConstructorUsedError;
  @override
  double get totalProductPrice => throw _privateConstructorUsedError;
  @override
  dynamic get variantQuantity => throw _privateConstructorUsedError;
  @override
  double get tax => throw _privateConstructorUsedError;
  @override
  String? get productId => throw _privateConstructorUsedError;
  @override
  String? get productInstructions => throw _privateConstructorUsedError;
  @override
  bool get modified => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  int? get modifiedQuantity => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CartProductCopyWith<_CartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
