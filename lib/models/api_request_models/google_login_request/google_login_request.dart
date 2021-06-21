import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'google_login_request.freezed.dart';
part 'google_login_request.g.dart';

@freezed
class GoogleLoginRequest
    with BaseModel<GoogleLoginRequest>, _$GoogleLoginRequest {
  const GoogleLoginRequest._();

  const factory GoogleLoginRequest({
    String? googleId,
    String? playerId,
  }) = _GoogleLoginRequest;

  factory GoogleLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginRequestFromJson(json);

  @override
  GoogleLoginRequest fromMap(Map<String, dynamic> map) {
    return GoogleLoginRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
