import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@freezed
class BaseResponse with BaseModel<BaseResponse>, _$BaseResponse {
  const BaseResponse._();

  const factory BaseResponse({
    int? response_code,
    @Default(null) dynamic response_data,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  @override
  BaseResponse fromMap(Map<String, dynamic> map) {
    return BaseResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
