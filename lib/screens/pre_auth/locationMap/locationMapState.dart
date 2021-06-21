import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';

part 'locationMapState.freezed.dart';

@freezed
class LocationMapState with _$LocationMapState {
  const factory LocationMapState({
    @Default(false) isLoading,
    UserAddress? address,
  }) = _Default;
}
