// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'variant_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VariantResponse _$VariantResponseFromJson(Map<String, dynamic> json) {
  return _VariantResponse.fromJson(json);
}

/// @nodoc
class _$VariantResponseTearOff {
  const _$VariantResponseTearOff();

  _VariantResponse call(
      {@JsonKey(name: '_id') String? id,
      String? size,
      int? price,
      String? sizeName,
      bool? isDefaultVariant,
      bool? outOfStock}) {
    return _VariantResponse(
      id: id,
      size: size,
      price: price,
      sizeName: sizeName,
      isDefaultVariant: isDefaultVariant,
      outOfStock: outOfStock,
    );
  }

  VariantResponse fromJson(Map<String, Object> json) {
    return VariantResponse.fromJson(json);
  }
}

/// @nodoc
const $VariantResponse = _$VariantResponseTearOff();

/// @nodoc
mixin _$VariantResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get size => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get sizeName => throw _privateConstructorUsedError;
  bool? get isDefaultVariant => throw _privateConstructorUsedError;
  bool? get outOfStock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VariantResponseCopyWith<VariantResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantResponseCopyWith<$Res> {
  factory $VariantResponseCopyWith(
          VariantResponse value, $Res Function(VariantResponse) then) =
      _$VariantResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? size,
      int? price,
      String? sizeName,
      bool? isDefaultVariant,
      bool? outOfStock});
}

/// @nodoc
class _$VariantResponseCopyWithImpl<$Res>
    implements $VariantResponseCopyWith<$Res> {
  _$VariantResponseCopyWithImpl(this._value, this._then);

  final VariantResponse _value;
  // ignore: unused_field
  final $Res Function(VariantResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? size = freezed,
    Object? price = freezed,
    Object? sizeName = freezed,
    Object? isDefaultVariant = freezed,
    Object? outOfStock = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      sizeName: sizeName == freezed
          ? _value.sizeName
          : sizeName // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefaultVariant: isDefaultVariant == freezed
          ? _value.isDefaultVariant
          : isDefaultVariant // ignore: cast_nullable_to_non_nullable
              as bool?,
      outOfStock: outOfStock == freezed
          ? _value.outOfStock
          : outOfStock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$VariantResponseCopyWith<$Res>
    implements $VariantResponseCopyWith<$Res> {
  factory _$VariantResponseCopyWith(
          _VariantResponse value, $Res Function(_VariantResponse) then) =
      __$VariantResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? size,
      int? price,
      String? sizeName,
      bool? isDefaultVariant,
      bool? outOfStock});
}

/// @nodoc
class __$VariantResponseCopyWithImpl<$Res>
    extends _$VariantResponseCopyWithImpl<$Res>
    implements _$VariantResponseCopyWith<$Res> {
  __$VariantResponseCopyWithImpl(
      _VariantResponse _value, $Res Function(_VariantResponse) _then)
      : super(_value, (v) => _then(v as _VariantResponse));

  @override
  _VariantResponse get _value => super._value as _VariantResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? size = freezed,
    Object? price = freezed,
    Object? sizeName = freezed,
    Object? isDefaultVariant = freezed,
    Object? outOfStock = freezed,
  }) {
    return _then(_VariantResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      sizeName: sizeName == freezed
          ? _value.sizeName
          : sizeName // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefaultVariant: isDefaultVariant == freezed
          ? _value.isDefaultVariant
          : isDefaultVariant // ignore: cast_nullable_to_non_nullable
              as bool?,
      outOfStock: outOfStock == freezed
          ? _value.outOfStock
          : outOfStock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VariantResponse extends _VariantResponse {
  const _$_VariantResponse(
      {@JsonKey(name: '_id') this.id,
      this.size,
      this.price,
      this.sizeName,
      this.isDefaultVariant,
      this.outOfStock})
      : super._();

  factory _$_VariantResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_VariantResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? size;
  @override
  final int? price;
  @override
  final String? sizeName;
  @override
  final bool? isDefaultVariant;
  @override
  final bool? outOfStock;

  @override
  String toString() {
    return 'VariantResponse(id: $id, size: $size, price: $price, sizeName: $sizeName, isDefaultVariant: $isDefaultVariant, outOfStock: $outOfStock)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VariantResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.sizeName, sizeName) ||
                const DeepCollectionEquality()
                    .equals(other.sizeName, sizeName)) &&
            (identical(other.isDefaultVariant, isDefaultVariant) ||
                const DeepCollectionEquality()
                    .equals(other.isDefaultVariant, isDefaultVariant)) &&
            (identical(other.outOfStock, outOfStock) ||
                const DeepCollectionEquality()
                    .equals(other.outOfStock, outOfStock)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(sizeName) ^
      const DeepCollectionEquality().hash(isDefaultVariant) ^
      const DeepCollectionEquality().hash(outOfStock);

  @JsonKey(ignore: true)
  @override
  _$VariantResponseCopyWith<_VariantResponse> get copyWith =>
      __$VariantResponseCopyWithImpl<_VariantResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_VariantResponseToJson(this);
  }
}

abstract class _VariantResponse extends VariantResponse {
  const factory _VariantResponse(
      {@JsonKey(name: '_id') String? id,
      String? size,
      int? price,
      String? sizeName,
      bool? isDefaultVariant,
      bool? outOfStock}) = _$_VariantResponse;
  const _VariantResponse._() : super._();

  factory _VariantResponse.fromJson(Map<String, dynamic> json) =
      _$_VariantResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get size => throw _privateConstructorUsedError;
  @override
  int? get price => throw _privateConstructorUsedError;
  @override
  String? get sizeName => throw _privateConstructorUsedError;
  @override
  bool? get isDefaultVariant => throw _privateConstructorUsedError;
  @override
  bool? get outOfStock => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VariantResponseCopyWith<_VariantResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
