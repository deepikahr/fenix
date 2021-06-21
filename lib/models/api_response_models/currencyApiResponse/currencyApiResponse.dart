import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/currencyDataApiResponse/currencyDataApiResponse.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'currencyApiResponse.freezed.dart';
part 'currencyApiResponse.g.dart';

@freezed
class CurrencyApiResponse
    with BaseModel<CurrencyApiResponse>, _$CurrencyApiResponse {
  const CurrencyApiResponse._();

  const factory CurrencyApiResponse({
    @JsonKey(name: '_id') String? id,
    CurrencyDataApiResponse? currencySetting,
  }) = _CurrencyApiResponse;

  factory CurrencyApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyApiResponseFromJson(json);

  @override
  CurrencyApiResponse fromMap(Map<String, dynamic> map) {
    return CurrencyApiResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
