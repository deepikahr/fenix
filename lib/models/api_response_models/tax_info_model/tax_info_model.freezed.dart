// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'tax_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaxInfoModel _$TaxInfoModelFromJson(Map<String, dynamic> json) {
  return _TaxInfoModel.fromJson(json);
}

/// @nodoc
class _$TaxInfoModelTearOff {
  const _$TaxInfoModelTearOff();

  _TaxInfoModel call({String? taxName, int? taxPercentage}) {
    return _TaxInfoModel(
      taxName: taxName,
      taxPercentage: taxPercentage,
    );
  }

  TaxInfoModel fromJson(Map<String, Object> json) {
    return TaxInfoModel.fromJson(json);
  }
}

/// @nodoc
const $TaxInfoModel = _$TaxInfoModelTearOff();

/// @nodoc
mixin _$TaxInfoModel {
  String? get taxName => throw _privateConstructorUsedError;
  int? get taxPercentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxInfoModelCopyWith<TaxInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxInfoModelCopyWith<$Res> {
  factory $TaxInfoModelCopyWith(
          TaxInfoModel value, $Res Function(TaxInfoModel) then) =
      _$TaxInfoModelCopyWithImpl<$Res>;
  $Res call({String? taxName, int? taxPercentage});
}

/// @nodoc
class _$TaxInfoModelCopyWithImpl<$Res> implements $TaxInfoModelCopyWith<$Res> {
  _$TaxInfoModelCopyWithImpl(this._value, this._then);

  final TaxInfoModel _value;
  // ignore: unused_field
  final $Res Function(TaxInfoModel) _then;

  @override
  $Res call({
    Object? taxName = freezed,
    Object? taxPercentage = freezed,
  }) {
    return _then(_value.copyWith(
      taxName: taxName == freezed
          ? _value.taxName
          : taxName // ignore: cast_nullable_to_non_nullable
              as String?,
      taxPercentage: taxPercentage == freezed
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$TaxInfoModelCopyWith<$Res>
    implements $TaxInfoModelCopyWith<$Res> {
  factory _$TaxInfoModelCopyWith(
          _TaxInfoModel value, $Res Function(_TaxInfoModel) then) =
      __$TaxInfoModelCopyWithImpl<$Res>;
  @override
  $Res call({String? taxName, int? taxPercentage});
}

/// @nodoc
class __$TaxInfoModelCopyWithImpl<$Res> extends _$TaxInfoModelCopyWithImpl<$Res>
    implements _$TaxInfoModelCopyWith<$Res> {
  __$TaxInfoModelCopyWithImpl(
      _TaxInfoModel _value, $Res Function(_TaxInfoModel) _then)
      : super(_value, (v) => _then(v as _TaxInfoModel));

  @override
  _TaxInfoModel get _value => super._value as _TaxInfoModel;

  @override
  $Res call({
    Object? taxName = freezed,
    Object? taxPercentage = freezed,
  }) {
    return _then(_TaxInfoModel(
      taxName: taxName == freezed
          ? _value.taxName
          : taxName // ignore: cast_nullable_to_non_nullable
              as String?,
      taxPercentage: taxPercentage == freezed
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaxInfoModel extends _TaxInfoModel {
  const _$_TaxInfoModel({this.taxName, this.taxPercentage}) : super._();

  factory _$_TaxInfoModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TaxInfoModelFromJson(json);

  @override
  final String? taxName;
  @override
  final int? taxPercentage;

  @override
  String toString() {
    return 'TaxInfoModel(taxName: $taxName, taxPercentage: $taxPercentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaxInfoModel &&
            (identical(other.taxName, taxName) ||
                const DeepCollectionEquality()
                    .equals(other.taxName, taxName)) &&
            (identical(other.taxPercentage, taxPercentage) ||
                const DeepCollectionEquality()
                    .equals(other.taxPercentage, taxPercentage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(taxName) ^
      const DeepCollectionEquality().hash(taxPercentage);

  @JsonKey(ignore: true)
  @override
  _$TaxInfoModelCopyWith<_TaxInfoModel> get copyWith =>
      __$TaxInfoModelCopyWithImpl<_TaxInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaxInfoModelToJson(this);
  }
}

abstract class _TaxInfoModel extends TaxInfoModel {
  const factory _TaxInfoModel({String? taxName, int? taxPercentage}) =
      _$_TaxInfoModel;
  const _TaxInfoModel._() : super._();

  factory _TaxInfoModel.fromJson(Map<String, dynamic> json) =
      _$_TaxInfoModel.fromJson;

  @override
  String? get taxName => throw _privateConstructorUsedError;
  @override
  int? get taxPercentage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TaxInfoModelCopyWith<_TaxInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
