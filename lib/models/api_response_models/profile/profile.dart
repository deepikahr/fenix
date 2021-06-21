import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'profile.freezed.dart';

part 'profile.g.dart';

@freezed
class Profile with BaseModel<Profile>, _$Profile {
  const Profile._();

  const factory Profile({
    @JsonKey(name: '_id') String? id,
    String? mobileNumber,
    String? countryCode,
    String? email,
    String? profilePictureFilePath,
    String? profilePictureId,
    String? profilePictureUrl,
    String? firstName,
    String? lastName,
    double? walletAmount,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  @override
  Profile fromMap(Map<String, dynamic> map) {
    return Profile.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
