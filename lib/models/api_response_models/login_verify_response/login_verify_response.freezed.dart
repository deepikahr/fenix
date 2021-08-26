// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_verify_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginVerifyResponse _$LoginVerifyResponseFromJson(Map<String, dynamic> json) {
  return _LoginVerifyResponse.fromJson(json);
}

/// @nodoc
class _$LoginVerifyResponseTearOff {
  const _$LoginVerifyResponseTearOff();

  _LoginVerifyResponse call(
      {String? token,
      String? role,
      String? id,
      String? franchiseId,
      String? vendorId}) {
    return _LoginVerifyResponse(
      token: token,
      role: role,
      id: id,
      franchiseId: franchiseId,
      vendorId: vendorId,
    );
  }

  LoginVerifyResponse fromJson(Map<String, Object> json) {
    return LoginVerifyResponse.fromJson(json);
  }
}

/// @nodoc
const $LoginVerifyResponse = _$LoginVerifyResponseTearOff();

/// @nodoc
mixin _$LoginVerifyResponse {
  String? get token => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get franchiseId => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginVerifyResponseCopyWith<LoginVerifyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginVerifyResponseCopyWith<$Res> {
  factory $LoginVerifyResponseCopyWith(
          LoginVerifyResponse value, $Res Function(LoginVerifyResponse) then) =
      _$LoginVerifyResponseCopyWithImpl<$Res>;
  $Res call(
      {String? token,
      String? role,
      String? id,
      String? franchiseId,
      String? vendorId});
}

/// @nodoc
class _$LoginVerifyResponseCopyWithImpl<$Res>
    implements $LoginVerifyResponseCopyWith<$Res> {
  _$LoginVerifyResponseCopyWithImpl(this._value, this._then);

  final LoginVerifyResponse _value;
  // ignore: unused_field
  final $Res Function(LoginVerifyResponse) _then;

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
abstract class _$LoginVerifyResponseCopyWith<$Res>
    implements $LoginVerifyResponseCopyWith<$Res> {
  factory _$LoginVerifyResponseCopyWith(_LoginVerifyResponse value,
          $Res Function(_LoginVerifyResponse) then) =
      __$LoginVerifyResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? token,
      String? role,
      String? id,
      String? franchiseId,
      String? vendorId});
}

/// @nodoc
class __$LoginVerifyResponseCopyWithImpl<$Res>
    extends _$LoginVerifyResponseCopyWithImpl<$Res>
    implements _$LoginVerifyResponseCopyWith<$Res> {
  __$LoginVerifyResponseCopyWithImpl(
      _LoginVerifyResponse _value, $Res Function(_LoginVerifyResponse) _then)
      : super(_value, (v) => _then(v as _LoginVerifyResponse));

  @override
  _LoginVerifyResponse get _value => super._value as _LoginVerifyResponse;

  @override
  $Res call({
    Object? token = freezed,
    Object? role = freezed,
    Object? id = freezed,
    Object? franchiseId = freezed,
    Object? vendorId = freezed,
  }) {
    return _then(_LoginVerifyResponse(
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
class _$_LoginVerifyResponse extends _LoginVerifyResponse {
  const _$_LoginVerifyResponse(
      {this.token, this.role, this.id, this.franchiseId, this.vendorId})
      : super._();

  factory _$_LoginVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_LoginVerifyResponseFromJson(json);

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
    return 'LoginVerifyResponse(token: $token, role: $role, id: $id, franchiseId: $franchiseId, vendorId: $vendorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginVerifyResponse &&
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
  _$LoginVerifyResponseCopyWith<_LoginVerifyResponse> get copyWith =>
      __$LoginVerifyResponseCopyWithImpl<_LoginVerifyResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LoginVerifyResponseToJson(this);
  }
}

abstract class _LoginVerifyResponse extends LoginVerifyResponse {
  const factory _LoginVerifyResponse(
      {String? token,
      String? role,
      String? id,
      String? franchiseId,
      String? vendorId}) = _$_LoginVerifyResponse;
  const _LoginVerifyResponse._() : super._();

  factory _LoginVerifyResponse.fromJson(Map<String, dynamic> json) =
      _$_LoginVerifyResponse.fromJson;

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
  _$LoginVerifyResponseCopyWith<_LoginVerifyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
