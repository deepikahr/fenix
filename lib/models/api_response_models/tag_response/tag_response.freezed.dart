// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'tag_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagResponse _$TagResponseFromJson(Map<String, dynamic> json) {
  return _TagResponse.fromJson(json);
}

/// @nodoc
class _$TagResponseTearOff {
  const _$TagResponseTearOff();

  _TagResponse call({@JsonKey(name: '_id') String? id, String? title}) {
    return _TagResponse(
      id: id,
      title: title,
    );
  }

  TagResponse fromJson(Map<String, Object> json) {
    return TagResponse.fromJson(json);
  }
}

/// @nodoc
const $TagResponse = _$TagResponseTearOff();

/// @nodoc
mixin _$TagResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagResponseCopyWith<TagResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagResponseCopyWith<$Res> {
  factory $TagResponseCopyWith(
          TagResponse value, $Res Function(TagResponse) then) =
      _$TagResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: '_id') String? id, String? title});
}

/// @nodoc
class _$TagResponseCopyWithImpl<$Res> implements $TagResponseCopyWith<$Res> {
  _$TagResponseCopyWithImpl(this._value, this._then);

  final TagResponse _value;
  // ignore: unused_field
  final $Res Function(TagResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TagResponseCopyWith<$Res>
    implements $TagResponseCopyWith<$Res> {
  factory _$TagResponseCopyWith(
          _TagResponse value, $Res Function(_TagResponse) then) =
      __$TagResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: '_id') String? id, String? title});
}

/// @nodoc
class __$TagResponseCopyWithImpl<$Res> extends _$TagResponseCopyWithImpl<$Res>
    implements _$TagResponseCopyWith<$Res> {
  __$TagResponseCopyWithImpl(
      _TagResponse _value, $Res Function(_TagResponse) _then)
      : super(_value, (v) => _then(v as _TagResponse));

  @override
  _TagResponse get _value => super._value as _TagResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_TagResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagResponse extends _TagResponse {
  const _$_TagResponse({@JsonKey(name: '_id') this.id, this.title}) : super._();

  factory _$_TagResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_TagResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? title;

  @override
  String toString() {
    return 'TagResponse(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TagResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$TagResponseCopyWith<_TagResponse> get copyWith =>
      __$TagResponseCopyWithImpl<_TagResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TagResponseToJson(this);
  }
}

abstract class _TagResponse extends TagResponse {
  const factory _TagResponse(
      {@JsonKey(name: '_id') String? id, String? title}) = _$_TagResponse;
  const _TagResponse._() : super._();

  factory _TagResponse.fromJson(Map<String, dynamic> json) =
      _$_TagResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TagResponseCopyWith<_TagResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
