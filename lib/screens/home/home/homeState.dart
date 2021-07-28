import 'package:fenix_user/models/api_response_models/home_response/home_response.dart';
import 'package:fenix_user/models/api_response_models/language_response/language_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'homeState.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    HomeResponse? homeData,
  }) = _Default;
}
