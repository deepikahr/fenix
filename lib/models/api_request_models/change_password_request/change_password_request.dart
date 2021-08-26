import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'change_password_request.freezed.dart';
part 'change_password_request.g.dart';

@freezed
class ChangePasswordRequest with BaseModel<ChangePasswordRequest>, _$ChangePasswordRequest {
  const ChangePasswordRequest._();

  const factory ChangePasswordRequest({
    String? currentPassword,
    String? newPassword
  }) = _ChangePasswordRequest;

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  @override
  ChangePasswordRequest fromMap(Map<String, dynamic> map) {
    return ChangePasswordRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
