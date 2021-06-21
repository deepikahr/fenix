import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'update_me_request.freezed.dart';
part 'update_me_request.g.dart';

@freezed
class UpdateMeRequest with BaseModel<UpdateMeRequest>, _$UpdateMeRequest {
  const UpdateMeRequest._();

  const factory UpdateMeRequest({String? firstName, String? lastName}) =
      _UpdateMeRequest;

  factory UpdateMeRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateMeRequestFromJson(json);

  @override
  UpdateMeRequest fromMap(Map<String, dynamic> map) {
    return UpdateMeRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
