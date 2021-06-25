import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'otp_verify_response.freezed.dart';
part 'otp_verify_response.g.dart';

@freezed
class OtpVerifyResponse with BaseModel<OtpVerifyResponse>, _$OtpVerifyResponse {
  const OtpVerifyResponse._();

  const factory OtpVerifyResponse({String? token, String? role, String? id, String? franchiseId, String? vendorId}) =
  _OtpVerifyResponse;

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyResponseFromJson(json);

  @override
  OtpVerifyResponse fromMap(Map<String, dynamic> map) {
    return OtpVerifyResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}

