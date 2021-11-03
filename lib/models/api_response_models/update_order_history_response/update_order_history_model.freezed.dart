// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'update_order_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateOrderHistoryModel _$UpdateOrderHistoryModelFromJson(
    Map<String, dynamic> json) {
  return _UpdateOrderHistoryModel.fromJson(json);
}

/// @nodoc
class _$UpdateOrderHistoryModelTearOff {
  const _$UpdateOrderHistoryModelTearOff();

  _UpdateOrderHistoryModel call(
      {@JsonKey(name: 'modifyRequest', defaultValue: ACTION_MODIFICATION.Pending)
          ACTION_MODIFICATION action = ACTION_MODIFICATION.Pending,
      @JsonKey(name: '_id')
          String? id,
      DateTime? createdAt,
      Cart? localCart}) {
    return _UpdateOrderHistoryModel(
      action: action,
      id: id,
      createdAt: createdAt,
      localCart: localCart,
    );
  }

  UpdateOrderHistoryModel fromJson(Map<String, Object> json) {
    return UpdateOrderHistoryModel.fromJson(json);
  }
}

/// @nodoc
const $UpdateOrderHistoryModel = _$UpdateOrderHistoryModelTearOff();

/// @nodoc
mixin _$UpdateOrderHistoryModel {
  @JsonKey(name: 'modifyRequest', defaultValue: ACTION_MODIFICATION.Pending)
  ACTION_MODIFICATION get action => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  Cart? get localCart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateOrderHistoryModelCopyWith<UpdateOrderHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateOrderHistoryModelCopyWith<$Res> {
  factory $UpdateOrderHistoryModelCopyWith(UpdateOrderHistoryModel value,
          $Res Function(UpdateOrderHistoryModel) then) =
      _$UpdateOrderHistoryModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'modifyRequest', defaultValue: ACTION_MODIFICATION.Pending)
          ACTION_MODIFICATION action,
      @JsonKey(name: '_id')
          String? id,
      DateTime? createdAt,
      Cart? localCart});

  $CartCopyWith<$Res>? get localCart;
}

/// @nodoc
class _$UpdateOrderHistoryModelCopyWithImpl<$Res>
    implements $UpdateOrderHistoryModelCopyWith<$Res> {
  _$UpdateOrderHistoryModelCopyWithImpl(this._value, this._then);

  final UpdateOrderHistoryModel _value;
  // ignore: unused_field
  final $Res Function(UpdateOrderHistoryModel) _then;

  @override
  $Res call({
    Object? action = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$UpdateOrderHistoryModelCopyWith<$Res>
    implements $UpdateOrderHistoryModelCopyWith<$Res> {
  factory _$UpdateOrderHistoryModelCopyWith(_UpdateOrderHistoryModel value,
          $Res Function(_UpdateOrderHistoryModel) then) =
      __$UpdateOrderHistoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'modifyRequest', defaultValue: ACTION_MODIFICATION.Pending)
          ACTION_MODIFICATION action,
      @JsonKey(name: '_id')
          String? id,
      DateTime? createdAt,
      Cart? localCart});

  @override
  $CartCopyWith<$Res>? get localCart;
}

/// @nodoc
class __$UpdateOrderHistoryModelCopyWithImpl<$Res>
    extends _$UpdateOrderHistoryModelCopyWithImpl<$Res>
    implements _$UpdateOrderHistoryModelCopyWith<$Res> {
  __$UpdateOrderHistoryModelCopyWithImpl(_UpdateOrderHistoryModel _value,
      $Res Function(_UpdateOrderHistoryModel) _then)
      : super(_value, (v) => _then(v as _UpdateOrderHistoryModel));

  @override
  _UpdateOrderHistoryModel get _value =>
      super._value as _UpdateOrderHistoryModel;

  @override
  $Res call({
    Object? action = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? localCart = freezed,
  }) {
    return _then(_UpdateOrderHistoryModel(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ACTION_MODIFICATION,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      localCart: localCart == freezed
          ? _value.localCart
          : localCart // ignore: cast_nullable_to_non_nullable
              as Cart?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateOrderHistoryModel extends _UpdateOrderHistoryModel {
  const _$_UpdateOrderHistoryModel(
      {@JsonKey(name: 'modifyRequest', defaultValue: ACTION_MODIFICATION.Pending)
          this.action = ACTION_MODIFICATION.Pending,
      @JsonKey(name: '_id')
          this.id,
      this.createdAt,
      this.localCart})
      : super._();

  factory _$_UpdateOrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UpdateOrderHistoryModelFromJson(json);

  @override
  @JsonKey(name: 'modifyRequest', defaultValue: ACTION_MODIFICATION.Pending)
  final ACTION_MODIFICATION action;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final DateTime? createdAt;
  @override
  final Cart? localCart;

  @override
  String toString() {
    return 'UpdateOrderHistoryModel(action: $action, id: $id, createdAt: $createdAt, localCart: $localCart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateOrderHistoryModel &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.localCart, localCart) ||
                const DeepCollectionEquality()
                    .equals(other.localCart, localCart)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(action) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(localCart);

  @JsonKey(ignore: true)
  @override
  _$UpdateOrderHistoryModelCopyWith<_UpdateOrderHistoryModel> get copyWith =>
      __$UpdateOrderHistoryModelCopyWithImpl<_UpdateOrderHistoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UpdateOrderHistoryModelToJson(this);
  }
}

abstract class _UpdateOrderHistoryModel extends UpdateOrderHistoryModel {
  const factory _UpdateOrderHistoryModel(
      {@JsonKey(name: 'modifyRequest', defaultValue: ACTION_MODIFICATION.Pending)
          ACTION_MODIFICATION action,
      @JsonKey(name: '_id')
          String? id,
      DateTime? createdAt,
      Cart? localCart}) = _$_UpdateOrderHistoryModel;
  const _UpdateOrderHistoryModel._() : super._();

  factory _UpdateOrderHistoryModel.fromJson(Map<String, dynamic> json) =
      _$_UpdateOrderHistoryModel.fromJson;

  @override
  @JsonKey(name: 'modifyRequest', defaultValue: ACTION_MODIFICATION.Pending)
  ACTION_MODIFICATION get action => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  Cart? get localCart => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UpdateOrderHistoryModelCopyWith<_UpdateOrderHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
