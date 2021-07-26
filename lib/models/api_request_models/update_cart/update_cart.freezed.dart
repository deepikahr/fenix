// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'update_cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateCart _$UpdateCartFromJson(Map<String, dynamic> json) {
  return _UpdateCart.fromJson(json);
}

/// @nodoc
class _$UpdateCartTearOff {
  const _$UpdateCartTearOff();

  _UpdateCart call({String? orderId, List<UpdateProduct> products = const []}) {
    return _UpdateCart(
      orderId: orderId,
      products: products,
    );
  }

  UpdateCart fromJson(Map<String, Object> json) {
    return UpdateCart.fromJson(json);
  }
}

/// @nodoc
const $UpdateCart = _$UpdateCartTearOff();

/// @nodoc
mixin _$UpdateCart {
  String? get orderId => throw _privateConstructorUsedError;
  List<UpdateProduct> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateCartCopyWith<UpdateCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCartCopyWith<$Res> {
  factory $UpdateCartCopyWith(
          UpdateCart value, $Res Function(UpdateCart) then) =
      _$UpdateCartCopyWithImpl<$Res>;
  $Res call({String? orderId, List<UpdateProduct> products});
}

/// @nodoc
class _$UpdateCartCopyWithImpl<$Res> implements $UpdateCartCopyWith<$Res> {
  _$UpdateCartCopyWithImpl(this._value, this._then);

  final UpdateCart _value;
  // ignore: unused_field
  final $Res Function(UpdateCart) _then;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<UpdateProduct>,
    ));
  }
}

/// @nodoc
abstract class _$UpdateCartCopyWith<$Res> implements $UpdateCartCopyWith<$Res> {
  factory _$UpdateCartCopyWith(
          _UpdateCart value, $Res Function(_UpdateCart) then) =
      __$UpdateCartCopyWithImpl<$Res>;
  @override
  $Res call({String? orderId, List<UpdateProduct> products});
}

/// @nodoc
class __$UpdateCartCopyWithImpl<$Res> extends _$UpdateCartCopyWithImpl<$Res>
    implements _$UpdateCartCopyWith<$Res> {
  __$UpdateCartCopyWithImpl(
      _UpdateCart _value, $Res Function(_UpdateCart) _then)
      : super(_value, (v) => _then(v as _UpdateCart));

  @override
  _UpdateCart get _value => super._value as _UpdateCart;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? products = freezed,
  }) {
    return _then(_UpdateCart(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<UpdateProduct>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateCart extends _UpdateCart {
  _$_UpdateCart({this.orderId, this.products = const []}) : super._();

  factory _$_UpdateCart.fromJson(Map<String, dynamic> json) =>
      _$_$_UpdateCartFromJson(json);

  @override
  final String? orderId;
  @JsonKey(defaultValue: const [])
  @override
  final List<UpdateProduct> products;

  @override
  String toString() {
    return 'UpdateCart(orderId: $orderId, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateCart &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(products);

  @JsonKey(ignore: true)
  @override
  _$UpdateCartCopyWith<_UpdateCart> get copyWith =>
      __$UpdateCartCopyWithImpl<_UpdateCart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UpdateCartToJson(this);
  }
}

abstract class _UpdateCart extends UpdateCart {
  factory _UpdateCart({String? orderId, List<UpdateProduct> products}) =
      _$_UpdateCart;
  _UpdateCart._() : super._();

  factory _UpdateCart.fromJson(Map<String, dynamic> json) =
      _$_UpdateCart.fromJson;

  @override
  String? get orderId => throw _privateConstructorUsedError;
  @override
  List<UpdateProduct> get products => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UpdateCartCopyWith<_UpdateCart> get copyWith =>
      throw _privateConstructorUsedError;
}
