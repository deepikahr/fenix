import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

@freezed
class RegisterRequest with BaseModel<RegisterRequest>, _$RegisterRequest {
  const RegisterRequest._();

  const factory RegisterRequest({
    String? mobileNumber,
    String? countryCode,
    String? referralCode,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  @override
  RegisterRequest fromMap(Map<String, dynamic> map) {
    return RegisterRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
