// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'otp_verify_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtpVerifyResponse _$OtpVerifyResponseFromJson(Map<String, dynamic> json) {
  return _OtpVerifyResponse.fromJson(json);
}

/// @nodoc
class _$OtpVerifyResponseTearOff {
  const _$OtpVerifyResponseTearOff();

  _OtpVerifyResponse call(
      {String? token,
      String? role,
      String? id,
      String? franchiseId,
      String? vendorId}) {
    return _OtpVerifyResponse(
      token: token,
      role: role,
      id: id,
      franchiseId: franchiseId,
      vendorId: vendorId,
    );
  }

  OtpVerifyResponse fromJson(Map<String, Object> json) {
    return OtpVerifyResponse.fromJson(json);
  }
}

/// @nodoc
const $OtpVerifyResponse = _$OtpVerifyResponseTearOff();

/// @nodoc
mixin _$OtpVerifyResponse {
  String? get token => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get franchiseId => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtpVerifyResponseCopyWith<OtpVerifyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerifyResponseCopyWith<$Res> {
  factory $OtpVerifyResponseCopyWith(
          OtpVerifyResponse value, $Res Function(OtpVerifyResponse) then) =
      _$OtpVerifyResponseCopyWithImpl<$Res>;
  $Res call(
      {String? token,
      String? role,
      String? id,
      String? franchiseId,
      String? vendorId});
}

/// @nodoc
class _$OtpVerifyResponseCopyWithImpl<$Res>
    implements $OtpVerifyResponseCopyWith<$Res> {
  _$OtpVerifyResponseCopyWithImpl(this._value, this._then);

  final OtpVerifyResponse _value;
  // ignore: unused_field
  final $Res Function(OtpVerifyResponse) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? role = freezed,
    Object? id = freezed,
    Object? franchiseId = freezed,
    Object? vendorId = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$OtpVerifyResponseCopyWith<$Res>
    implements $OtpVerifyResponseCopyWith<$Res> {
  factory _$OtpVerifyResponseCopyWith(
          _OtpVerifyResponse value, $Res Function(_OtpVerifyResponse) then) =
      __$OtpVerifyResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? token,
      String? role,
      String? id,
      String? franchiseId,
      String? vendorId});
}

/// @nodoc
class __$OtpVerifyResponseCopyWithImpl<$Res>
    extends _$OtpVerifyResponseCopyWithImpl<$Res>
    implements _$OtpVerifyResponseCopyWith<$Res> {
  __$OtpVerifyResponseCopyWithImpl(
      _OtpVerifyResponse _value, $Res Function(_OtpVerifyResponse) _then)
      : super(_value, (v) => _then(v as _OtpVerifyResponse));

  @override
  _OtpVerifyResponse get _value => super._value as _OtpVerifyResponse;

  @override
  $Res call({
    Object? token = freezed,
    Object? role = freezed,
    Object? id = freezed,
    Object? franchiseId = freezed,
    Object? vendorId = freezed,
  }) {
    return _then(_OtpVerifyResponse(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OtpVerifyResponse extends _OtpVerifyResponse {
  const _$_OtpVerifyResponse(
      {this.token, this.role, this.id, this.franchiseId, this.vendorId})
      : super._();

  factory _$_OtpVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_OtpVerifyResponseFromJson(json);

  @override
  final String? token;
  @override
  final String? role;
  @override
  final String? id;
  @override
  final String? franchiseId;
  @override
  final String? vendorId;

  @override
  String toString() {
    return 'OtpVerifyResponse(token: $token, role: $role, id: $id, franchiseId: $franchiseId, vendorId: $vendorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OtpVerifyResponse &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.franchiseId, franchiseId) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseId, franchiseId)) &&
            (identical(other.vendorId, vendorId) ||
                const DeepCollectionEquality()
                    .equals(other.vendorId, vendorId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(franchiseId) ^
      const DeepCollectionEquality().hash(vendorId);

  @JsonKey(ignore: true)
  @override
  _$OtpVerifyResponseCopyWith<_OtpVerifyResponse> get copyWith =>
      __$OtpVerifyResponseCopyWithImpl<_OtpVerifyResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OtpVerifyResponseToJson(this);
  }
}

abstract class _OtpVerifyResponse extends OtpVerifyResponse {
  const factory _OtpVerifyResponse(
      {String? token,
      String? role,
      String? id,
      String? franchiseId,
      String? vendorId}) = _$_OtpVerifyResponse;
  const _OtpVerifyResponse._() : super._();

  factory _OtpVerifyResponse.fromJson(Map<String, dynamic> json) =
      _$_OtpVerifyResponse.fromJson;

  @override
  String? get token => throw _privateConstructorUsedError;
  @override
  String? get role => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get franchiseId => throw _privateConstructorUsedError;
  @override
  String? get vendorId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OtpVerifyResponseCopyWith<_OtpVerifyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
