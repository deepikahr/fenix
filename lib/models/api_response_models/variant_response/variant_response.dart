import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';

part 'variant_response.freezed.dart';
part 'variant_response.g.dart';

@freezed
class VariantResponse with BaseModel<VariantResponse>, _$VariantResponse {
  const VariantResponse._();

  const factory VariantResponse(
      {@JsonKey(name: '_id') String? id,
      String? size,
      double? price,
      String? sizeName,
      bool? isDefaultVariant,
      bool? outOfStock}) = _VariantResponse;

  factory VariantResponse.fromJson(Map<String, dynamic> json) =>
      _$VariantResponseFromJson(json);

  @override
  VariantResponse fromMap(Map<String, dynamic> map) {
    return VariantResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
