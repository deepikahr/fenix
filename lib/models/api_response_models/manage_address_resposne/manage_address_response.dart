import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'manage_address_response.freezed.dart';
part 'manage_address_response.g.dart';

@freezed
class ManageAddressReponse
    with BaseModel<ManageAddressReponse>, _$ManageAddressReponse {
  const ManageAddressReponse._();

  const factory ManageAddressReponse({
    @Default(0) int total,
    @Default([]) List<UserAddress> data,
  }) = _ManageAddressReponse;

  factory ManageAddressReponse.fromJson(Map<String, dynamic> json) =>
      _$ManageAddressReponseFromJson(json);

  @override
  ManageAddressReponse fromMap(Map<String, dynamic> map) {
    return ManageAddressReponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
