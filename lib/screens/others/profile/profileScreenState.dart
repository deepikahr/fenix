import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/profile/profile.dart';

part 'profileScreenState.freezed.dart';

@freezed
class ProfileScreenState with _$ProfileScreenState {
  const factory ProfileScreenState({
    @Default(false) bool isLoading,
    @Default(false) bool checkUserLogin,
    Profile? profile,
  }) = _Default;
}
