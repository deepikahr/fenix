import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'tax_details_response.freezed.dart';
part 'tax_details_response.g.dart';

@freezed
class TaxDetailsResponse
    with BaseModel<TaxDetailsResponse>, _$TaxDetailsResponse {
  const TaxDetailsResponse._();

  const factory TaxDetailsResponse({
    @JsonKey(name: '_id') String? id,
    String? taxName,
    double? taxPercentage,
  }) = _TaxDetailsResponse;

  factory TaxDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$TaxDetailsResponseFromJson(json);

  @override
  TaxDetailsResponse fromMap(Map<String, dynamic> map) {
    return TaxDetailsResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
