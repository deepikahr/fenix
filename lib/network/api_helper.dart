import 'dart:collection';
import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/models/api_response_model.dart';
import 'package:fenix_user/models/api_response_models/base_response/base_response.dart';
import 'package:fenix_user/models/api_response_models/error_response/error_response.dart';
import 'package:fenix_user/models/base_model.dart';
import 'package:fenix_user/screens/auth/login/login.dart';
import 'package:fenix_user/widgets/alertBox.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../database/db.dart';

class StatusCode {
  StatusCode._();

  static const SUCCESS = 200;
  static const CREATED = 201;
  static const BAD_REQUEST = 400;
  static const UNAUTHORIZED_OR_NOTFOUND = 401;
  static const SERVER_ERROR = 500;
}

class ApiHelper {
  final db = DB();
  Dio _getDio() {
    final dio = Dio();
    dio.options.baseUrl = Constants.apiUrl;
    dio.options.headers['Authorization'] = 'bearer ${db.getToken()}';

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('\n🎇🎇🎇 REQUEST 🎇🎇🎇');
          print('🎇🎇🎇 url: ${options.uri}');
          print('🎇🎇🎇 headers: ${options.headers}');
          printWrapped('🎇🎇🎇 data: ${options.data}');
          print('🎇🎇🎇 method: ${options.method}');
          print('🎇🎇🎇 queryParameters: ${options.queryParameters}');
          handler.next(options);
        },
        onResponse: (res, handler) {
          print('\n🎇🎇🎇 RESPONSE 🎇🎇🎇');
          print('🎇🎇🎇 url: ${res.requestOptions.uri}');
          print('🎇🎇🎇 status code: ${res.statusCode}');
          printWrapped('🎇🎇🎇 response: ${res.data}');
          handler.next(res);
        },
        onError: (e, handler) {
          if (e.response?.data != null) {
            final errorRes = ErrorResponse.fromJson(e.response?.data);
            print('\n🎇🎇🎇 ERROR 🎇🎇🎇');
            print('🎇🎇🎇 status code: ${e.response?.statusCode}');
            print('🎇🎇🎇 error: $errorRes');
          } else {
            print('\n🎇🎇🎇 ERROR 🎇🎇🎇');
            print('🎇🎇🎇 error: ${e.toString()}');
          }
          handler.next(e);
        },
      ),
    );

    return dio;
  }

  Future<T?> get<T extends BaseModel, U extends BaseModel>(String url,
      {U? reqModel,
        required T resModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<T>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().get(url, queryParameters: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }
    final output = _handleResponseForObject(res, resModel, responseListener);
    return output;
  }

  Future<List<T>?>
  getForArrayResponse<T extends BaseModel, U extends BaseModel>(String url,
      {U? reqModel,
        required T resModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<List<T>?>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().get(url, queryParameters: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }
    final output = _handleResponseForArray(res, resModel, responseListener);
    return output;
  }

  Future<String?> getForStringResponse<U extends BaseModel>(String url,
      {U? reqModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<String?>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().get(url, queryParameters: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }
    final output = _handleResponseForString(res, responseListener);
    return output;
  }

  Future<Map<String, dynamic>?> getForMapResponse<U extends BaseModel>(
      String url,
      {U? reqModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<Map<String, dynamic>?>>?
        responseListener}) async {
    Response res;
    try {
      res = await _getDio().get(url, queryParameters: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }
    final output = _handleResponseForMap(res, responseListener);
    return output;
  }

  Future<T?> post<T extends BaseModel, U extends BaseModel?>(String url,
      {required U reqModel,
        required T resModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<T>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().post(url, data: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }
    final output = _handleResponseForObject(res, resModel, responseListener);
    return output;
  }

  Future<List<T>?>
  postForArrayResponse<T extends BaseModel, U extends BaseModel>(String url,
      {required U reqModel,
        required T resModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<List<T>?>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().post(url, queryParameters: reqModel.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }

    final output = _handleResponseForArray(res, resModel, responseListener);

    return output;
  }

  Future<String?> postForStringResponse<U extends BaseModel?>(String url,
      {required U reqModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<String?>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().post(url, data: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }
    final output = _handleResponseForString(res, responseListener);
    return output;
  }

  Future<T?> imageUpload<T extends BaseModel>(String url,
      {required FormData reqModel,
        required T resModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<T>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().post(url, data: reqModel);
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }
    final output = _handleResponseForObject(res, resModel, responseListener);
    return output;
  }

  Future<T?> put<T extends BaseModel, U extends BaseModel>(String url,
      {U? reqModel,
        required T resModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<T>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().put(url, data: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }

    final output = _handleResponseForObject(res, resModel, responseListener);
    return output;
  }

  Future<List<T>?>
  putForArrayResponse<T extends BaseModel, U extends BaseModel>(String url,
      {U? reqModel,
        required T resModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<List<T>?>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().post(url, queryParameters: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }

    final output = _handleResponseForArray(res, resModel, responseListener);
    return output;
  }

  Future<String?> putForStringResponse<U extends BaseModel>(String url,
      {U? reqModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<String?>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().put(url, data: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }

    final output = _handleResponseForString(res, responseListener);

    return output;
  }

  Future<T?> delete<T extends BaseModel, U extends BaseModel>(String url,
      {U? reqModel,
        required T resModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<T>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().delete(url, data: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }

    final output = _handleResponseForObject(res, resModel, responseListener);

    return output;
  }

  Future<String?> deleteForStringResponse<U extends BaseModel>(String url,
      {U? reqModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<String?>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().delete(url, data: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }
    final output = _handleResponseForString(res, responseListener);
    return output;
  }

  Future<List<T>?>
  deleteForArrayResponse<T extends BaseModel, U extends BaseModel>(
      String url,
      {U? reqModel,
        required T resModel,
        ValueSetter<ErrorResponse>? errorListener,
        bool autoErrorHandle = true,
        ValueSetter<ApiResponse<List<T>?>>? responseListener}) async {
    Response res;
    try {
      res = await _getDio().delete(url, queryParameters: reqModel?.toMap());
    } on DioError catch (e) {
      return _handleError(e, autoErrorHandle, errorListener);
    }
    final output = _handleResponseForArray(res, resModel, responseListener);
    return output;
  }

  Null _handleError(DioError e, bool autoErrorHandle,
      ValueSetter<ErrorResponse>? errorListener) {
    if (e.response?.data == null) {
      customDialog(
        status: DIALOG_STATUS.FAIL,
        title: 'SERVER_NOT_RESPONDING'.tr,
      );
      return null;
    }
    final errorRes = ErrorResponse.fromJson(e.response!.data);
    errorListener?.call(errorRes);
    if (e.response?.statusCode == StatusCode.UNAUTHORIZED_OR_NOTFOUND) {
      customDialog(
          status: DIALOG_STATUS.WARNING,
          title: 'SESSION_EXPIRED'.tr,
          okText: 'LOGIN'.tr,
          onOkListener: () {
            Get.offAll(() => LoginPage());
          });
    } else if (autoErrorHandle) {
      customDialog(
        status: DIALOG_STATUS.FAIL,
        title: errorRes.errors.join('\n'),
      );
    }
    return null;
  }

  List<T>? _handleResponseForArray<T extends BaseModel>(Response? res,
      T resModel, ValueSetter<ApiResponse<List<T>?>>? responseListener) {
    if (res == null) {
      customDialog(
        status: DIALOG_STATUS.FAIL,
        title: 'SERVER_NOT_RESPONDING'.tr,
      );
      return null;
    }
    final baseRes = BaseResponse.fromJson(res.data);

    if (!(baseRes.response_data is List)) {
      throw '🎇🎇🎇 This is only used for ResponseType `List`, but here it is used for ResponseType `${baseRes.response_data.runtimeType}`';
    }

    final List<T>? output = baseRes.response_data
        .map((x) => resModel.fromMap(x))
        .toList()
        .cast<T>();
    if (responseListener != null) {
      responseListener(ApiResponse(output, baseRes.response_code!));
    }

    return output;
  }

  T? _handleResponseForObject<T extends BaseModel>(Response? res, T resModel,
      ValueSetter<ApiResponse<T>>? responseListener) {
    if (res == null) {
      customDialog(
        status: DIALOG_STATUS.FAIL,
        title: 'SERVER_NOT_RESPONDING'.tr,
      );
      return null;
    }
    final baseRes = BaseResponse.fromJson(res.data);
    if (!(baseRes.response_data is LinkedHashMap)) {
      throw '🎇🎇🎇 This is only used for ResponseType `Object`, but here it is used for ResponseType `${baseRes.response_data.runtimeType}`';
    }
    final output = resModel.fromMap(baseRes.response_data);
    if (responseListener != null) {
      responseListener(ApiResponse(output, baseRes.response_code!));
    }
    return output;
  }

  String? _handleResponseForString(
      Response? res, ValueSetter<ApiResponse<String?>>? responseListener) {
    if (res == null) {
      customDialog(
        status: DIALOG_STATUS.FAIL,
        title: 'SERVER_NOT_RESPONDING'.tr,
      );
      return null;
    }
    final baseRes = BaseResponse.fromJson(res.data);
    if (baseRes.response_data.runtimeType != String) {
      throw '🎇🎇🎇 This is only used for ResponseType `String`, but here it is used for ResponseType `${baseRes.response_data.runtimeType}`';
    }
    if (responseListener != null) {
      responseListener(
          ApiResponse(baseRes.response_data, baseRes.response_code!));
    }
    return baseRes.response_data;
  }

  Map<String, dynamic>? _handleResponseForMap(Response? res,
      ValueSetter<ApiResponse<Map<String, dynamic>?>>? responseListener) {
    if (res == null) {
      customDialog(
        status: DIALOG_STATUS.FAIL,
        title: 'SERVER_NOT_RESPONDING'.tr,
      );
      return null;
    }

    final baseRes = BaseResponse.fromJson(res.data);
    if (!(baseRes.response_data is LinkedHashMap)) {
      throw '🎇🎇🎇 This is only used for ResponseType `Object`, but here it is used for ResponseType `${baseRes.response_data.runtimeType}`';
    }
    final output = baseRes.response_data;
    if (responseListener != null) {
      responseListener(ApiResponse(output, baseRes.response_code!));
    }
    return output;
  }

}
