// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'franchise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FranchiseModel _$FranchiseModelFromJson(Map<String, dynamic> json) {
  return _FranchiseModel.fromJson(json);
}

/// @nodoc
class _$FranchiseModelTearOff {
  const _$FranchiseModelTearOff();

  _FranchiseModel call(
      {@JsonKey(name: '_id') String? id,
      String? nif,
      String? restaurantName,
      String? contactNumber,
      String? franchiseName,
      FranchiseAddress? franchiseAddress}) {
    return _FranchiseModel(
      id: id,
      nif: nif,
      restaurantName: restaurantName,
      contactNumber: contactNumber,
      franchiseName: franchiseName,
      franchiseAddress: franchiseAddress,
    );
  }

  FranchiseModel fromJson(Map<String, Object> json) {
    return FranchiseModel.fromJson(json);
  }
}

/// @nodoc
const $FranchiseModel = _$FranchiseModelTearOff();

/// @nodoc
mixin _$FranchiseModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get nif => throw _privateConstructorUsedError;
  String? get restaurantName => throw _privateConstructorUsedError;
  String? get contactNumber => throw _privateConstructorUsedError;
  String? get franchiseName => throw _privateConstructorUsedError;
  FranchiseAddress? get franchiseAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FranchiseModelCopyWith<FranchiseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FranchiseModelCopyWith<$Res> {
  factory $FranchiseModelCopyWith(
          FranchiseModel value, $Res Function(FranchiseModel) then) =
      _$FranchiseModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? nif,
      String? restaurantName,
      String? contactNumber,
      String? franchiseName,
      FranchiseAddress? franchiseAddress});

  $FranchiseAddressCopyWith<$Res>? get franchiseAddress;
}

/// @nodoc
class _$FranchiseModelCopyWithImpl<$Res>
    implements $FranchiseModelCopyWith<$Res> {
  _$FranchiseModelCopyWithImpl(this._value, this._then);

  final FranchiseModel _value;
  // ignore: unused_field
  final $Res Function(FranchiseModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nif = freezed,
    Object? restaurantName = freezed,
    Object? contactNumber = freezed,
    Object? franchiseName = freezed,
    Object? franchiseAddress = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nif: nif == freezed
          ? _value.nif
          : nif // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: contactNumber == freezed
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseAddress: franchiseAddress == freezed
          ? _value.franchiseAddress
          : franchiseAddress // ignore: cast_nullable_to_non_nullable
              as FranchiseAddress?,
    ));
  }

  @override
  $FranchiseAddressCopyWith<$Res>? get franchiseAddress {
    if (_value.franchiseAddress == null) {
      return null;
    }

    return $FranchiseAddressCopyWith<$Res>(_value.franchiseAddress!, (value) {
      return _then(_value.copyWith(franchiseAddress: value));
    });
  }
}

/// @nodoc
abstract class _$FranchiseModelCopyWith<$Res>
    implements $FranchiseModelCopyWith<$Res> {
  factory _$FranchiseModelCopyWith(
          _FranchiseModel value, $Res Function(_FranchiseModel) then) =
      __$FranchiseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? nif,
      String? restaurantName,
      String? contactNumber,
      String? franchiseName,
      FranchiseAddress? franchiseAddress});

  @override
  $FranchiseAddressCopyWith<$Res>? get franchiseAddress;
}

/// @nodoc
class __$FranchiseModelCopyWithImpl<$Res>
    extends _$FranchiseModelCopyWithImpl<$Res>
    implements _$FranchiseModelCopyWith<$Res> {
  __$FranchiseModelCopyWithImpl(
      _FranchiseModel _value, $Res Function(_FranchiseModel) _then)
      : super(_value, (v) => _then(v as _FranchiseModel));

  @override
  _FranchiseModel get _value => super._value as _FranchiseModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? nif = freezed,
    Object? restaurantName = freezed,
    Object? contactNumber = freezed,
    Object? franchiseName = freezed,
    Object? franchiseAddress = freezed,
  }) {
    return _then(_FranchiseModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nif: nif == freezed
          ? _value.nif
          : nif // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: contactNumber == freezed
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseAddress: franchiseAddress == freezed
          ? _value.franchiseAddress
          : franchiseAddress // ignore: cast_nullable_to_non_nullable
              as FranchiseAddress?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FranchiseModel extends _FranchiseModel {
  const _$_FranchiseModel(
      {@JsonKey(name: '_id') this.id,
      this.nif,
      this.restaurantName,
      this.contactNumber,
      this.franchiseName,
      this.franchiseAddress})
      : super._();

  factory _$_FranchiseModel.fromJson(Map<String, dynamic> json) =>
      _$_$_FranchiseModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? nif;
  @override
  final String? restaurantName;
  @override
  final String? contactNumber;
  @override
  final String? franchiseName;
  @override
  final FranchiseAddress? franchiseAddress;

  @override
  String toString() {
    return 'FranchiseModel(id: $id, nif: $nif, restaurantName: $restaurantName, contactNumber: $contactNumber, franchiseName: $franchiseName, franchiseAddress: $franchiseAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FranchiseModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nif, nif) ||
                const DeepCollectionEquality().equals(other.nif, nif)) &&
            (identical(other.restaurantName, restaurantName) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantName, restaurantName)) &&
            (identical(other.contactNumber, contactNumber) ||
                const DeepCollectionEquality()
                    .equals(other.contactNumber, contactNumber)) &&
            (identical(other.franchiseName, franchiseName) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseName, franchiseName)) &&
            (identical(other.franchiseAddress, franchiseAddress) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseAddress, franchiseAddress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nif) ^
      const DeepCollectionEquality().hash(restaurantName) ^
      const DeepCollectionEquality().hash(contactNumber) ^
      const DeepCollectionEquality().hash(franchiseName) ^
      const DeepCollectionEquality().hash(franchiseAddress);

  @JsonKey(ignore: true)
  @override
  _$FranchiseModelCopyWith<_FranchiseModel> get copyWith =>
      __$FranchiseModelCopyWithImpl<_FranchiseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FranchiseModelToJson(this);
  }
}

abstract class _FranchiseModel extends FranchiseModel {
  const factory _FranchiseModel(
      {@JsonKey(name: '_id') String? id,
      String? nif,
      String? restaurantName,
      String? contactNumber,
      String? franchiseName,
      FranchiseAddress? franchiseAddress}) = _$_FranchiseModel;
  const _FranchiseModel._() : super._();

  factory _FranchiseModel.fromJson(Map<String, dynamic> json) =
      _$_FranchiseModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get nif => throw _privateConstructorUsedError;
  @override
  String? get restaurantName => throw _privateConstructorUsedError;
  @override
  String? get contactNumber => throw _privateConstructorUsedError;
  @override
  String? get franchiseName => throw _privateConstructorUsedError;
  @override
  FranchiseAddress? get franchiseAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FranchiseModelCopyWith<_FranchiseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

FranchiseAddress _$FranchiseAddressFromJson(Map<String, dynamic> json) {
  return _FranchiseAddress.fromJson(json);
}

/// @nodoc
class _$FranchiseAddressTearOff {
  const _$FranchiseAddressTearOff();

  _FranchiseAddress call(
      {String? city,
      String? country,
      String? state,
      String? address,
      String? postalCode}) {
    return _FranchiseAddress(
      city: city,
      country: country,
      state: state,
      address: address,
      postalCode: postalCode,
    );
  }

  FranchiseAddress fromJson(Map<String, Object> json) {
    return FranchiseAddress.fromJson(json);
  }
}

/// @nodoc
const $FranchiseAddress = _$FranchiseAddressTearOff();

/// @nodoc
mixin _$FranchiseAddress {
  String? get city => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FranchiseAddressCopyWith<FranchiseAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FranchiseAddressCopyWith<$Res> {
  factory $FranchiseAddressCopyWith(
          FranchiseAddress value, $Res Function(FranchiseAddress) then) =
      _$FranchiseAddressCopyWithImpl<$Res>;
  $Res call(
      {String? city,
      String? country,
      String? state,
      String? address,
      String? postalCode});
}

/// @nodoc
class _$FranchiseAddressCopyWithImpl<$Res>
    implements $FranchiseAddressCopyWith<$Res> {
  _$FranchiseAddressCopyWithImpl(this._value, this._then);

  final FranchiseAddress _value;
  // ignore: unused_field
  final $Res Function(FranchiseAddress) _then;

  @override
  $Res call({
    Object? city = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? address = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_value.copyWith(
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$FranchiseAddressCopyWith<$Res>
    implements $FranchiseAddressCopyWith<$Res> {
  factory _$FranchiseAddressCopyWith(
          _FranchiseAddress value, $Res Function(_FranchiseAddress) then) =
      __$FranchiseAddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? city,
      String? country,
      String? state,
      String? address,
      String? postalCode});
}

/// @nodoc
class __$FranchiseAddressCopyWithImpl<$Res>
    extends _$FranchiseAddressCopyWithImpl<$Res>
    implements _$FranchiseAddressCopyWith<$Res> {
  __$FranchiseAddressCopyWithImpl(
      _FranchiseAddress _value, $Res Function(_FranchiseAddress) _then)
      : super(_value, (v) => _then(v as _FranchiseAddress));

  @override
  _FranchiseAddress get _value => super._value as _FranchiseAddress;

  @override
  $Res call({
    Object? city = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? address = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_FranchiseAddress(
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FranchiseAddress extends _FranchiseAddress {
  const _$_FranchiseAddress(
      {this.city, this.country, this.state, this.address, this.postalCode})
      : super._();

  factory _$_FranchiseAddress.fromJson(Map<String, dynamic> json) =>
      _$_$_FranchiseAddressFromJson(json);

  @override
  final String? city;
  @override
  final String? country;
  @override
  final String? state;
  @override
  final String? address;
  @override
  final String? postalCode;

  @override
  String toString() {
    return 'FranchiseAddress(city: $city, country: $country, state: $state, address: $address, postalCode: $postalCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FranchiseAddress &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(postalCode);

  @JsonKey(ignore: true)
  @override
  _$FranchiseAddressCopyWith<_FranchiseAddress> get copyWith =>
      __$FranchiseAddressCopyWithImpl<_FranchiseAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FranchiseAddressToJson(this);
  }
}

abstract class _FranchiseAddress extends FranchiseAddress {
  const factory _FranchiseAddress(
      {String? city,
      String? country,
      String? state,
      String? address,
      String? postalCode}) = _$_FranchiseAddress;
  const _FranchiseAddress._() : super._();

  factory _FranchiseAddress.fromJson(Map<String, dynamic> json) =
      _$_FranchiseAddress.fromJson;

  @override
  String? get city => throw _privateConstructorUsedError;
  @override
  String? get country => throw _privateConstructorUsedError;
  @override
  String? get state => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  String? get postalCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FranchiseAddressCopyWith<_FranchiseAddress> get copyWith =>
      throw _privateConstructorUsedError;
}
