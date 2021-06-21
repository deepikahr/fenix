import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'discount.freezed.dart';

part 'discount.g.dart';

@freezed
class Discount with BaseModel<Discount>, _$Discount {
  const Discount._();

  const factory Discount({
    @JsonKey(name: '_id') String? id,
    @Default(false) bool isDiscountAvailable,
    @Default(0) int discountPercentage,
  }) = _Discount;

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  @override
  Discount fromMap(Map<String, dynamic> map) {
    return Discount.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
