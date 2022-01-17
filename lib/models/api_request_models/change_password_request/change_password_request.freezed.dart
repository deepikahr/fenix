// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'change_password_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChangePasswordRequest _$ChangePasswordRequestFromJson(
    Map<String, dynamic> json) {
  return _ChangePasswordRequest.fromJson(json);
}

/// @nodoc
class _$ChangePasswordRequestTearOff {
  const _$ChangePasswordRequestTearOff();

  _ChangePasswordRequest call({int? currentPassword, int? newPassword}) {
    return _ChangePasswordRequest(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }

  ChangePasswordRequest fromJson(Map<String, Object> json) {
    return ChangePasswordRequest.fromJson(json);
  }
}

/// @nodoc
const $ChangePasswordRequest = _$ChangePasswordRequestTearOff();

/// @nodoc
mixin _$ChangePasswordRequest {
  int? get currentPassword => throw _privateConstructorUsedError;
  int? get newPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePasswordRequestCopyWith<ChangePasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordRequestCopyWith<$Res> {
  factory $ChangePasswordRequestCopyWith(ChangePasswordRequest value,
          $Res Function(ChangePasswordRequest) then) =
      _$ChangePasswordRequestCopyWithImpl<$Res>;
  $Res call({int? currentPassword, int? newPassword});
}

/// @nodoc
class _$ChangePasswordRequestCopyWithImpl<$Res>
    implements $ChangePasswordRequestCopyWith<$Res> {
  _$ChangePasswordRequestCopyWithImpl(this._value, this._then);

  final ChangePasswordRequest _value;
  // ignore: unused_field
  final $Res Function(ChangePasswordRequest) _then;

  @override
  $Res call({
    Object? currentPassword = freezed,
    Object? newPassword = freezed,
  }) {
    return _then(_value.copyWith(
      currentPassword: currentPassword == freezed
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as int?,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ChangePasswordRequestCopyWith<$Res>
    implements $ChangePasswordRequestCopyWith<$Res> {
  factory _$ChangePasswordRequestCopyWith(_ChangePasswordRequest value,
          $Res Function(_ChangePasswordRequest) then) =
      __$ChangePasswordRequestCopyWithImpl<$Res>;
  @override
  $Res call({int? currentPassword, int? newPassword});
}

/// @nodoc
class __$ChangePasswordRequestCopyWithImpl<$Res>
    extends _$ChangePasswordRequestCopyWithImpl<$Res>
    implements _$ChangePasswordRequestCopyWith<$Res> {
  __$ChangePasswordRequestCopyWithImpl(_ChangePasswordRequest _value,
      $Res Function(_ChangePasswordRequest) _then)
      : super(_value, (v) => _then(v as _ChangePasswordRequest));

  @override
  _ChangePasswordRequest get _value => super._value as _ChangePasswordRequest;

  @override
  $Res call({
    Object? currentPassword = freezed,
    Object? newPassword = freezed,
  }) {
    return _then(_ChangePasswordRequest(
      currentPassword: currentPassword == freezed
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as int?,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChangePasswordRequest extends _ChangePasswordRequest {
  const _$_ChangePasswordRequest({this.currentPassword, this.newPassword})
      : super._();

  factory _$_ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_ChangePasswordRequestFromJson(json);

  @override
  final int? currentPassword;
  @override
  final int? newPassword;

  @override
  String toString() {
    return 'ChangePasswordRequest(currentPassword: $currentPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangePasswordRequest &&
            (identical(other.currentPassword, currentPassword) ||
                const DeepCollectionEquality()
                    .equals(other.currentPassword, currentPassword)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentPassword) ^
      const DeepCollectionEquality().hash(newPassword);

  @JsonKey(ignore: true)
  @override
  _$ChangePasswordRequestCopyWith<_ChangePasswordRequest> get copyWith =>
      __$ChangePasswordRequestCopyWithImpl<_ChangePasswordRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChangePasswordRequestToJson(this);
  }
}

abstract class _ChangePasswordRequest extends ChangePasswordRequest {
  const factory _ChangePasswordRequest(
      {int? currentPassword, int? newPassword}) = _$_ChangePasswordRequest;
  const _ChangePasswordRequest._() : super._();

  factory _ChangePasswordRequest.fromJson(Map<String, dynamic> json) =
      _$_ChangePasswordRequest.fromJson;

  @override
  int? get currentPassword => throw _privateConstructorUsedError;
  @override
  int? get newPassword => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChangePasswordRequestCopyWith<_ChangePasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
