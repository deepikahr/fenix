import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
class ErrorResponse with BaseModel<ErrorResponse>, _$ErrorResponse {
  const ErrorResponse._();

  const factory ErrorResponse(
      {int? status,
        bool? success,
        @Default([]) List<String> errors,
        String? message}) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  @override
  ErrorResponse fromMap(Map<String, dynamic> map) {
    return ErrorResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
