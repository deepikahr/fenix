// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'franchise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FranchiseModel _$FranchiseModelFromJson(Map<String, dynamic> json) {
  return _FranchiseModel.fromJson(json);
}

/// @nodoc
class _$FranchiseModelTearOff {
  const _$FranchiseModelTearOff();

  _FranchiseModel call(
      {@JsonKey(name: '_id') String? id,
      String? franchiseName,
      String? restaurantName}) {
    return _FranchiseModel(
      id: id,
      franchiseName: franchiseName,
      restaurantName: restaurantName,
    );
  }

  FranchiseModel fromJson(Map<String, Object> json) {
    return FranchiseModel.fromJson(json);
  }
}

/// @nodoc
const $FranchiseModel = _$FranchiseModelTearOff();

/// @nodoc
mixin _$FranchiseModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get franchiseName => throw _privateConstructorUsedError;
  String? get restaurantName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FranchiseModelCopyWith<FranchiseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FranchiseModelCopyWith<$Res> {
  factory $FranchiseModelCopyWith(
          FranchiseModel value, $Res Function(FranchiseModel) then) =
      _$FranchiseModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? franchiseName,
      String? restaurantName});
}

/// @nodoc
class _$FranchiseModelCopyWithImpl<$Res>
    implements $FranchiseModelCopyWith<$Res> {
  _$FranchiseModelCopyWithImpl(this._value, this._then);

  final FranchiseModel _value;
  // ignore: unused_field
  final $Res Function(FranchiseModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? franchiseName = freezed,
    Object? restaurantName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$FranchiseModelCopyWith<$Res>
    implements $FranchiseModelCopyWith<$Res> {
  factory _$FranchiseModelCopyWith(
          _FranchiseModel value, $Res Function(_FranchiseModel) then) =
      __$FranchiseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? franchiseName,
      String? restaurantName});
}

/// @nodoc
class __$FranchiseModelCopyWithImpl<$Res>
    extends _$FranchiseModelCopyWithImpl<$Res>
    implements _$FranchiseModelCopyWith<$Res> {
  __$FranchiseModelCopyWithImpl(
      _FranchiseModel _value, $Res Function(_FranchiseModel) _then)
      : super(_value, (v) => _then(v as _FranchiseModel));

  @override
  _FranchiseModel get _value => super._value as _FranchiseModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? franchiseName = freezed,
    Object? restaurantName = freezed,
  }) {
    return _then(_FranchiseModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FranchiseModel extends _FranchiseModel {
  const _$_FranchiseModel(
      {@JsonKey(name: '_id') this.id, this.franchiseName, this.restaurantName})
      : super._();

  factory _$_FranchiseModel.fromJson(Map<String, dynamic> json) =>
      _$_$_FranchiseModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? franchiseName;
  @override
  final String? restaurantName;

  @override
  String toString() {
    return 'FranchiseModel(id: $id, franchiseName: $franchiseName, restaurantName: $restaurantName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FranchiseModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.franchiseName, franchiseName) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseName, franchiseName)) &&
            (identical(other.restaurantName, restaurantName) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantName, restaurantName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(franchiseName) ^
      const DeepCollectionEquality().hash(restaurantName);

  @JsonKey(ignore: true)
  @override
  _$FranchiseModelCopyWith<_FranchiseModel> get copyWith =>
      __$FranchiseModelCopyWithImpl<_FranchiseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FranchiseModelToJson(this);
  }
}

abstract class _FranchiseModel extends FranchiseModel {
  const factory _FranchiseModel(
      {@JsonKey(name: '_id') String? id,
      String? franchiseName,
      String? restaurantName}) = _$_FranchiseModel;
  const _FranchiseModel._() : super._();

  factory _FranchiseModel.fromJson(Map<String, dynamic> json) =
      _$_FranchiseModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get franchiseName => throw _privateConstructorUsedError;
  @override
  String? get restaurantName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FranchiseModelCopyWith<_FranchiseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
