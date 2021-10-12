// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'update_order_socket_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateOrderSocketResponse _$UpdateOrderSocketResponseFromJson(
    Map<String, dynamic> json) {
  return _UpdateOrderSocketResponse.fromJson(json);
}

/// @nodoc
class _$UpdateOrderSocketResponseTearOff {
  const _$UpdateOrderSocketResponseTearOff();

  _UpdateOrderSocketResponse call(
      {ACTION_MODIFICATION action = ACTION_MODIFICATION.reject,
      @JsonKey(name: '_id') String? id,
      Cart? localCart}) {
    return _UpdateOrderSocketResponse(
      action: action,
      id: id,
      localCart: localCart,
    );
  }

  UpdateOrderSocketResponse fromJson(Map<String, Object> json) {
    return UpdateOrderSocketResponse.fromJson(json);
  }
}

/// @nodoc
const $UpdateOrderSocketResponse = _$UpdateOrderSocketResponseTearOff();

/// @nodoc
mixin _$UpdateOrderSocketResponse {
  ACTION_MODIFICATION get action => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  Cart? get localCart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateOrderSocketResponseCopyWith<UpdateOrderSocketResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateOrderSocketResponseCopyWith<$Res> {
  factory $UpdateOrderSocketResponseCopyWith(UpdateOrderSocketResponse value,
          $Res Function(UpdateOrderSocketResponse) then) =
      _$UpdateOrderSocketResponseCopyWithImpl<$Res>;
  $Res call(
      {ACTION_MODIFICATION action,
      @JsonKey(name: '_id') String? id,
      Cart? localCart});

  $CartCopyWith<$Res>? get localCart;
}

/// @nodoc
class _$UpdateOrderSocketResponseCopyWithImpl<$Res>
    implements $UpdateOrderSocketResponseCopyWith<$Res> {
  _$UpdateOrderSocketResponseCopyWithImpl(this._value, this._then);

  final UpdateOrderSocketResponse _value;
  // ignore: unused_field
  final $Res Function(UpdateOrderSocketResponse) _then;

  @override
  $Res call({
    Object? action = freezed,
    Object? id = freezed,
    Object? localCart = freezed,
  }) {
    return _then(_value.copyWith(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ACTION_MODIFICATION,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      localCart: localCart == freezed
          ? _value.localCart
          : localCart // ignore: cast_nullable_to_non_nullable
              as Cart?,
    ));
  }

  @override
  $CartCopyWith<$Res>? get localCart {
    if (_value.localCart == null) {
      return null;
    }

    return $CartCopyWith<$Res>(_value.localCart!, (value) {
      return _then(_value.copyWith(localCart: value));
    });
  }
}

/// @nodoc
abstract class _$UpdateOrderSocketResponseCopyWith<$Res>
    implements $UpdateOrderSocketResponseCopyWith<$Res> {
  factory _$UpdateOrderSocketResponseCopyWith(_UpdateOrderSocketResponse value,
          $Res Function(_UpdateOrderSocketResponse) then) =
      __$UpdateOrderSocketResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {ACTION_MODIFICATION action,
      @JsonKey(name: '_id') String? id,
      Cart? localCart});

  @override
  $CartCopyWith<$Res>? get localCart;
}

/// @nodoc
class __$UpdateOrderSocketResponseCopyWithImpl<$Res>
    extends _$UpdateOrderSocketResponseCopyWithImpl<$Res>
    implements _$UpdateOrderSocketResponseCopyWith<$Res> {
  __$UpdateOrderSocketResponseCopyWithImpl(_UpdateOrderSocketResponse _value,
      $Res Function(_UpdateOrderSocketResponse) _then)
      : super(_value, (v) => _then(v as _UpdateOrderSocketResponse));

  @override
  _UpdateOrderSocketResponse get _value =>
      super._value as _UpdateOrderSocketResponse;

  @override
  $Res call({
    Object? action = freezed,
    Object? id = freezed,
    Object? localCart = freezed,
  }) {
    return _then(_UpdateOrderSocketResponse(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ACTION_MODIFICATION,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      localCart: localCart == freezed
          ? _value.localCart
          : localCart // ignore: cast_nullable_to_non_nullable
              as Cart?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateOrderSocketResponse extends _UpdateOrderSocketResponse {
  const _$_UpdateOrderSocketResponse(
      {this.action = ACTION_MODIFICATION.reject,
      @JsonKey(name: '_id') this.id,
      this.localCart})
      : super._();

  factory _$_UpdateOrderSocketResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_UpdateOrderSocketResponseFromJson(json);

  @JsonKey(defaultValue: ACTION_MODIFICATION.reject)
  @override
  final ACTION_MODIFICATION action;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final Cart? localCart;

  @override
  String toString() {
    return 'UpdateOrderSocketResponse(action: $action, id: $id, localCart: $localCart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateOrderSocketResponse &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.localCart, localCart) ||
                const DeepCollectionEquality()
                    .equals(other.localCart, localCart)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(action) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(localCart);

  @JsonKey(ignore: true)
  @override
  _$UpdateOrderSocketResponseCopyWith<_UpdateOrderSocketResponse>
      get copyWith =>
          __$UpdateOrderSocketResponseCopyWithImpl<_UpdateOrderSocketResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UpdateOrderSocketResponseToJson(this);
  }
}

abstract class _UpdateOrderSocketResponse extends UpdateOrderSocketResponse {
  const factory _UpdateOrderSocketResponse(
      {ACTION_MODIFICATION action,
      @JsonKey(name: '_id') String? id,
      Cart? localCart}) = _$_UpdateOrderSocketResponse;
  const _UpdateOrderSocketResponse._() : super._();

  factory _UpdateOrderSocketResponse.fromJson(Map<String, dynamic> json) =
      _$_UpdateOrderSocketResponse.fromJson;

  @override
  ACTION_MODIFICATION get action => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  Cart? get localCart => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UpdateOrderSocketResponseCopyWith<_UpdateOrderSocketResponse>
      get copyWith => throw _privateConstructorUsedError;
}
