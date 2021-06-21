import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'delivery_boy_info.freezed.dart';
part 'delivery_boy_info.g.dart';

@freezed
class DeliveryBoyInfo with BaseModel<DeliveryBoyInfo>, _$DeliveryBoyInfo {
  const DeliveryBoyInfo._();

  const factory DeliveryBoyInfo({
    @JsonKey(name: '_id') String? id,
    String? firstName,
    String? mobileNumber,
  }) = _DeliveryBoyInfo;

  factory DeliveryBoyInfo.fromJson(Map<String, dynamic> json) =>
      _$DeliveryBoyInfoFromJson(json);

  @override
  DeliveryBoyInfo fromMap(Map<String, dynamic> map) {
    return DeliveryBoyInfo.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
