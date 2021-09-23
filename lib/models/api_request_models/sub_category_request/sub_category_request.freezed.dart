// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sub_category_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubCategoryRequest _$SubCategoryRequestFromJson(Map<String, dynamic> json) {
  return _SubCategoryRequest.fromJson(json);
}

/// @nodoc
class _$SubCategoryRequestTearOff {
  const _$SubCategoryRequestTearOff();

  _SubCategoryRequest call({int? page, int limit = 25, String? menuId}) {
    return _SubCategoryRequest(
      page: page,
      limit: limit,
      menuId: menuId,
    );
  }

  SubCategoryRequest fromJson(Map<String, Object> json) {
    return SubCategoryRequest.fromJson(json);
  }
}

/// @nodoc
const $SubCategoryRequest = _$SubCategoryRequestTearOff();

/// @nodoc
mixin _$SubCategoryRequest {
  int? get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  String? get menuId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryRequestCopyWith<SubCategoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryRequestCopyWith<$Res> {
  factory $SubCategoryRequestCopyWith(
          SubCategoryRequest value, $Res Function(SubCategoryRequest) then) =
      _$SubCategoryRequestCopyWithImpl<$Res>;
  $Res call({int? page, int limit, String? menuId});
}

/// @nodoc
class _$SubCategoryRequestCopyWithImpl<$Res>
    implements $SubCategoryRequestCopyWith<$Res> {
  _$SubCategoryRequestCopyWithImpl(this._value, this._then);

  final SubCategoryRequest _value;
  // ignore: unused_field
  final $Res Function(SubCategoryRequest) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? limit = freezed,
    Object? menuId = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SubCategoryRequestCopyWith<$Res>
    implements $SubCategoryRequestCopyWith<$Res> {
  factory _$SubCategoryRequestCopyWith(
          _SubCategoryRequest value, $Res Function(_SubCategoryRequest) then) =
      __$SubCategoryRequestCopyWithImpl<$Res>;
  @override
  $Res call({int? page, int limit, String? menuId});
}

/// @nodoc
class __$SubCategoryRequestCopyWithImpl<$Res>
    extends _$SubCategoryRequestCopyWithImpl<$Res>
    implements _$SubCategoryRequestCopyWith<$Res> {
  __$SubCategoryRequestCopyWithImpl(
      _SubCategoryRequest _value, $Res Function(_SubCategoryRequest) _then)
      : super(_value, (v) => _then(v as _SubCategoryRequest));

  @override
  _SubCategoryRequest get _value => super._value as _SubCategoryRequest;

  @override
  $Res call({
    Object? page = freezed,
    Object? limit = freezed,
    Object? menuId = freezed,
  }) {
    return _then(_SubCategoryRequest(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubCategoryRequest extends _SubCategoryRequest {
  const _$_SubCategoryRequest({this.page, this.limit = 25, this.menuId})
      : super._();

  factory _$_SubCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_SubCategoryRequestFromJson(json);

  @override
  final int? page;
  @JsonKey(defaultValue: 25)
  @override
  final int limit;
  @override
  final String? menuId;

  @override
  String toString() {
    return 'SubCategoryRequest(page: $page, limit: $limit, menuId: $menuId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubCategoryRequest &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.menuId, menuId) ||
                const DeepCollectionEquality().equals(other.menuId, menuId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(menuId);

  @JsonKey(ignore: true)
  @override
  _$SubCategoryRequestCopyWith<_SubCategoryRequest> get copyWith =>
      __$SubCategoryRequestCopyWithImpl<_SubCategoryRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubCategoryRequestToJson(this);
  }
}

abstract class _SubCategoryRequest extends SubCategoryRequest {
  const factory _SubCategoryRequest({int? page, int limit, String? menuId}) =
      _$_SubCategoryRequest;
  const _SubCategoryRequest._() : super._();

  factory _SubCategoryRequest.fromJson(Map<String, dynamic> json) =
      _$_SubCategoryRequest.fromJson;

  @override
  int? get page => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  String? get menuId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SubCategoryRequestCopyWith<_SubCategoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
