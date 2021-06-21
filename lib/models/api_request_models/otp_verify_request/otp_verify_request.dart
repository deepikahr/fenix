import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'otp_verify_request.freezed.dart';
part 'otp_verify_request.g.dart';

@freezed
class OtpVerifyRequest with BaseModel<OtpVerifyRequest>, _$OtpVerifyRequest {
  const OtpVerifyRequest._();

  const factory OtpVerifyRequest({
    String? mobileNumber,
    String? otp,
    String? sId,
    String? playerId,
  }) = _OtpVerifyRequest;

  factory OtpVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyRequestFromJson(json);

  @override
  OtpVerifyRequest fromMap(Map<String, dynamic> map) {
    return OtpVerifyRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
