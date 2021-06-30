// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ingredients_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientsModel _$IngredientsModelFromJson(Map<String, dynamic> json) {
  return _IngredientsModel.fromJson(json);
}

/// @nodoc
class _$IngredientsModelTearOff {
  const _$IngredientsModelTearOff();

  _IngredientsModel call({@JsonKey(name: '_id') String? id, String? title}) {
    return _IngredientsModel(
      id: id,
      title: title,
    );
  }

  IngredientsModel fromJson(Map<String, Object> json) {
    return IngredientsModel.fromJson(json);
  }
}

/// @nodoc
const $IngredientsModel = _$IngredientsModelTearOff();

/// @nodoc
mixin _$IngredientsModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientsModelCopyWith<IngredientsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientsModelCopyWith<$Res> {
  factory $IngredientsModelCopyWith(
          IngredientsModel value, $Res Function(IngredientsModel) then) =
      _$IngredientsModelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: '_id') String? id, String? title});
}

/// @nodoc
class _$IngredientsModelCopyWithImpl<$Res>
    implements $IngredientsModelCopyWith<$Res> {
  _$IngredientsModelCopyWithImpl(this._value, this._then);

  final IngredientsModel _value;
  // ignore: unused_field
  final $Res Function(IngredientsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$IngredientsModelCopyWith<$Res>
    implements $IngredientsModelCopyWith<$Res> {
  factory _$IngredientsModelCopyWith(
          _IngredientsModel value, $Res Function(_IngredientsModel) then) =
      __$IngredientsModelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: '_id') String? id, String? title});
}

/// @nodoc
class __$IngredientsModelCopyWithImpl<$Res>
    extends _$IngredientsModelCopyWithImpl<$Res>
    implements _$IngredientsModelCopyWith<$Res> {
  __$IngredientsModelCopyWithImpl(
      _IngredientsModel _value, $Res Function(_IngredientsModel) _then)
      : super(_value, (v) => _then(v as _IngredientsModel));

  @override
  _IngredientsModel get _value => super._value as _IngredientsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_IngredientsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IngredientsModel extends _IngredientsModel {
  const _$_IngredientsModel({@JsonKey(name: '_id') this.id, this.title})
      : super._();

  factory _$_IngredientsModel.fromJson(Map<String, dynamic> json) =>
      _$_$_IngredientsModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? title;

  @override
  String toString() {
    return 'IngredientsModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IngredientsModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$IngredientsModelCopyWith<_IngredientsModel> get copyWith =>
      __$IngredientsModelCopyWithImpl<_IngredientsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IngredientsModelToJson(this);
  }
}

abstract class _IngredientsModel extends IngredientsModel {
  const factory _IngredientsModel(
      {@JsonKey(name: '_id') String? id, String? title}) = _$_IngredientsModel;
  const _IngredientsModel._() : super._();

  factory _IngredientsModel.fromJson(Map<String, dynamic> json) =
      _$_IngredientsModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IngredientsModelCopyWith<_IngredientsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
