import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'add_money_response.freezed.dart';
part 'add_money_response.g.dart';

@freezed
class AddMoneyResponse with BaseModel<AddMoneyResponse>, _$AddMoneyResponse {
  const AddMoneyResponse._();

  const factory AddMoneyResponse({
    String? message,
    @JsonKey(name: 'client_secret') String? clientSecret,
  }) = _AddMoneyResponse;

  factory AddMoneyResponse.fromJson(Map<String, dynamic> json) =>
      _$AddMoneyResponseFromJson(json);

  @override
  AddMoneyResponse fromMap(Map<String, dynamic> map) {
    return AddMoneyResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
