import 'package:fenix_user/models/api_request_models/change_password_request/change_password_request.dart';
import 'package:fenix_user/models/api_request_models/login_verify_request/login_verify_request.dart';
import 'package:fenix_user/models/api_response_models/error_response/error_response.dart';
import 'package:fenix_user/models/api_response_models/login_verify_response/login_verify_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:flutter/foundation.dart';
import 'package:fenix_user/models/api_response_model.dart';
import 'package:fenix_user/network/urls.dart';
import 'api_helper.dart';

class API {
  final _api = ApiHelper();

  Future<LoginVerifyResponse?> loginVerify(
      int? tableNumber,
      int? franchiseCode,
      String? password, {
        ValueSetter<ErrorResponse>? errorListener,
        ValueSetter<ApiResponse<LoginVerifyResponse>>? responseListener,
        bool autoErrorHandle = true,
      }) async {
    return _api.post(
      URL.LOGIN_VERIFY,
      reqModel: LoginVerifyRequest(
        tableNumber: tableNumber,
        franchiseCode: franchiseCode,
        password: password,
      ),
      resModel: LoginVerifyResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }


  Future<String?> changePassword(ChangePasswordRequest changePasswordRequest,
      {ValueSetter<ErrorResponse>? errorListener,
        ValueSetter<ApiResponse<String?>>? responseListener,
        bool autoErrorHandle = true}) async {
    return _api.postForStringResponse(
      URL.CHANGE_PASSWORD,
      reqModel: changePasswordRequest,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<SettingsResponse?> settings(
      {ValueSetter<ErrorResponse>? errorListener,
        ValueSetter<ApiResponse<SettingsResponse>>? responseListener,
        bool autoErrorHandle = true}) async {
    return _api.get(
      URL.SETTINGS,
      resModel: SettingsResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

}
