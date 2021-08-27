// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'category_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryRequest _$CategoryRequestFromJson(Map<String, dynamic> json) {
  return _CategoryRequest.fromJson(json);
}

/// @nodoc
class _$CategoryRequestTearOff {
  const _$CategoryRequestTearOff();

  _CategoryRequest call(
      {int limit = 10, int? page, CATEGORY_TYPE? topCategory}) {
    return _CategoryRequest(
      limit: limit,
      page: page,
      topCategory: topCategory,
    );
  }

  CategoryRequest fromJson(Map<String, Object> json) {
    return CategoryRequest.fromJson(json);
  }
}

/// @nodoc
const $CategoryRequest = _$CategoryRequestTearOff();

/// @nodoc
mixin _$CategoryRequest {
  int get limit => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  CATEGORY_TYPE? get topCategory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryRequestCopyWith<CategoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryRequestCopyWith<$Res> {
  factory $CategoryRequestCopyWith(
          CategoryRequest value, $Res Function(CategoryRequest) then) =
      _$CategoryRequestCopyWithImpl<$Res>;
  $Res call({int limit, int? page, CATEGORY_TYPE? topCategory});
}

/// @nodoc
class _$CategoryRequestCopyWithImpl<$Res>
    implements $CategoryRequestCopyWith<$Res> {
  _$CategoryRequestCopyWithImpl(this._value, this._then);

  final CategoryRequest _value;
  // ignore: unused_field
  final $Res Function(CategoryRequest) _then;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
    Object? topCategory = freezed,
  }) {
    return _then(_value.copyWith(
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      topCategory: topCategory == freezed
          ? _value.topCategory
          : topCategory // ignore: cast_nullable_to_non_nullable
              as CATEGORY_TYPE?,
    ));
  }
}

/// @nodoc
abstract class _$CategoryRequestCopyWith<$Res>
    implements $CategoryRequestCopyWith<$Res> {
  factory _$CategoryRequestCopyWith(
          _CategoryRequest value, $Res Function(_CategoryRequest) then) =
      __$CategoryRequestCopyWithImpl<$Res>;
  @override
  $Res call({int limit, int? page, CATEGORY_TYPE? topCategory});
}

/// @nodoc
class __$CategoryRequestCopyWithImpl<$Res>
    extends _$CategoryRequestCopyWithImpl<$Res>
    implements _$CategoryRequestCopyWith<$Res> {
  __$CategoryRequestCopyWithImpl(
      _CategoryRequest _value, $Res Function(_CategoryRequest) _then)
      : super(_value, (v) => _then(v as _CategoryRequest));

  @override
  _CategoryRequest get _value => super._value as _CategoryRequest;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
    Object? topCategory = freezed,
  }) {
    return _then(_CategoryRequest(
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      topCategory: topCategory == freezed
          ? _value.topCategory
          : topCategory // ignore: cast_nullable_to_non_nullable
              as CATEGORY_TYPE?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryRequest extends _CategoryRequest {
  const _$_CategoryRequest({this.limit = 10, this.page, this.topCategory})
      : super._();

  factory _$_CategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_CategoryRequestFromJson(json);

  @JsonKey(defaultValue: 10)
  @override
  final int limit;
  @override
  final int? page;
  @override
  final CATEGORY_TYPE? topCategory;

  @override
  String toString() {
    return 'CategoryRequest(limit: $limit, page: $page, topCategory: $topCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoryRequest &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.topCategory, topCategory) ||
                const DeepCollectionEquality()
                    .equals(other.topCategory, topCategory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(topCategory);

  @JsonKey(ignore: true)
  @override
  _$CategoryRequestCopyWith<_CategoryRequest> get copyWith =>
      __$CategoryRequestCopyWithImpl<_CategoryRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CategoryRequestToJson(this);
  }
}

abstract class _CategoryRequest extends CategoryRequest {
  const factory _CategoryRequest(
      {int limit, int? page, CATEGORY_TYPE? topCategory}) = _$_CategoryRequest;
  const _CategoryRequest._() : super._();

  factory _CategoryRequest.fromJson(Map<String, dynamic> json) =
      _$_CategoryRequest.fromJson;

  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  int? get page => throw _privateConstructorUsedError;
  @override
  CATEGORY_TYPE? get topCategory => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CategoryRequestCopyWith<_CategoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
