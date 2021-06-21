import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'update_email_request.freezed.dart';
part 'update_email_request.g.dart';

@freezed
class UpdateEmailRequest
    with BaseModel<UpdateEmailRequest>, _$UpdateEmailRequest {
  const UpdateEmailRequest._();

  const factory UpdateEmailRequest({String? email}) = _UpdateEmailRequest;

  factory UpdateEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailRequestFromJson(json);

  @override
  UpdateEmailRequest fromMap(Map<String, dynamic> map) {
    return UpdateEmailRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
