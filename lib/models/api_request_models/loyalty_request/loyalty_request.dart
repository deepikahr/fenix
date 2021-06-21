import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'loyalty_request.freezed.dart';

part 'loyalty_request.g.dart';

@freezed
class LoyaltyRequest with BaseModel<LoyaltyRequest>, _$LoyaltyRequest {
  const LoyaltyRequest._();

  const factory LoyaltyRequest({double? loyaltyPoint}) = _LoyaltyRequest;

  factory LoyaltyRequest.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyRequestFromJson(json);

  @override
  LoyaltyRequest fromMap(Map<String, dynamic> map) {
    return LoyaltyRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
