// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'menu_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) {
  return _MenuResponse.fromJson(json);
}

/// @nodoc
class _$MenuResponseTearOff {
  const _$MenuResponseTearOff();

  _MenuResponse call({@JsonKey(name: '_id') String? id, String? title}) {
    return _MenuResponse(
      id: id,
      title: title,
    );
  }

  MenuResponse fromJson(Map<String, Object> json) {
    return MenuResponse.fromJson(json);
  }
}

/// @nodoc
const $MenuResponse = _$MenuResponseTearOff();

/// @nodoc
mixin _$MenuResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuResponseCopyWith<MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuResponseCopyWith<$Res> {
  factory $MenuResponseCopyWith(
          MenuResponse value, $Res Function(MenuResponse) then) =
      _$MenuResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: '_id') String? id, String? title});
}

/// @nodoc
class _$MenuResponseCopyWithImpl<$Res> implements $MenuResponseCopyWith<$Res> {
  _$MenuResponseCopyWithImpl(this._value, this._then);

  final MenuResponse _value;
  // ignore: unused_field
  final $Res Function(MenuResponse) _then;

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
abstract class _$MenuResponseCopyWith<$Res>
    implements $MenuResponseCopyWith<$Res> {
  factory _$MenuResponseCopyWith(
          _MenuResponse value, $Res Function(_MenuResponse) then) =
      __$MenuResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: '_id') String? id, String? title});
}

/// @nodoc
class __$MenuResponseCopyWithImpl<$Res> extends _$MenuResponseCopyWithImpl<$Res>
    implements _$MenuResponseCopyWith<$Res> {
  __$MenuResponseCopyWithImpl(
      _MenuResponse _value, $Res Function(_MenuResponse) _then)
      : super(_value, (v) => _then(v as _MenuResponse));

  @override
  _MenuResponse get _value => super._value as _MenuResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_MenuResponse(
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
class _$_MenuResponse extends _MenuResponse {
  const _$_MenuResponse({@JsonKey(name: '_id') this.id, this.title})
      : super._();

  factory _$_MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_MenuResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? title;

  @override
  String toString() {
    return 'MenuResponse(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MenuResponse &&
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
  _$MenuResponseCopyWith<_MenuResponse> get copyWith =>
      __$MenuResponseCopyWithImpl<_MenuResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MenuResponseToJson(this);
  }
}

abstract class _MenuResponse extends MenuResponse {
  const factory _MenuResponse(
      {@JsonKey(name: '_id') String? id, String? title}) = _$_MenuResponse;
  const _MenuResponse._() : super._();

  factory _MenuResponse.fromJson(Map<String, dynamic> json) =
      _$_MenuResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuResponseCopyWith<_MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
