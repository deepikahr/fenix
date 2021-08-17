// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'language_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LanguageResponse _$LanguageResponseFromJson(Map<String, dynamic> json) {
  return _LanguageResponse.fromJson(json);
}

/// @nodoc
class _$LanguageResponseTearOff {
  const _$LanguageResponseTearOff();

  _LanguageResponse call(
      {@JsonKey(name: '_id') String? id,
      int? isDefault,
      String? languageCode,
      String? languageName,
      String? flagCode}) {
    return _LanguageResponse(
      id: id,
      isDefault: isDefault,
      languageCode: languageCode,
      languageName: languageName,
      flagCode: flagCode,
    );
  }

  LanguageResponse fromJson(Map<String, Object> json) {
    return LanguageResponse.fromJson(json);
  }
}

/// @nodoc
const $LanguageResponse = _$LanguageResponseTearOff();

/// @nodoc
mixin _$LanguageResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  int? get isDefault => throw _privateConstructorUsedError;
  String? get languageCode => throw _privateConstructorUsedError;
  String? get languageName => throw _privateConstructorUsedError;
  String? get flagCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageResponseCopyWith<LanguageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageResponseCopyWith<$Res> {
  factory $LanguageResponseCopyWith(
          LanguageResponse value, $Res Function(LanguageResponse) then) =
      _$LanguageResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      int? isDefault,
      String? languageCode,
      String? languageName,
      String? flagCode});
}

/// @nodoc
class _$LanguageResponseCopyWithImpl<$Res>
    implements $LanguageResponseCopyWith<$Res> {
  _$LanguageResponseCopyWithImpl(this._value, this._then);

  final LanguageResponse _value;
  // ignore: unused_field
  final $Res Function(LanguageResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? isDefault = freezed,
    Object? languageCode = freezed,
    Object? languageName = freezed,
    Object? flagCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as int?,
      languageCode: languageCode == freezed
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      languageName: languageName == freezed
          ? _value.languageName
          : languageName // ignore: cast_nullable_to_non_nullable
              as String?,
      flagCode: flagCode == freezed
          ? _value.flagCode
          : flagCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LanguageResponseCopyWith<$Res>
    implements $LanguageResponseCopyWith<$Res> {
  factory _$LanguageResponseCopyWith(
          _LanguageResponse value, $Res Function(_LanguageResponse) then) =
      __$LanguageResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      int? isDefault,
      String? languageCode,
      String? languageName,
      String? flagCode});
}

/// @nodoc
class __$LanguageResponseCopyWithImpl<$Res>
    extends _$LanguageResponseCopyWithImpl<$Res>
    implements _$LanguageResponseCopyWith<$Res> {
  __$LanguageResponseCopyWithImpl(
      _LanguageResponse _value, $Res Function(_LanguageResponse) _then)
      : super(_value, (v) => _then(v as _LanguageResponse));

  @override
  _LanguageResponse get _value => super._value as _LanguageResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? isDefault = freezed,
    Object? languageCode = freezed,
    Object? languageName = freezed,
    Object? flagCode = freezed,
  }) {
    return _then(_LanguageResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as int?,
      languageCode: languageCode == freezed
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      languageName: languageName == freezed
          ? _value.languageName
          : languageName // ignore: cast_nullable_to_non_nullable
              as String?,
      flagCode: flagCode == freezed
          ? _value.flagCode
          : flagCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LanguageResponse extends _LanguageResponse {
  const _$_LanguageResponse(
      {@JsonKey(name: '_id') this.id,
      this.isDefault,
      this.languageCode,
      this.languageName,
      this.flagCode})
      : super._();

  factory _$_LanguageResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_LanguageResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final int? isDefault;
  @override
  final String? languageCode;
  @override
  final String? languageName;
  @override
  final String? flagCode;

  @override
  String toString() {
    return 'LanguageResponse(id: $id, isDefault: $isDefault, languageCode: $languageCode, languageName: $languageName, flagCode: $flagCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LanguageResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isDefault, isDefault) ||
                const DeepCollectionEquality()
                    .equals(other.isDefault, isDefault)) &&
            (identical(other.languageCode, languageCode) ||
                const DeepCollectionEquality()
                    .equals(other.languageCode, languageCode)) &&
            (identical(other.languageName, languageName) ||
                const DeepCollectionEquality()
                    .equals(other.languageName, languageName)) &&
            (identical(other.flagCode, flagCode) ||
                const DeepCollectionEquality()
                    .equals(other.flagCode, flagCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isDefault) ^
      const DeepCollectionEquality().hash(languageCode) ^
      const DeepCollectionEquality().hash(languageName) ^
      const DeepCollectionEquality().hash(flagCode);

  @JsonKey(ignore: true)
  @override
  _$LanguageResponseCopyWith<_LanguageResponse> get copyWith =>
      __$LanguageResponseCopyWithImpl<_LanguageResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LanguageResponseToJson(this);
  }
}

abstract class _LanguageResponse extends LanguageResponse {
  const factory _LanguageResponse(
      {@JsonKey(name: '_id') String? id,
      int? isDefault,
      String? languageCode,
      String? languageName,
      String? flagCode}) = _$_LanguageResponse;
  const _LanguageResponse._() : super._();

  factory _LanguageResponse.fromJson(Map<String, dynamic> json) =
      _$_LanguageResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  int? get isDefault => throw _privateConstructorUsedError;
  @override
  String? get languageCode => throw _privateConstructorUsedError;
  @override
  String? get languageName => throw _privateConstructorUsedError;
  @override
  String? get flagCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LanguageResponseCopyWith<_LanguageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
