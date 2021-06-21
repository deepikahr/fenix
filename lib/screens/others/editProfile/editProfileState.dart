import 'package:freezed_annotation/freezed_annotation.dart';

part 'editProfileState.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState(
      {@Default(false) bool isLoading,
      @Default(false) bool isProfilePicRemove,
      String? imageUrl,
      @Default(false) bool isPicLoading}) = _Default;
}
