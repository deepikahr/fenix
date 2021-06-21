import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';

part 'manageAddressState.freezed.dart';

@freezed
class ManageAddressState with _$ManageAddressState {
  const factory ManageAddressState({
    @Default(false) bool isLoading,
    @Default([]) List<UserAddress> addressList,
    @Default(0) int total,
  }) = _Default;
}
