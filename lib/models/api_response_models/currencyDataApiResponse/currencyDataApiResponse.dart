import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'currencyDataApiResponse.freezed.dart';
part 'currencyDataApiResponse.g.dart';

@freezed
class CurrencyDataApiResponse
    with BaseModel<CurrencyDataApiResponse>, _$CurrencyDataApiResponse {
  const CurrencyDataApiResponse._();

  const factory CurrencyDataApiResponse({
    @Default('Rs') String currencySymbol,
    @Default('Indian') String currencyName,
  }) = _CurrencyDataApiResponse;

  factory CurrencyDataApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDataApiResponseFromJson(json);

  @override
  CurrencyDataApiResponse fromMap(Map<String, dynamic> map) {
    return CurrencyDataApiResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
