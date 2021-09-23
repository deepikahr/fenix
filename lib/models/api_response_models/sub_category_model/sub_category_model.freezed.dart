// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sub_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) {
  return _SubCategoryModel.fromJson(json);
}

/// @nodoc
class _$SubCategoryModelTearOff {
  const _$SubCategoryModelTearOff();

  _SubCategoryModel call(
      {List<SubCategoryResponse> data = const [], int total = 0}) {
    return _SubCategoryModel(
      data: data,
      total: total,
    );
  }

  SubCategoryModel fromJson(Map<String, Object> json) {
    return SubCategoryModel.fromJson(json);
  }
}

/// @nodoc
const $SubCategoryModel = _$SubCategoryModelTearOff();

/// @nodoc
mixin _$SubCategoryModel {
  List<SubCategoryResponse> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryModelCopyWith<SubCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryModelCopyWith<$Res> {
  factory $SubCategoryModelCopyWith(
          SubCategoryModel value, $Res Function(SubCategoryModel) then) =
      _$SubCategoryModelCopyWithImpl<$Res>;
  $Res call({List<SubCategoryResponse> data, int total});
}

/// @nodoc
class _$SubCategoryModelCopyWithImpl<$Res>
    implements $SubCategoryModelCopyWith<$Res> {
  _$SubCategoryModelCopyWithImpl(this._value, this._then);

  final SubCategoryModel _value;
  // ignore: unused_field
  final $Res Function(SubCategoryModel) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryResponse>,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SubCategoryModelCopyWith<$Res>
    implements $SubCategoryModelCopyWith<$Res> {
  factory _$SubCategoryModelCopyWith(
          _SubCategoryModel value, $Res Function(_SubCategoryModel) then) =
      __$SubCategoryModelCopyWithImpl<$Res>;
  @override
  $Res call({List<SubCategoryResponse> data, int total});
}

/// @nodoc
class __$SubCategoryModelCopyWithImpl<$Res>
    extends _$SubCategoryModelCopyWithImpl<$Res>
    implements _$SubCategoryModelCopyWith<$Res> {
  __$SubCategoryModelCopyWithImpl(
      _SubCategoryModel _value, $Res Function(_SubCategoryModel) _then)
      : super(_value, (v) => _then(v as _SubCategoryModel));

  @override
  _SubCategoryModel get _value => super._value as _SubCategoryModel;

  @override
  $Res call({
    Object? data = freezed,
    Object? total = freezed,
  }) {
    return _then(_SubCategoryModel(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryResponse>,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubCategoryModel extends _SubCategoryModel {
  const _$_SubCategoryModel({this.data = const [], this.total = 0}) : super._();

  factory _$_SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_SubCategoryModelFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<SubCategoryResponse> data;
  @JsonKey(defaultValue: 0)
  @override
  final int total;

  @override
  String toString() {
    return 'SubCategoryModel(data: $data, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubCategoryModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(total);

  @JsonKey(ignore: true)
  @override
  _$SubCategoryModelCopyWith<_SubCategoryModel> get copyWith =>
      __$SubCategoryModelCopyWithImpl<_SubCategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubCategoryModelToJson(this);
  }
}

abstract class _SubCategoryModel extends SubCategoryModel {
  const factory _SubCategoryModel({List<SubCategoryResponse> data, int total}) =
      _$_SubCategoryModel;
  const _SubCategoryModel._() : super._();

  factory _SubCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_SubCategoryModel.fromJson;

  @override
  List<SubCategoryResponse> get data => throw _privateConstructorUsedError;
  @override
  int get total => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SubCategoryModelCopyWith<_SubCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
