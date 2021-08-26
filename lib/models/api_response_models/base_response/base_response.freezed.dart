// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return _BaseResponse.fromJson(json);
}

/// @nodoc
class _$BaseResponseTearOff {
  const _$BaseResponseTearOff();

  _BaseResponse call({int? response_code, dynamic response_data = null}) {
    return _BaseResponse(
      response_code: response_code,
      response_data: response_data,
    );
  }

  BaseResponse fromJson(Map<String, Object> json) {
    return BaseResponse.fromJson(json);
  }
}

/// @nodoc
const $BaseResponse = _$BaseResponseTearOff();

/// @nodoc
mixin _$BaseResponse {
  int? get response_code => throw _privateConstructorUsedError;
  dynamic get response_data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseResponseCopyWith<BaseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseCopyWith<$Res> {
  factory $BaseResponseCopyWith(
          BaseResponse value, $Res Function(BaseResponse) then) =
      _$BaseResponseCopyWithImpl<$Res>;
  $Res call({int? response_code, dynamic response_data});
}

/// @nodoc
class _$BaseResponseCopyWithImpl<$Res> implements $BaseResponseCopyWith<$Res> {
  _$BaseResponseCopyWithImpl(this._value, this._then);

  final BaseResponse _value;
  // ignore: unused_field
  final $Res Function(BaseResponse) _then;

  @override
  $Res call({
    Object? response_code = freezed,
    Object? response_data = freezed,
  }) {
    return _then(_value.copyWith(
      response_code: response_code == freezed
          ? _value.response_code
          : response_code // ignore: cast_nullable_to_non_nullable
              as int?,
      response_data: response_data == freezed
          ? _value.response_data
          : response_data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$BaseResponseCopyWith<$Res>
    implements $BaseResponseCopyWith<$Res> {
  factory _$BaseResponseCopyWith(
          _BaseResponse value, $Res Function(_BaseResponse) then) =
      __$BaseResponseCopyWithImpl<$Res>;
  @override
  $Res call({int? response_code, dynamic response_data});
}

/// @nodoc
class __$BaseResponseCopyWithImpl<$Res> extends _$BaseResponseCopyWithImpl<$Res>
    implements _$BaseResponseCopyWith<$Res> {
  __$BaseResponseCopyWithImpl(
      _BaseResponse _value, $Res Function(_BaseResponse) _then)
      : super(_value, (v) => _then(v as _BaseResponse));

  @override
  _BaseResponse get _value => super._value as _BaseResponse;

  @override
  $Res call({
    Object? response_code = freezed,
    Object? response_data = freezed,
  }) {
    return _then(_BaseResponse(
      response_code: response_code == freezed
          ? _value.response_code
          : response_code // ignore: cast_nullable_to_non_nullable
              as int?,
      response_data: response_data == freezed
          ? _value.response_data
          : response_data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BaseResponse extends _BaseResponse {
  const _$_BaseResponse({this.response_code, this.response_data = null})
      : super._();

  factory _$_BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BaseResponseFromJson(json);

  @override
  final int? response_code;
  @JsonKey(defaultValue: null)
  @override
  final dynamic response_data;

  @override
  String toString() {
    return 'BaseResponse(response_code: $response_code, response_data: $response_data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BaseResponse &&
            (identical(other.response_code, response_code) ||
                const DeepCollectionEquality()
                    .equals(other.response_code, response_code)) &&
            (identical(other.response_data, response_data) ||
                const DeepCollectionEquality()
                    .equals(other.response_data, response_data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(response_code) ^
      const DeepCollectionEquality().hash(response_data);

  @JsonKey(ignore: true)
  @override
  _$BaseResponseCopyWith<_BaseResponse> get copyWith =>
      __$BaseResponseCopyWithImpl<_BaseResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BaseResponseToJson(this);
  }
}

abstract class _BaseResponse extends BaseResponse {
  const factory _BaseResponse({int? response_code, dynamic response_data}) =
      _$_BaseResponse;
  const _BaseResponse._() : super._();

  factory _BaseResponse.fromJson(Map<String, dynamic> json) =
      _$_BaseResponse.fromJson;

  @override
  int? get response_code => throw _privateConstructorUsedError;
  @override
  dynamic get response_data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BaseResponseCopyWith<_BaseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
