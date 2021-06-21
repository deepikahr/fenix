import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'loyalty.freezed.dart';

part 'loyalty.g.dart';

@freezed
class Loyalty with BaseModel<Loyalty>, _$Loyalty {
  const Loyalty._();

  const factory Loyalty({
    @JsonKey(name: '_id') String? id,
    @Default(0) num point,
    @Default(0) num loyaltyPoint,
    @Default(0) num loyaltyPointMonetaryValue,
    @Default(false) bool isCredited,
    String? userId,
    String? description,
    String? loyaltyType,
    String? createdAt,
    String? updatedAt,
  }) = _Loyalty;

  factory Loyalty.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyFromJson(json);

  @override
  Loyalty fromMap(Map<String, dynamic> map) {
    return Loyalty.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
