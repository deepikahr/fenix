// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationResponse _$NotificationResponseFromJson(Map<String, dynamic> json) {
  return _NotificationResponse.fromJson(json);
}

/// @nodoc
class _$NotificationResponseTearOff {
  const _$NotificationResponseTearOff();

  _NotificationResponse call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? description,
      int? tableNumber,
      String? franchiseId,
      String? notifyType,
      String? createdAt}) {
    return _NotificationResponse(
      id: id,
      title: title,
      description: description,
      tableNumber: tableNumber,
      franchiseId: franchiseId,
      notifyType: notifyType,
      createdAt: createdAt,
    );
  }

  NotificationResponse fromJson(Map<String, Object> json) {
    return NotificationResponse.fromJson(json);
  }
}

/// @nodoc
const $NotificationResponse = _$NotificationResponseTearOff();

/// @nodoc
mixin _$NotificationResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get tableNumber => throw _privateConstructorUsedError;
  String? get franchiseId => throw _privateConstructorUsedError;
  String? get notifyType => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationResponseCopyWith<NotificationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationResponseCopyWith<$Res> {
  factory $NotificationResponseCopyWith(NotificationResponse value,
          $Res Function(NotificationResponse) then) =
      _$NotificationResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? description,
      int? tableNumber,
      String? franchiseId,
      String? notifyType,
      String? createdAt});
}

/// @nodoc
class _$NotificationResponseCopyWithImpl<$Res>
    implements $NotificationResponseCopyWith<$Res> {
  _$NotificationResponseCopyWithImpl(this._value, this._then);

  final NotificationResponse _value;
  // ignore: unused_field
  final $Res Function(NotificationResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? tableNumber = freezed,
    Object? franchiseId = freezed,
    Object? notifyType = freezed,
    Object? createdAt = freezed,
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      notifyType: notifyType == freezed
          ? _value.notifyType
          : notifyType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NotificationResponseCopyWith<$Res>
    implements $NotificationResponseCopyWith<$Res> {
  factory _$NotificationResponseCopyWith(_NotificationResponse value,
          $Res Function(_NotificationResponse) then) =
      __$NotificationResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? description,
      int? tableNumber,
      String? franchiseId,
      String? notifyType,
      String? createdAt});
}

/// @nodoc
class __$NotificationResponseCopyWithImpl<$Res>
    extends _$NotificationResponseCopyWithImpl<$Res>
    implements _$NotificationResponseCopyWith<$Res> {
  __$NotificationResponseCopyWithImpl(
      _NotificationResponse _value, $Res Function(_NotificationResponse) _then)
      : super(_value, (v) => _then(v as _NotificationResponse));

  @override
  _NotificationResponse get _value => super._value as _NotificationResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? tableNumber = freezed,
    Object? franchiseId = freezed,
    Object? notifyType = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_NotificationResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      notifyType: notifyType == freezed
          ? _value.notifyType
          : notifyType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationResponse extends _NotificationResponse {
  const _$_NotificationResponse(
      {@JsonKey(name: '_id') this.id,
      this.title,
      this.description,
      this.tableNumber,
      this.franchiseId,
      this.notifyType,
      this.createdAt})
      : super._();

  factory _$_NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_NotificationResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? tableNumber;
  @override
  final String? franchiseId;
  @override
  final String? notifyType;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'NotificationResponse(id: $id, title: $title, description: $description, tableNumber: $tableNumber, franchiseId: $franchiseId, notifyType: $notifyType, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.tableNumber, tableNumber) ||
                const DeepCollectionEquality()
                    .equals(other.tableNumber, tableNumber)) &&
            (identical(other.franchiseId, franchiseId) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseId, franchiseId)) &&
            (identical(other.notifyType, notifyType) ||
                const DeepCollectionEquality()
                    .equals(other.notifyType, notifyType)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(tableNumber) ^
      const DeepCollectionEquality().hash(franchiseId) ^
      const DeepCollectionEquality().hash(notifyType) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$NotificationResponseCopyWith<_NotificationResponse> get copyWith =>
      __$NotificationResponseCopyWithImpl<_NotificationResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotificationResponseToJson(this);
  }
}

abstract class _NotificationResponse extends NotificationResponse {
  const factory _NotificationResponse(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? description,
      int? tableNumber,
      String? franchiseId,
      String? notifyType,
      String? createdAt}) = _$_NotificationResponse;
  const _NotificationResponse._() : super._();

  factory _NotificationResponse.fromJson(Map<String, dynamic> json) =
      _$_NotificationResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  int? get tableNumber => throw _privateConstructorUsedError;
  @override
  String? get franchiseId => throw _privateConstructorUsedError;
  @override
  String? get notifyType => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationResponseCopyWith<_NotificationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
