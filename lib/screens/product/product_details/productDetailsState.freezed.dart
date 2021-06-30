// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'productDetailsState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductDetailsStateTearOff {
  const _$ProductDetailsStateTearOff();

  _Default call(
      {bool isLoading = false,
      ProductDetailsResponse? productDetails,
      Set<AddOnItem>? selectedAddOnItems,
      int groupValue = 0}) {
    return _Default(
      isLoading: isLoading,
      productDetails: productDetails,
      selectedAddOnItems: selectedAddOnItems,
      groupValue: groupValue,
    );
  }
}

/// @nodoc
const $ProductDetailsState = _$ProductDetailsStateTearOff();

/// @nodoc
mixin _$ProductDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  ProductDetailsResponse? get productDetails =>
      throw _privateConstructorUsedError;
  Set<AddOnItem>? get selectedAddOnItems => throw _privateConstructorUsedError;
  int get groupValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailsStateCopyWith<ProductDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsStateCopyWith<$Res> {
  factory $ProductDetailsStateCopyWith(
          ProductDetailsState value, $Res Function(ProductDetailsState) then) =
      _$ProductDetailsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      ProductDetailsResponse? productDetails,
      Set<AddOnItem>? selectedAddOnItems,
      int groupValue});

  $ProductDetailsResponseCopyWith<$Res>? get productDetails;
}

/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._value, this._then);

  final ProductDetailsState _value;
  // ignore: unused_field
  final $Res Function(ProductDetailsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? productDetails = freezed,
    Object? selectedAddOnItems = freezed,
    Object? groupValue = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      productDetails: productDetails == freezed
          ? _value.productDetails
          : productDetails // ignore: cast_nullable_to_non_nullable
              as ProductDetailsResponse?,
      selectedAddOnItems: selectedAddOnItems == freezed
          ? _value.selectedAddOnItems
          : selectedAddOnItems // ignore: cast_nullable_to_non_nullable
              as Set<AddOnItem>?,
      groupValue: groupValue == freezed
          ? _value.groupValue
          : groupValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $ProductDetailsResponseCopyWith<$Res>? get productDetails {
    if (_value.productDetails == null) {
      return null;
    }

    return $ProductDetailsResponseCopyWith<$Res>(_value.productDetails!,
        (value) {
      return _then(_value.copyWith(productDetails: value));
    });
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      ProductDetailsResponse? productDetails,
      Set<AddOnItem>? selectedAddOnItems,
      int groupValue});

  @override
  $ProductDetailsResponseCopyWith<$Res>? get productDetails;
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? productDetails = freezed,
    Object? selectedAddOnItems = freezed,
    Object? groupValue = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      productDetails: productDetails == freezed
          ? _value.productDetails
          : productDetails // ignore: cast_nullable_to_non_nullable
              as ProductDetailsResponse?,
      selectedAddOnItems: selectedAddOnItems == freezed
          ? _value.selectedAddOnItems
          : selectedAddOnItems // ignore: cast_nullable_to_non_nullable
              as Set<AddOnItem>?,
      groupValue: groupValue == freezed
          ? _value.groupValue
          : groupValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.isLoading = false,
      this.productDetails,
      this.selectedAddOnItems,
      this.groupValue = 0});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final ProductDetailsResponse? productDetails;
  @override
  final Set<AddOnItem>? selectedAddOnItems;
  @JsonKey(defaultValue: 0)
  @override
  final int groupValue;

  @override
  String toString() {
    return 'ProductDetailsState(isLoading: $isLoading, productDetails: $productDetails, selectedAddOnItems: $selectedAddOnItems, groupValue: $groupValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.productDetails, productDetails) ||
                const DeepCollectionEquality()
                    .equals(other.productDetails, productDetails)) &&
            (identical(other.selectedAddOnItems, selectedAddOnItems) ||
                const DeepCollectionEquality()
                    .equals(other.selectedAddOnItems, selectedAddOnItems)) &&
            (identical(other.groupValue, groupValue) ||
                const DeepCollectionEquality()
                    .equals(other.groupValue, groupValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(productDetails) ^
      const DeepCollectionEquality().hash(selectedAddOnItems) ^
      const DeepCollectionEquality().hash(groupValue);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements ProductDetailsState {
  const factory _Default(
      {bool isLoading,
      ProductDetailsResponse? productDetails,
      Set<AddOnItem>? selectedAddOnItems,
      int groupValue}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  ProductDetailsResponse? get productDetails =>
      throw _privateConstructorUsedError;
  @override
  Set<AddOnItem>? get selectedAddOnItems => throw _privateConstructorUsedError;
  @override
  int get groupValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
