import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'add_money_request.freezed.dart';
part 'add_money_request.g.dart';

@freezed
class AddMoneyRequest with BaseModel<AddMoneyRequest>, _$AddMoneyRequest {
  const AddMoneyRequest._();

  const factory AddMoneyRequest({
    double? amount,
    String? paymentMethodId,
    String? paymentMethodType,
  }) = _AddMoneyRequest;
  factory AddMoneyRequest.fromJson(Map<String, dynamic> json) =>
      _$AddMoneyRequestFromJson(json);

  @override
  AddMoneyRequest fromMap(Map<String, dynamic> map) {
    return AddMoneyRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
