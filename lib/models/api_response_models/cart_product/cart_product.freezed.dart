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
      TaxInfoModel? taxInfo,
      List<AddOnItem> addOnItems = const [],
      List<OrderStatusHistory> orderStatusHistory = const [],
      String? productName,
      String? categoryName,
      String? categoryId,
      int originalPrice = 0,
      int sellingPrice = 0,
      String? description,
      double totalProductPrice = 0,
      dynamic quantity = 1,
      String? productId,
      String? paymentStatus,
      String? orderStatus}) {
    return _CartProduct(
      id: id,
      productImage: productImage,
      taxInfo: taxInfo,
      addOnItems: addOnItems,
      orderStatusHistory: orderStatusHistory,
      productName: productName,
      categoryName: categoryName,
      categoryId: categoryId,
      originalPrice: originalPrice,
      sellingPrice: sellingPrice,
      description: description,
      totalProductPrice: totalProductPrice,
      quantity: quantity,
      productId: productId,
      paymentStatus: paymentStatus,
      orderStatus: orderStatus,
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
  TaxInfoModel? get taxInfo => throw _privateConstructorUsedError;
  List<AddOnItem> get addOnItems => throw _privateConstructorUsedError;
  List<OrderStatusHistory> get orderStatusHistory =>
      throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  int get originalPrice => throw _privateConstructorUsedError;
  int get sellingPrice => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get totalProductPrice => throw _privateConstructorUsedError;
  dynamic get quantity => throw _privateConstructorUsedError;
  String? get productId => throw _privateConstructorUsedError;
  String? get paymentStatus => throw _privateConstructorUsedError;
  String? get orderStatus => throw _privateConstructorUsedError;

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
      TaxInfoModel? taxInfo,
      List<AddOnItem> addOnItems,
      List<OrderStatusHistory> orderStatusHistory,
      String? productName,
      String? categoryName,
      String? categoryId,
      int originalPrice,
      int sellingPrice,
      String? description,
      double totalProductPrice,
      dynamic quantity,
      String? productId,
      String? paymentStatus,
      String? orderStatus});

  $ImageResponseCopyWith<$Res>? get productImage;
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
    Object? taxInfo = freezed,
    Object? addOnItems = freezed,
    Object? orderStatusHistory = freezed,
    Object? productName = freezed,
    Object? categoryName = freezed,
    Object? categoryId = freezed,
    Object? originalPrice = freezed,
    Object? sellingPrice = freezed,
    Object? description = freezed,
    Object? totalProductPrice = freezed,
    Object? quantity = freezed,
    Object? productId = freezed,
    Object? paymentStatus = freezed,
    Object? orderStatus = freezed,
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
      taxInfo: taxInfo == freezed
          ? _value.taxInfo
          : taxInfo // ignore: cast_nullable_to_non_nullable
              as TaxInfoModel?,
      addOnItems: addOnItems == freezed
          ? _value.addOnItems
          : addOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnItem>,
      orderStatusHistory: orderStatusHistory == freezed
          ? _value.orderStatusHistory
          : orderStatusHistory // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusHistory>,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      originalPrice: originalPrice == freezed
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      sellingPrice: sellingPrice == freezed
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      totalProductPrice: totalProductPrice == freezed
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: paymentStatus == freezed
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
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
abstract class _$CartProductCopyWith<$Res>
    implements $CartProductCopyWith<$Res> {
  factory _$CartProductCopyWith(
          _CartProduct value, $Res Function(_CartProduct) then) =
      __$CartProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      TaxInfoModel? taxInfo,
      List<AddOnItem> addOnItems,
      List<OrderStatusHistory> orderStatusHistory,
      String? productName,
      String? categoryName,
      String? categoryId,
      int originalPrice,
      int sellingPrice,
      String? description,
      double totalProductPrice,
      dynamic quantity,
      String? productId,
      String? paymentStatus,
      String? orderStatus});

  @override
  $ImageResponseCopyWith<$Res>? get productImage;
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
    Object? taxInfo = freezed,
    Object? addOnItems = freezed,
    Object? orderStatusHistory = freezed,
    Object? productName = freezed,
    Object? categoryName = freezed,
    Object? categoryId = freezed,
    Object? originalPrice = freezed,
    Object? sellingPrice = freezed,
    Object? description = freezed,
    Object? totalProductPrice = freezed,
    Object? quantity = freezed,
    Object? productId = freezed,
    Object? paymentStatus = freezed,
    Object? orderStatus = freezed,
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
      taxInfo: taxInfo == freezed
          ? _value.taxInfo
          : taxInfo // ignore: cast_nullable_to_non_nullable
              as TaxInfoModel?,
      addOnItems: addOnItems == freezed
          ? _value.addOnItems
          : addOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnItem>,
      orderStatusHistory: orderStatusHistory == freezed
          ? _value.orderStatusHistory
          : orderStatusHistory // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusHistory>,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      originalPrice: originalPrice == freezed
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      sellingPrice: sellingPrice == freezed
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      totalProductPrice: totalProductPrice == freezed
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed ? _value.quantity : quantity,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: paymentStatus == freezed
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartProduct extends _CartProduct {
  const _$_CartProduct(
      {@JsonKey(name: '_id') this.id,
      this.productImage,
      this.taxInfo,
      this.addOnItems = const [],
      this.orderStatusHistory = const [],
      this.productName,
      this.categoryName,
      this.categoryId,
      this.originalPrice = 0,
      this.sellingPrice = 0,
      this.description,
      this.totalProductPrice = 0,
      this.quantity = 1,
      this.productId,
      this.paymentStatus,
      this.orderStatus})
      : super._();

  factory _$_CartProduct.fromJson(Map<String, dynamic> json) =>
      _$_$_CartProductFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final ImageResponse? productImage;
  @override
  final TaxInfoModel? taxInfo;
  @JsonKey(defaultValue: const [])
  @override
  final List<AddOnItem> addOnItems;
  @JsonKey(defaultValue: const [])
  @override
  final List<OrderStatusHistory> orderStatusHistory;
  @override
  final String? productName;
  @override
  final String? categoryName;
  @override
  final String? categoryId;
  @JsonKey(defaultValue: 0)
  @override
  final int originalPrice;
  @JsonKey(defaultValue: 0)
  @override
  final int sellingPrice;
  @override
  final String? description;
  @JsonKey(defaultValue: 0)
  @override
  final double totalProductPrice;
  @JsonKey(defaultValue: 1)
  @override
  final dynamic quantity;
  @override
  final String? productId;
  @override
  final String? paymentStatus;
  @override
  final String? orderStatus;

  @override
  String toString() {
    return 'CartProduct(id: $id, productImage: $productImage, taxInfo: $taxInfo, addOnItems: $addOnItems, orderStatusHistory: $orderStatusHistory, productName: $productName, categoryName: $categoryName, categoryId: $categoryId, originalPrice: $originalPrice, sellingPrice: $sellingPrice, description: $description, totalProductPrice: $totalProductPrice, quantity: $quantity, productId: $productId, paymentStatus: $paymentStatus, orderStatus: $orderStatus)';
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
            (identical(other.taxInfo, taxInfo) ||
                const DeepCollectionEquality()
                    .equals(other.taxInfo, taxInfo)) &&
            (identical(other.addOnItems, addOnItems) ||
                const DeepCollectionEquality()
                    .equals(other.addOnItems, addOnItems)) &&
            (identical(other.orderStatusHistory, orderStatusHistory) ||
                const DeepCollectionEquality()
                    .equals(other.orderStatusHistory, orderStatusHistory)) &&
            (identical(other.productName, productName) ||
                const DeepCollectionEquality()
                    .equals(other.productName, productName)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.originalPrice, originalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.originalPrice, originalPrice)) &&
            (identical(other.sellingPrice, sellingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.sellingPrice, sellingPrice)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.totalProductPrice, totalProductPrice) ||
                const DeepCollectionEquality()
                    .equals(other.totalProductPrice, totalProductPrice)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.productId, productId) ||
                const DeepCollectionEquality()
                    .equals(other.productId, productId)) &&
            (identical(other.paymentStatus, paymentStatus) ||
                const DeepCollectionEquality()
                    .equals(other.paymentStatus, paymentStatus)) &&
            (identical(other.orderStatus, orderStatus) ||
                const DeepCollectionEquality()
                    .equals(other.orderStatus, orderStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(productImage) ^
      const DeepCollectionEquality().hash(taxInfo) ^
      const DeepCollectionEquality().hash(addOnItems) ^
      const DeepCollectionEquality().hash(orderStatusHistory) ^
      const DeepCollectionEquality().hash(productName) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(originalPrice) ^
      const DeepCollectionEquality().hash(sellingPrice) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(totalProductPrice) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(productId) ^
      const DeepCollectionEquality().hash(paymentStatus) ^
      const DeepCollectionEquality().hash(orderStatus);

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
      TaxInfoModel? taxInfo,
      List<AddOnItem> addOnItems,
      List<OrderStatusHistory> orderStatusHistory,
      String? productName,
      String? categoryName,
      String? categoryId,
      int originalPrice,
      int sellingPrice,
      String? description,
      double totalProductPrice,
      dynamic quantity,
      String? productId,
      String? paymentStatus,
      String? orderStatus}) = _$_CartProduct;
  const _CartProduct._() : super._();

  factory _CartProduct.fromJson(Map<String, dynamic> json) =
      _$_CartProduct.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  ImageResponse? get productImage => throw _privateConstructorUsedError;
  @override
  TaxInfoModel? get taxInfo => throw _privateConstructorUsedError;
  @override
  List<AddOnItem> get addOnItems => throw _privateConstructorUsedError;
  @override
  List<OrderStatusHistory> get orderStatusHistory =>
      throw _privateConstructorUsedError;
  @override
  String? get productName => throw _privateConstructorUsedError;
  @override
  String? get categoryName => throw _privateConstructorUsedError;
  @override
  String? get categoryId => throw _privateConstructorUsedError;
  @override
  int get originalPrice => throw _privateConstructorUsedError;
  @override
  int get sellingPrice => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  double get totalProductPrice => throw _privateConstructorUsedError;
  @override
  dynamic get quantity => throw _privateConstructorUsedError;
  @override
  String? get productId => throw _privateConstructorUsedError;
  @override
  String? get paymentStatus => throw _privateConstructorUsedError;
  @override
  String? get orderStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CartProductCopyWith<_CartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
