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

  _SubCategoryRequest call({String? category}) {
    return _SubCategoryRequest(
      category: category,
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
  String? get category => throw _privateConstructorUsedError;

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
  $Res call({String? category});
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
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
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
  $Res call({String? category});
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
    Object? category = freezed,
  }) {
    return _then(_SubCategoryRequest(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubCategoryRequest extends _SubCategoryRequest {
  const _$_SubCategoryRequest({this.category}) : super._();

  factory _$_SubCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_SubCategoryRequestFromJson(json);

  @override
  final String? category;

  @override
  String toString() {
    return 'SubCategoryRequest(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubCategoryRequest &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(category);

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
  const factory _SubCategoryRequest({String? category}) = _$_SubCategoryRequest;
  const _SubCategoryRequest._() : super._();

  factory _SubCategoryRequest.fromJson(Map<String, dynamic> json) =
      _$_SubCategoryRequest.fromJson;

  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SubCategoryRequestCopyWith<_SubCategoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
