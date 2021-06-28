// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_verify_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginVerifyRequest _$LoginVerifyRequestFromJson(Map<String, dynamic> json) {
  return _LoginVerifyRequest.fromJson(json);
}

/// @nodoc
class _$LoginVerifyRequestTearOff {
  const _$LoginVerifyRequestTearOff();

  _LoginVerifyRequest call(
      {int? tableNumber, int? franchiseCode, String? password}) {
    return _LoginVerifyRequest(
      tableNumber: tableNumber,
      franchiseCode: franchiseCode,
      password: password,
    );
  }

  LoginVerifyRequest fromJson(Map<String, Object> json) {
    return LoginVerifyRequest.fromJson(json);
  }
}

/// @nodoc
const $LoginVerifyRequest = _$LoginVerifyRequestTearOff();

/// @nodoc
mixin _$LoginVerifyRequest {
  int? get tableNumber => throw _privateConstructorUsedError;
  int? get franchiseCode => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginVerifyRequestCopyWith<LoginVerifyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginVerifyRequestCopyWith<$Res> {
  factory $LoginVerifyRequestCopyWith(
          LoginVerifyRequest value, $Res Function(LoginVerifyRequest) then) =
      _$LoginVerifyRequestCopyWithImpl<$Res>;
  $Res call({int? tableNumber, int? franchiseCode, String? password});
}

/// @nodoc
class _$LoginVerifyRequestCopyWithImpl<$Res>
    implements $LoginVerifyRequestCopyWith<$Res> {
  _$LoginVerifyRequestCopyWithImpl(this._value, this._then);

  final LoginVerifyRequest _value;
  // ignore: unused_field
  final $Res Function(LoginVerifyRequest) _then;

  @override
  $Res call({
    Object? tableNumber = freezed,
    Object? franchiseCode = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      franchiseCode: franchiseCode == freezed
          ? _value.franchiseCode
          : franchiseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LoginVerifyRequestCopyWith<$Res>
    implements $LoginVerifyRequestCopyWith<$Res> {
  factory _$LoginVerifyRequestCopyWith(
          _LoginVerifyRequest value, $Res Function(_LoginVerifyRequest) then) =
      __$LoginVerifyRequestCopyWithImpl<$Res>;
  @override
  $Res call({int? tableNumber, int? franchiseCode, String? password});
}

/// @nodoc
class __$LoginVerifyRequestCopyWithImpl<$Res>
    extends _$LoginVerifyRequestCopyWithImpl<$Res>
    implements _$LoginVerifyRequestCopyWith<$Res> {
  __$LoginVerifyRequestCopyWithImpl(
      _LoginVerifyRequest _value, $Res Function(_LoginVerifyRequest) _then)
      : super(_value, (v) => _then(v as _LoginVerifyRequest));

  @override
  _LoginVerifyRequest get _value => super._value as _LoginVerifyRequest;

  @override
  $Res call({
    Object? tableNumber = freezed,
    Object? franchiseCode = freezed,
    Object? password = freezed,
  }) {
    return _then(_LoginVerifyRequest(
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      franchiseCode: franchiseCode == freezed
          ? _value.franchiseCode
          : franchiseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginVerifyRequest extends _LoginVerifyRequest {
  const _$_LoginVerifyRequest(
      {this.tableNumber, this.franchiseCode, this.password})
      : super._();

  factory _$_LoginVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_LoginVerifyRequestFromJson(json);

  @override
  final int? tableNumber;
  @override
  final int? franchiseCode;
  @override
  final String? password;

  @override
  String toString() {
    return 'LoginVerifyRequest(tableNumber: $tableNumber, franchiseCode: $franchiseCode, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginVerifyRequest &&
            (identical(other.tableNumber, tableNumber) ||
                const DeepCollectionEquality()
                    .equals(other.tableNumber, tableNumber)) &&
            (identical(other.franchiseCode, franchiseCode) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseCode, franchiseCode)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tableNumber) ^
      const DeepCollectionEquality().hash(franchiseCode) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$LoginVerifyRequestCopyWith<_LoginVerifyRequest> get copyWith =>
      __$LoginVerifyRequestCopyWithImpl<_LoginVerifyRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LoginVerifyRequestToJson(this);
  }
}

abstract class _LoginVerifyRequest extends LoginVerifyRequest {
  const factory _LoginVerifyRequest(
      {int? tableNumber,
      int? franchiseCode,
      String? password}) = _$_LoginVerifyRequest;
  const _LoginVerifyRequest._() : super._();

  factory _LoginVerifyRequest.fromJson(Map<String, dynamic> json) =
      _$_LoginVerifyRequest.fromJson;

  @override
  int? get tableNumber => throw _privateConstructorUsedError;
  @override
  int? get franchiseCode => throw _privateConstructorUsedError;
  @override
  String? get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginVerifyRequestCopyWith<_LoginVerifyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
