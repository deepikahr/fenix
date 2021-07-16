import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/call_waiter_request/call_waiter_request.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_request_models/change_password_request/change_password_request.dart';
import 'package:fenix_user/models/api_request_models/login_verify_request/login_verify_request.dart';
import 'package:fenix_user/models/api_request_models/settings_update_request/settings_update_request.dart';
import 'package:fenix_user/models/api_response_models/error_response/error_response.dart';
import 'package:fenix_user/models/api_response_models/home_response/home_response.dart';
import 'package:fenix_user/models/api_response_models/login_verify_response/login_verify_response.dart';
import 'package:fenix_user/models/api_response_models/menu_response/menu_response.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/models/api_response_models/order_response/order_response.dart';
import 'package:fenix_user/models/api_response_models/product_data_response/product_data_response.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:fenix_user/screens/home/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:fenix_user/models/api_response_model.dart';
import 'package:fenix_user/network/urls.dart';
import '../main.dart';
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

  Future<String?> changePassword(ChangePasswordRequest? changePasswordRequest,
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

  Future<HomeResponse?> home({
        ValueSetter<ErrorResponse>? errorListener,
        ValueSetter<ApiResponse<HomeResponse>>? responseListener,
        bool autoErrorHandle = true,
      }) async {
    return _api.get(
      URL.HOME + '${DB().getMenuId()}',
      resModel: HomeResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> settingUpdate(SettingsUpdateRequest settingsUpdateRequest, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<String?>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.putForStringResponse(
      URL.SETTINGS_UPDATE + '${DB().getId()}',
      reqModel: settingsUpdateRequest,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<List<MenuResponse>?> menuDropdown({
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<List<MenuResponse>?>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.getForArrayResponse(
      URL.MENU_DROPDOWN + '${DB().getFranchiseId()}',
      resModel: MenuResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<ProductDataResponse?> productList(String? categoryId,
      {ValueSetter<ErrorResponse>? errorListener,
        ValueSetter<ApiResponse<ProductDataResponse>>? responseListener,
        bool autoErrorHandle = true}) async {
    return _api.get(
      URL.PRODUCT_LIST + '$categoryId',
      resModel: ProductDataResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<ProductDetailsResponse?> productDetails(String? productId,
      {ValueSetter<ErrorResponse>? errorListener,
        ValueSetter<ApiResponse<ProductDetailsResponse>>? responseListener,
        bool autoErrorHandle = true}) async {
    return _api.get(
      URL.PRODUCT_DETAILS + '$productId',
      resModel: ProductDetailsResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<OrderResponse?> createOrder(
      Cart cart, {
        ValueSetter<ErrorResponse>? errorListener,
        ValueSetter<ApiResponse<OrderResponse>>? responseListener,
        bool autoErrorHandle = true,
      }) async {
    return _api.post(
      URL.CREATE_ORDER,
      errorListener: errorListener,
      reqModel: cart,
      resModel: OrderResponse(),
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<OrderDetailsResponse?> orderDetails(
      {ValueSetter<ErrorResponse>? errorListener,
        ValueSetter<ApiResponse<OrderDetailsResponse>>? responseListener,
        bool autoErrorHandle = true}) async {
    return _api.get(
      URL.ORDER_DETAILS + '${DB().getOrderId()}',
      resModel: OrderDetailsResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> callWaiter(CallWaiterRequest? callWaiterRequest,
      {ValueSetter<ErrorResponse>? errorListener,
        ValueSetter<ApiResponse<String?>>? responseListener,
        bool autoErrorHandle = true}) async {
    return _api.postForStringResponse(
      URL.CALL_WAITER,
      reqModel: callWaiterRequest,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }


}
