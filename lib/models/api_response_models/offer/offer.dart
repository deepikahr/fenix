import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'offer.freezed.dart';

part 'offer.g.dart';

enum COUPON_TYPES {
  @JsonValue('PERCENTAGE')
  percentage,
  @JsonValue('AMOUNT')
  amount,
}

enum COUPON_FOR {
  @JsonValue('ORDER')
  order,
  @JsonValue('CATEGORY')
  category,
  @JsonValue('PRODUCT')
  product,
}

@freezed
class Offer with BaseModel<Offer>, _$Offer {
  const Offer._();

  const factory Offer({
    @JsonKey(name: '_id') String? id,
    String? couponCode,
    @Default(0) int offerValue,
    COUPON_TYPES? couponType,
    COUPON_FOR? couponFor,
    String? imageUrl,
    String? filePath,
    int? discount,
    String? description,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  @override
  Offer fromMap(Map<String, dynamic> map) {
    return Offer.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
