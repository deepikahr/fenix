import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/call_waiter_request/call_waiter_request.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_request_models/category_request/category_request.dart';
import 'package:fenix_user/models/api_request_models/change_password_request/change_password_request.dart';
import 'package:fenix_user/models/api_request_models/localizationDataRequest/localizationDataRequest.dart';
import 'package:fenix_user/models/api_request_models/login_verify_request/login_verify_request.dart';
import 'package:fenix_user/models/api_request_models/payment_request/payment_request.dart';
import 'package:fenix_user/models/api_request_models/settings_update_request/settings_update_request.dart';
import 'package:fenix_user/models/api_request_models/sub_category_request/sub_category_request.dart';
import 'package:fenix_user/models/api_request_models/update_cart/update_cart.dart';
import 'package:fenix_user/models/api_response_model.dart';
import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:fenix_user/models/api_response_models/error_response/error_response.dart';
import 'package:fenix_user/models/api_response_models/home_response/home_response.dart';
import 'package:fenix_user/models/api_response_models/language_response/language_response.dart';
import 'package:fenix_user/models/api_response_models/login_verify_response/login_verify_response.dart';
import 'package:fenix_user/models/api_response_models/menu_response/menu_response.dart';
import 'package:fenix_user/models/api_response_models/notification_response/notification_response.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/models/api_response_models/order_response/order_response.dart';
import 'package:fenix_user/models/api_response_models/product_data_response/product_data_response.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:fenix_user/models/api_response_models/sub_category_model/sub_category_model.dart';
import 'package:fenix_user/network/urls.dart';
import 'package:fenix_user/screens/category/category.dart';
import 'package:flutter/foundation.dart';

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

  Future<String?> settingUpdate(
    SettingsUpdateRequest settingsUpdateRequest, {
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

  Future<ProductDataResponse?> productList(String categoryId,
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

  Future<String?> updateOrder(
    UpdateCart updatedCart, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<String?>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.putForStringResponse(
      URL.UPDATE_ORDER,
      errorListener: errorListener,
      reqModel: updatedCart,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<OrderDetailsResponse?> orderDetails(String orderId,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<OrderDetailsResponse>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.ORDER_DETAILS + '$orderId',
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

  Future<List<NotificationResponse>?> notificationList(
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<List<NotificationResponse>?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.getForArrayResponse(
      URL.CALL_WAITER_LIST,
      resModel: NotificationResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<List<LanguageResponse>?> languages({
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<List<LanguageResponse>?>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.getForArrayResponse(
      URL.LANGUAGES,
      resModel: LanguageResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<List<CategoryResponse>?> category(CATEGORY_TYPE type, int page,
      {ValueSetter<ErrorResponse>? errorListener,
      int limit = 10,
      ValueSetter<ApiResponse<List<CategoryResponse>?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.getForArrayResponse(
      URL.CATEGORY,
      reqModel: CategoryRequest(topCategory: type, page: page, limit: limit),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
      resModel: CategoryResponse(),
    );
  }

  Future<SubCategoryModel?> subCategory(String? categoryId, int page,
      {ValueSetter<ErrorResponse>? errorListener,
      int limit = 10,
      ValueSetter<ApiResponse<SubCategoryModel?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.get(URL.SUB_CATEGORY,
        reqModel: SubCategoryRequest(category: categoryId),
        errorListener: errorListener,
        autoErrorHandle: autoErrorHandle,
        responseListener: responseListener,
        resModel: SubCategoryModel());
  }

  Future<Map<String, Map<String, String>>?> getLocalizationData(
    String? code, {
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<Map<String, Map<String, String>>?>>?
        responseListener,
  }) async {
    final output = await _api.getForMapResponse(
      URL.GET_LOCALIZATION_JSON,
      reqModel: LocalizationDataRequest(code: code),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
    );
    return output
        ?.map((key, value) => MapEntry(key, Map<String, String>.from(value)));
  }

  Future<String?> paymentRequest(
    PaymentRequest paymentRequest, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<String?>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.postForStringResponse(
      URL.PAYMENT_REQUEST,
      reqModel: paymentRequest,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }
}
