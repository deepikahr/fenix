// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pagination_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationRequest _$PaginationRequestFromJson(Map<String, dynamic> json) {
  return _PaginationRequest.fromJson(json);
}

/// @nodoc
class _$PaginationRequestTearOff {
  const _$PaginationRequestTearOff();

  _PaginationRequest call({int limit = 10, int? page}) {
    return _PaginationRequest(
      limit: limit,
      page: page,
    );
  }

  PaginationRequest fromJson(Map<String, Object> json) {
    return PaginationRequest.fromJson(json);
  }
}

/// @nodoc
const $PaginationRequest = _$PaginationRequestTearOff();

/// @nodoc
mixin _$PaginationRequest {
  int get limit => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationRequestCopyWith<PaginationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationRequestCopyWith<$Res> {
  factory $PaginationRequestCopyWith(
          PaginationRequest value, $Res Function(PaginationRequest) then) =
      _$PaginationRequestCopyWithImpl<$Res>;
  $Res call({int limit, int? page});
}

/// @nodoc
class _$PaginationRequestCopyWithImpl<$Res>
    implements $PaginationRequestCopyWith<$Res> {
  _$PaginationRequestCopyWithImpl(this._value, this._then);

  final PaginationRequest _value;
  // ignore: unused_field
  final $Res Function(PaginationRequest) _then;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$PaginationRequestCopyWith<$Res>
    implements $PaginationRequestCopyWith<$Res> {
  factory _$PaginationRequestCopyWith(
          _PaginationRequest value, $Res Function(_PaginationRequest) then) =
      __$PaginationRequestCopyWithImpl<$Res>;
  @override
  $Res call({int limit, int? page});
}

/// @nodoc
class __$PaginationRequestCopyWithImpl<$Res>
    extends _$PaginationRequestCopyWithImpl<$Res>
    implements _$PaginationRequestCopyWith<$Res> {
  __$PaginationRequestCopyWithImpl(
      _PaginationRequest _value, $Res Function(_PaginationRequest) _then)
      : super(_value, (v) => _then(v as _PaginationRequest));

  @override
  _PaginationRequest get _value => super._value as _PaginationRequest;

  @override
  $Res call({
    Object? limit = freezed,
    Object? page = freezed,
  }) {
    return _then(_PaginationRequest(
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationRequest extends _PaginationRequest {
  const _$_PaginationRequest({this.limit = 10, this.page}) : super._();

  factory _$_PaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_PaginationRequestFromJson(json);

  @JsonKey(defaultValue: 10)
  @override
  final int limit;
  @override
  final int? page;

  @override
  String toString() {
    return 'PaginationRequest(limit: $limit, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaginationRequest &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(page);

  @JsonKey(ignore: true)
  @override
  _$PaginationRequestCopyWith<_PaginationRequest> get copyWith =>
      __$PaginationRequestCopyWithImpl<_PaginationRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PaginationRequestToJson(this);
  }
}

abstract class _PaginationRequest extends PaginationRequest {
  const factory _PaginationRequest({int limit, int? page}) =
      _$_PaginationRequest;
  const _PaginationRequest._() : super._();

  factory _PaginationRequest.fromJson(Map<String, dynamic> json) =
      _$_PaginationRequest.fromJson;

  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  int? get page => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaginationRequestCopyWith<_PaginationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
