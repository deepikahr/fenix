import 'package:fenix_user/models/api_request_models/otp_verify_request/otp_verify_request.dart';
import 'package:fenix_user/models/api_response_models/error_response/error_response.dart';
import 'package:fenix_user/models/api_response_models/otp_verify_response/otp_verify_response.dart';
import 'package:flutter/foundation.dart';
import 'package:fenix_user/models/api_response_model.dart';
import 'package:fenix_user/network/urls.dart';
import 'api_helper.dart';

class API {
  final _api = ApiHelper();

  Future<OtpVerifyResponse?> otpVerify(
      int? tableNumber,
      int? franchiseCode,
      String? password, {
        ValueSetter<ErrorResponse>? errorListener,
        ValueSetter<ApiResponse<OtpVerifyResponse>>? responseListener,
        bool autoErrorHandle = true,
      }) async {
    print('aaa $tableNumber, $franchiseCode, $password');
    return _api.post(
      URL.OTP_VERIFY,
      reqModel: OtpVerifyRequest(
        tableNumber: tableNumber,
        franchiseCode: franchiseCode,
        password: password,
      ),
      resModel: OtpVerifyResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

}
