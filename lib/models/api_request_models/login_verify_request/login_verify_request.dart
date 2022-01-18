import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'login_verify_request.freezed.dart';
part 'login_verify_request.g.dart';

@freezed
class LoginVerifyRequest
    with BaseModel<LoginVerifyRequest>, _$LoginVerifyRequest {
  const LoginVerifyRequest._();

  const factory LoginVerifyRequest({
    int? tableNumber,
    int? franchiseCode,
    int? password,
  }) = _LoginVerifyRequest;

  factory LoginVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginVerifyRequestFromJson(json);

  @override
  LoginVerifyRequest fromMap(Map<String, dynamic> map) {
    return LoginVerifyRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
