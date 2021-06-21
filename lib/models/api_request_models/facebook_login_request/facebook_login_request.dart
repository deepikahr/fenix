import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'facebook_login_request.freezed.dart';
part 'facebook_login_request.g.dart';

@freezed
class FacebookLoginRequest
    with BaseModel<FacebookLoginRequest>, _$FacebookLoginRequest {
  const FacebookLoginRequest._();

  const factory FacebookLoginRequest({
    String? facebookId,
    String? playerId,
  }) = _FacebookLoginRequest;

  factory FacebookLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$FacebookLoginRequestFromJson(json);

  @override
  FacebookLoginRequest fromMap(Map<String, dynamic> map) {
    return FacebookLoginRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
