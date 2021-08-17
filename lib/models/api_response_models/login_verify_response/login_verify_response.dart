import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'login_verify_response.freezed.dart';
part 'login_verify_response.g.dart';

@freezed
class LoginVerifyResponse
    with BaseModel<LoginVerifyResponse>, _$LoginVerifyResponse {
  const LoginVerifyResponse._();

  const factory LoginVerifyResponse(
      {String? token,
      String? role,
      String? id,
      String? franchiseId,
      String? vendorId}) = _LoginVerifyResponse;

  factory LoginVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginVerifyResponseFromJson(json);

  @override
  LoginVerifyResponse fromMap(Map<String, dynamic> map) {
    return LoginVerifyResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
