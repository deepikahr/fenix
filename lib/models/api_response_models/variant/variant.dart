import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant_saas/models/base_model.dart';

part 'variant.freezed.dart';
part 'variant.g.dart';

@freezed
class Variant with BaseModel<Variant>, _$Variant {
  const Variant._();

  const factory Variant({
    @JsonKey(name: '_id') String? id,
    String? size,
    double? price,
    String? sizeName,
    bool? isDefaultVariant,
    bool? outOfStock,
  }) = _Variant;

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  @override
  Variant fromMap(Map<String, dynamic> map) {
    return Variant.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
