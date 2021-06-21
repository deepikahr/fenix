import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/location/location.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'user_address.freezed.dart';
part 'user_address.g.dart';

@freezed
class UserAddress with BaseModel<UserAddress>, _$UserAddress {
  const UserAddress._();

  const factory UserAddress({
    @JsonKey(name: '_id') String? id,
    @Default('OTHERS') String addressType,
    String? address,
    String? houseInfo,
    String? postalCode,
    String? landmark,
    Location? location,
    @Default(false) bool isDefault,
  }) = _UserAddress;

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);

  @override
  UserAddress fromMap(Map<String, dynamic> map) {
    return UserAddress.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
