// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'localizationDataRequest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalizationDataRequest _$LocalizationDataRequestFromJson(
    Map<String, dynamic> json) {
  return _LocalizationDataRequest.fromJson(json);
}

/// @nodoc
class _$LocalizationDataRequestTearOff {
  const _$LocalizationDataRequestTearOff();

  _LocalizationDataRequest call({@JsonKey(includeIfNull: false) String? code}) {
    return _LocalizationDataRequest(
      code: code,
    );
  }

  LocalizationDataRequest fromJson(Map<String, Object> json) {
    return LocalizationDataRequest.fromJson(json);
  }
}

/// @nodoc
const $LocalizationDataRequest = _$LocalizationDataRequestTearOff();

/// @nodoc
mixin _$LocalizationDataRequest {
  @JsonKey(includeIfNull: false)
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizationDataRequestCopyWith<LocalizationDataRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationDataRequestCopyWith<$Res> {
  factory $LocalizationDataRequestCopyWith(LocalizationDataRequest value,
          $Res Function(LocalizationDataRequest) then) =
      _$LocalizationDataRequestCopyWithImpl<$Res>;
  $Res call({@JsonKey(includeIfNull: false) String? code});
}

/// @nodoc
class _$LocalizationDataRequestCopyWithImpl<$Res>
    implements $LocalizationDataRequestCopyWith<$Res> {
  _$LocalizationDataRequestCopyWithImpl(this._value, this._then);

  final LocalizationDataRequest _value;
  // ignore: unused_field
  final $Res Function(LocalizationDataRequest) _then;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LocalizationDataRequestCopyWith<$Res>
    implements $LocalizationDataRequestCopyWith<$Res> {
  factory _$LocalizationDataRequestCopyWith(_LocalizationDataRequest value,
          $Res Function(_LocalizationDataRequest) then) =
      __$LocalizationDataRequestCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(includeIfNull: false) String? code});
}

/// @nodoc
class __$LocalizationDataRequestCopyWithImpl<$Res>
    extends _$LocalizationDataRequestCopyWithImpl<$Res>
    implements _$LocalizationDataRequestCopyWith<$Res> {
  __$LocalizationDataRequestCopyWithImpl(_LocalizationDataRequest _value,
      $Res Function(_LocalizationDataRequest) _then)
      : super(_value, (v) => _then(v as _LocalizationDataRequest));

  @override
  _LocalizationDataRequest get _value =>
      super._value as _LocalizationDataRequest;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_LocalizationDataRequest(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalizationDataRequest extends _LocalizationDataRequest {
  const _$_LocalizationDataRequest({@JsonKey(includeIfNull: false) this.code})
      : super._();

  factory _$_LocalizationDataRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_LocalizationDataRequestFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final String? code;

  @override
  String toString() {
    return 'LocalizationDataRequest(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalizationDataRequest &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$LocalizationDataRequestCopyWith<_LocalizationDataRequest> get copyWith =>
      __$LocalizationDataRequestCopyWithImpl<_LocalizationDataRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocalizationDataRequestToJson(this);
  }
}

abstract class _LocalizationDataRequest extends LocalizationDataRequest {
  const factory _LocalizationDataRequest(
          {@JsonKey(includeIfNull: false) String? code}) =
      _$_LocalizationDataRequest;
  const _LocalizationDataRequest._() : super._();

  factory _LocalizationDataRequest.fromJson(Map<String, dynamic> json) =
      _$_LocalizationDataRequest.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocalizationDataRequestCopyWith<_LocalizationDataRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
