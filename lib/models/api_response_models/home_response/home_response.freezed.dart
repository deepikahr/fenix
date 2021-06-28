// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) {
  return _HomeResponse.fromJson(json);
}

/// @nodoc
class _$HomeResponseTearOff {
  const _$HomeResponseTearOff();

  _HomeResponse call(
      {List<BannerResponse> banners = const [],
      List<CategoryResponse> category = const []}) {
    return _HomeResponse(
      banners: banners,
      category: category,
    );
  }

  HomeResponse fromJson(Map<String, Object> json) {
    return HomeResponse.fromJson(json);
  }
}

/// @nodoc
const $HomeResponse = _$HomeResponseTearOff();

/// @nodoc
mixin _$HomeResponse {
  List<BannerResponse> get banners => throw _privateConstructorUsedError;
  List<CategoryResponse> get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeResponseCopyWith<HomeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeResponseCopyWith<$Res> {
  factory $HomeResponseCopyWith(
          HomeResponse value, $Res Function(HomeResponse) then) =
      _$HomeResponseCopyWithImpl<$Res>;
  $Res call({List<BannerResponse> banners, List<CategoryResponse> category});
}

/// @nodoc
class _$HomeResponseCopyWithImpl<$Res> implements $HomeResponseCopyWith<$Res> {
  _$HomeResponseCopyWithImpl(this._value, this._then);

  final HomeResponse _value;
  // ignore: unused_field
  final $Res Function(HomeResponse) _then;

  @override
  $Res call({
    Object? banners = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      banners: banners == freezed
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerResponse>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryResponse>,
    ));
  }
}

/// @nodoc
abstract class _$HomeResponseCopyWith<$Res>
    implements $HomeResponseCopyWith<$Res> {
  factory _$HomeResponseCopyWith(
          _HomeResponse value, $Res Function(_HomeResponse) then) =
      __$HomeResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<BannerResponse> banners, List<CategoryResponse> category});
}

/// @nodoc
class __$HomeResponseCopyWithImpl<$Res> extends _$HomeResponseCopyWithImpl<$Res>
    implements _$HomeResponseCopyWith<$Res> {
  __$HomeResponseCopyWithImpl(
      _HomeResponse _value, $Res Function(_HomeResponse) _then)
      : super(_value, (v) => _then(v as _HomeResponse));

  @override
  _HomeResponse get _value => super._value as _HomeResponse;

  @override
  $Res call({
    Object? banners = freezed,
    Object? category = freezed,
  }) {
    return _then(_HomeResponse(
      banners: banners == freezed
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerResponse>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeResponse extends _HomeResponse {
  const _$_HomeResponse({this.banners = const [], this.category = const []})
      : super._();

  factory _$_HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_HomeResponseFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<BannerResponse> banners;
  @JsonKey(defaultValue: const [])
  @override
  final List<CategoryResponse> category;

  @override
  String toString() {
    return 'HomeResponse(banners: $banners, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeResponse &&
            (identical(other.banners, banners) ||
                const DeepCollectionEquality()
                    .equals(other.banners, banners)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(banners) ^
      const DeepCollectionEquality().hash(category);

  @JsonKey(ignore: true)
  @override
  _$HomeResponseCopyWith<_HomeResponse> get copyWith =>
      __$HomeResponseCopyWithImpl<_HomeResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HomeResponseToJson(this);
  }
}

abstract class _HomeResponse extends HomeResponse {
  const factory _HomeResponse(
      {List<BannerResponse> banners,
      List<CategoryResponse> category}) = _$_HomeResponse;
  const _HomeResponse._() : super._();

  factory _HomeResponse.fromJson(Map<String, dynamic> json) =
      _$_HomeResponse.fromJson;

  @override
  List<BannerResponse> get banners => throw _privateConstructorUsedError;
  @override
  List<CategoryResponse> get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeResponseCopyWith<_HomeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
