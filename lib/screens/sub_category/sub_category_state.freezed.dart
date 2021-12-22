// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sub_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SubCategoryStateTearOff {
  const _$SubCategoryStateTearOff();

  _Default call(
      {bool isLoading = false,
      List<SubCategoryResponse> subCategory = const [],
      int total = 0,
      int pageNumber = 1}) {
    return _Default(
      isLoading: isLoading,
      subCategory: subCategory,
      total: total,
      pageNumber: pageNumber,
    );
  }
}

/// @nodoc
const $SubCategoryState = _$SubCategoryStateTearOff();

/// @nodoc
mixin _$SubCategoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<SubCategoryResponse> get subCategory =>
      throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubCategoryStateCopyWith<SubCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryStateCopyWith<$Res> {
  factory $SubCategoryStateCopyWith(
          SubCategoryState value, $Res Function(SubCategoryState) then) =
      _$SubCategoryStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<SubCategoryResponse> subCategory,
      int total,
      int pageNumber});
}

/// @nodoc
class _$SubCategoryStateCopyWithImpl<$Res>
    implements $SubCategoryStateCopyWith<$Res> {
  _$SubCategoryStateCopyWithImpl(this._value, this._then);

  final SubCategoryState _value;
  // ignore: unused_field
  final $Res Function(SubCategoryState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? subCategory = freezed,
    Object? total = freezed,
    Object? pageNumber = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryResponse>,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res>
    implements $SubCategoryStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<SubCategoryResponse> subCategory,
      int total,
      int pageNumber});
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$SubCategoryStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? subCategory = freezed,
    Object? total = freezed,
    Object? pageNumber = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryResponse>,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.isLoading = false,
      this.subCategory = const [],
      this.total = 0,
      this.pageNumber = 1});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: const [])
  @override
  final List<SubCategoryResponse> subCategory;
  @JsonKey(defaultValue: 0)
  @override
  final int total;
  @JsonKey(defaultValue: 1)
  @override
  final int pageNumber;

  @override
  String toString() {
    return 'SubCategoryState(isLoading: $isLoading, subCategory: $subCategory, total: $total, pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.subCategory, subCategory) ||
                const DeepCollectionEquality()
                    .equals(other.subCategory, subCategory)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(subCategory) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(pageNumber);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements SubCategoryState {
  const factory _Default(
      {bool isLoading,
      List<SubCategoryResponse> subCategory,
      int total,
      int pageNumber}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  List<SubCategoryResponse> get subCategory =>
      throw _privateConstructorUsedError;
  @override
  int get total => throw _privateConstructorUsedError;
  @override
  int get pageNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
