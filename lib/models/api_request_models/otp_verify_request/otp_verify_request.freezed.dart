// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'otp_verify_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtpVerifyRequest _$OtpVerifyRequestFromJson(Map<String, dynamic> json) {
  return _OtpVerifyRequest.fromJson(json);
}

/// @nodoc
class _$OtpVerifyRequestTearOff {
  const _$OtpVerifyRequestTearOff();

  _OtpVerifyRequest call(
      {int? tableNumber, int? franchiseCode, String? password}) {
    return _OtpVerifyRequest(
      tableNumber: tableNumber,
      franchiseCode: franchiseCode,
      password: password,
    );
  }

  OtpVerifyRequest fromJson(Map<String, Object> json) {
    return OtpVerifyRequest.fromJson(json);
  }
}

/// @nodoc
const $OtpVerifyRequest = _$OtpVerifyRequestTearOff();

/// @nodoc
mixin _$OtpVerifyRequest {
  int? get tableNumber => throw _privateConstructorUsedError;
  int? get franchiseCode => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtpVerifyRequestCopyWith<OtpVerifyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerifyRequestCopyWith<$Res> {
  factory $OtpVerifyRequestCopyWith(
          OtpVerifyRequest value, $Res Function(OtpVerifyRequest) then) =
      _$OtpVerifyRequestCopyWithImpl<$Res>;
  $Res call({int? tableNumber, int? franchiseCode, String? password});
}

/// @nodoc
class _$OtpVerifyRequestCopyWithImpl<$Res>
    implements $OtpVerifyRequestCopyWith<$Res> {
  _$OtpVerifyRequestCopyWithImpl(this._value, this._then);

  final OtpVerifyRequest _value;
  // ignore: unused_field
  final $Res Function(OtpVerifyRequest) _then;

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
abstract class _$OtpVerifyRequestCopyWith<$Res>
    implements $OtpVerifyRequestCopyWith<$Res> {
  factory _$OtpVerifyRequestCopyWith(
          _OtpVerifyRequest value, $Res Function(_OtpVerifyRequest) then) =
      __$OtpVerifyRequestCopyWithImpl<$Res>;
  @override
  $Res call({int? tableNumber, int? franchiseCode, String? password});
}

/// @nodoc
class __$OtpVerifyRequestCopyWithImpl<$Res>
    extends _$OtpVerifyRequestCopyWithImpl<$Res>
    implements _$OtpVerifyRequestCopyWith<$Res> {
  __$OtpVerifyRequestCopyWithImpl(
      _OtpVerifyRequest _value, $Res Function(_OtpVerifyRequest) _then)
      : super(_value, (v) => _then(v as _OtpVerifyRequest));

  @override
  _OtpVerifyRequest get _value => super._value as _OtpVerifyRequest;

  @override
  $Res call({
    Object? tableNumber = freezed,
    Object? franchiseCode = freezed,
    Object? password = freezed,
  }) {
    return _then(_OtpVerifyRequest(
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
class _$_OtpVerifyRequest extends _OtpVerifyRequest {
  const _$_OtpVerifyRequest(
      {this.tableNumber, this.franchiseCode, this.password})
      : super._();

  factory _$_OtpVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_OtpVerifyRequestFromJson(json);

  @override
  final int? tableNumber;
  @override
  final int? franchiseCode;
  @override
  final String? password;

  @override
  String toString() {
    return 'OtpVerifyRequest(tableNumber: $tableNumber, franchiseCode: $franchiseCode, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OtpVerifyRequest &&
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
  _$OtpVerifyRequestCopyWith<_OtpVerifyRequest> get copyWith =>
      __$OtpVerifyRequestCopyWithImpl<_OtpVerifyRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OtpVerifyRequestToJson(this);
  }
}

abstract class _OtpVerifyRequest extends OtpVerifyRequest {
  const factory _OtpVerifyRequest(
      {int? tableNumber,
      int? franchiseCode,
      String? password}) = _$_OtpVerifyRequest;
  const _OtpVerifyRequest._() : super._();

  factory _OtpVerifyRequest.fromJson(Map<String, dynamic> json) =
      _$_OtpVerifyRequest.fromJson;

  @override
  int? get tableNumber => throw _privateConstructorUsedError;
  @override
  int? get franchiseCode => throw _privateConstructorUsedError;
  @override
  String? get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OtpVerifyRequestCopyWith<_OtpVerifyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
