// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return _CategoryResponse.fromJson(json);
}

/// @nodoc
class _$CategoryResponseTearOff {
  const _$CategoryResponseTearOff();

  _CategoryResponse call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? imageUrl,
      String? imageId,
      String? filePath}) {
    return _CategoryResponse(
      id: id,
      title: title,
      imageUrl: imageUrl,
      imageId: imageId,
      filePath: filePath,
    );
  }

  CategoryResponse fromJson(Map<String, Object> json) {
    return CategoryResponse.fromJson(json);
  }
}

/// @nodoc
const $CategoryResponse = _$CategoryResponseTearOff();

/// @nodoc
mixin _$CategoryResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get imageId => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryResponseCopyWith<CategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryResponseCopyWith<$Res> {
  factory $CategoryResponseCopyWith(
          CategoryResponse value, $Res Function(CategoryResponse) then) =
      _$CategoryResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? imageUrl,
      String? imageId,
      String? filePath});
}

/// @nodoc
class _$CategoryResponseCopyWithImpl<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  _$CategoryResponseCopyWithImpl(this._value, this._then);

  final CategoryResponse _value;
  // ignore: unused_field
  final $Res Function(CategoryResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? imageUrl = freezed,
    Object? imageId = freezed,
    Object? filePath = freezed,
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
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CategoryResponseCopyWith<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  factory _$CategoryResponseCopyWith(
          _CategoryResponse value, $Res Function(_CategoryResponse) then) =
      __$CategoryResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? imageUrl,
      String? imageId,
      String? filePath});
}

/// @nodoc
class __$CategoryResponseCopyWithImpl<$Res>
    extends _$CategoryResponseCopyWithImpl<$Res>
    implements _$CategoryResponseCopyWith<$Res> {
  __$CategoryResponseCopyWithImpl(
      _CategoryResponse _value, $Res Function(_CategoryResponse) _then)
      : super(_value, (v) => _then(v as _CategoryResponse));

  @override
  _CategoryResponse get _value => super._value as _CategoryResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? imageUrl = freezed,
    Object? imageId = freezed,
    Object? filePath = freezed,
  }) {
    return _then(_CategoryResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryResponse extends _CategoryResponse {
  const _$_CategoryResponse(
      {@JsonKey(name: '_id') this.id,
      this.title,
      this.imageUrl,
      this.imageId,
      this.filePath})
      : super._();

  factory _$_CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_CategoryResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? title;
  @override
  final String? imageUrl;
  @override
  final String? imageId;
  @override
  final String? filePath;

  @override
  String toString() {
    return 'CategoryResponse(id: $id, title: $title, imageUrl: $imageUrl, imageId: $imageId, filePath: $filePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoryResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.imageId, imageId) ||
                const DeepCollectionEquality()
                    .equals(other.imageId, imageId)) &&
            (identical(other.filePath, filePath) ||
                const DeepCollectionEquality()
                    .equals(other.filePath, filePath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(imageId) ^
      const DeepCollectionEquality().hash(filePath);

  @JsonKey(ignore: true)
  @override
  _$CategoryResponseCopyWith<_CategoryResponse> get copyWith =>
      __$CategoryResponseCopyWithImpl<_CategoryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CategoryResponseToJson(this);
  }
}

abstract class _CategoryResponse extends CategoryResponse {
  const factory _CategoryResponse(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? imageUrl,
      String? imageId,
      String? filePath}) = _$_CategoryResponse;
  const _CategoryResponse._() : super._();

  factory _CategoryResponse.fromJson(Map<String, dynamic> json) =
      _$_CategoryResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get imageId => throw _privateConstructorUsedError;
  @override
  String? get filePath => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CategoryResponseCopyWith<_CategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
