import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/home_data_response/home_data_response.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';

part 'homeState.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    HomeDataResponse? homeData,
    UserAddress? userAddress,
  }) = _Default;
}
