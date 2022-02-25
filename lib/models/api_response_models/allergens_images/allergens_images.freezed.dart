// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'allergens_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllergenImageModel _$AllergenImageModelFromJson(Map<String, dynamic> json) {
  return _AllergenImageModel.fromJson(json);
}

/// @nodoc
class _$AllergenImageModelTearOff {
  const _$AllergenImageModelTearOff();

  _AllergenImageModel call({String? title, String? imageUrl}) {
    return _AllergenImageModel(
      title: title,
      imageUrl: imageUrl,
    );
  }

  AllergenImageModel fromJson(Map<String, Object> json) {
    return AllergenImageModel.fromJson(json);
  }
}

/// @nodoc
const $AllergenImageModel = _$AllergenImageModelTearOff();

/// @nodoc
mixin _$AllergenImageModel {
  String? get title => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllergenImageModelCopyWith<AllergenImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllergenImageModelCopyWith<$Res> {
  factory $AllergenImageModelCopyWith(
          AllergenImageModel value, $Res Function(AllergenImageModel) then) =
      _$AllergenImageModelCopyWithImpl<$Res>;
  $Res call({String? title, String? imageUrl});
}

/// @nodoc
class _$AllergenImageModelCopyWithImpl<$Res>
    implements $AllergenImageModelCopyWith<$Res> {
  _$AllergenImageModelCopyWithImpl(this._value, this._then);

  final AllergenImageModel _value;
  // ignore: unused_field
  final $Res Function(AllergenImageModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AllergenImageModelCopyWith<$Res>
    implements $AllergenImageModelCopyWith<$Res> {
  factory _$AllergenImageModelCopyWith(
          _AllergenImageModel value, $Res Function(_AllergenImageModel) then) =
      __$AllergenImageModelCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? imageUrl});
}

/// @nodoc
class __$AllergenImageModelCopyWithImpl<$Res>
    extends _$AllergenImageModelCopyWithImpl<$Res>
    implements _$AllergenImageModelCopyWith<$Res> {
  __$AllergenImageModelCopyWithImpl(
      _AllergenImageModel _value, $Res Function(_AllergenImageModel) _then)
      : super(_value, (v) => _then(v as _AllergenImageModel));

  @override
  _AllergenImageModel get _value => super._value as _AllergenImageModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_AllergenImageModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllergenImageModel extends _AllergenImageModel {
  const _$_AllergenImageModel({this.title, this.imageUrl}) : super._();

  factory _$_AllergenImageModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AllergenImageModelFromJson(json);

  @override
  final String? title;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'AllergenImageModel(title: $title, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AllergenImageModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(imageUrl);

  @JsonKey(ignore: true)
  @override
  _$AllergenImageModelCopyWith<_AllergenImageModel> get copyWith =>
      __$AllergenImageModelCopyWithImpl<_AllergenImageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AllergenImageModelToJson(this);
  }
}

abstract class _AllergenImageModel extends AllergenImageModel {
  const factory _AllergenImageModel({String? title, String? imageUrl}) =
      _$_AllergenImageModel;
  const _AllergenImageModel._() : super._();

  factory _AllergenImageModel.fromJson(Map<String, dynamic> json) =
      _$_AllergenImageModel.fromJson;

  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AllergenImageModelCopyWith<_AllergenImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
