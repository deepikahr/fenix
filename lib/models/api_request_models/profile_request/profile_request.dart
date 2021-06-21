import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';
part 'profile_request.freezed.dart';
part 'profile_request.g.dart';

@freezed
class ProfileRequest with BaseModel<ProfileRequest>, _$ProfileRequest {
  const ProfileRequest._();

  const factory ProfileRequest({
    String? email,
    String? imageUrl,
    String? imageId,
    String? filePath,
    String? firstName,
    String? lastName,
  }) = _ProfileRequest;

  factory ProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestFromJson(json);

  @override
  ProfileRequest fromMap(Map<String, dynamic> map) {
    return ProfileRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
