import 'package:fenix_user/models/api_response_models/banner_response/banner_response.dart';
import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) isLoading,
    @Default([]) List<BannerResponse> banners,
    @Default([]) List<CategoryResponse> categories,
  }) = _Default;
}
