// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'htmlDataResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HtmlDataResponse _$HtmlDataResponseFromJson(Map<String, dynamic> json) {
  return _HtmlDataResponse.fromJson(json);
}

/// @nodoc
class _$HtmlDataResponseTearOff {
  const _$HtmlDataResponseTearOff();

  _HtmlDataResponse call({String? title = '', String? description = ''}) {
    return _HtmlDataResponse(
      title: title,
      description: description,
    );
  }

  HtmlDataResponse fromJson(Map<String, Object> json) {
    return HtmlDataResponse.fromJson(json);
  }
}

/// @nodoc
const $HtmlDataResponse = _$HtmlDataResponseTearOff();

/// @nodoc
mixin _$HtmlDataResponse {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HtmlDataResponseCopyWith<HtmlDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HtmlDataResponseCopyWith<$Res> {
  factory $HtmlDataResponseCopyWith(
          HtmlDataResponse value, $Res Function(HtmlDataResponse) then) =
      _$HtmlDataResponseCopyWithImpl<$Res>;
  $Res call({String? title, String? description});
}

/// @nodoc
class _$HtmlDataResponseCopyWithImpl<$Res>
    implements $HtmlDataResponseCopyWith<$Res> {
  _$HtmlDataResponseCopyWithImpl(this._value, this._then);

  final HtmlDataResponse _value;
  // ignore: unused_field
  final $Res Function(HtmlDataResponse) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$HtmlDataResponseCopyWith<$Res>
    implements $HtmlDataResponseCopyWith<$Res> {
  factory _$HtmlDataResponseCopyWith(
          _HtmlDataResponse value, $Res Function(_HtmlDataResponse) then) =
      __$HtmlDataResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? description});
}

/// @nodoc
class __$HtmlDataResponseCopyWithImpl<$Res>
    extends _$HtmlDataResponseCopyWithImpl<$Res>
    implements _$HtmlDataResponseCopyWith<$Res> {
  __$HtmlDataResponseCopyWithImpl(
      _HtmlDataResponse _value, $Res Function(_HtmlDataResponse) _then)
      : super(_value, (v) => _then(v as _HtmlDataResponse));

  @override
  _HtmlDataResponse get _value => super._value as _HtmlDataResponse;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_HtmlDataResponse(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HtmlDataResponse extends _HtmlDataResponse {
  const _$_HtmlDataResponse({this.title = '', this.description = ''})
      : super._();

  factory _$_HtmlDataResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_HtmlDataResponseFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String? title;
  @JsonKey(defaultValue: '')
  @override
  final String? description;

  @override
  String toString() {
    return 'HtmlDataResponse(title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HtmlDataResponse &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$HtmlDataResponseCopyWith<_HtmlDataResponse> get copyWith =>
      __$HtmlDataResponseCopyWithImpl<_HtmlDataResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HtmlDataResponseToJson(this);
  }
}

abstract class _HtmlDataResponse extends HtmlDataResponse {
  const factory _HtmlDataResponse({String? title, String? description}) =
      _$_HtmlDataResponse;
  const _HtmlDataResponse._() : super._();

  factory _HtmlDataResponse.fromJson(Map<String, dynamic> json) =
      _$_HtmlDataResponse.fromJson;

  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HtmlDataResponseCopyWith<_HtmlDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
