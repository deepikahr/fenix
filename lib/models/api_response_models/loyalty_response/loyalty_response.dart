import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/loyalty/loyalty.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'loyalty_response.freezed.dart';
part 'loyalty_response.g.dart';

@freezed
class LoyaltyResponse with BaseModel<LoyaltyResponse>, _$LoyaltyResponse {
  const LoyaltyResponse._();

  const factory LoyaltyResponse(
      {@Default([]) List<Loyalty> data,
      @Default(0) int total}) = _LoyaltyResponse;

  factory LoyaltyResponse.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyResponseFromJson(json);

  @override
  LoyaltyResponse fromMap(Map<String, dynamic> map) {
    return LoyaltyResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
