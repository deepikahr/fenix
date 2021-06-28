import 'package:fenix_user/models/api_response_models/banner_response/banner_response.dart';
import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';
part 'home_response.freezed.dart';
part 'home_response.g.dart';

@freezed
class HomeResponse with BaseModel<HomeResponse>, _$HomeResponse {
  const HomeResponse._();

  const factory HomeResponse({
    @Default([]) List<BannerResponse> banners,
    @Default([]) List<CategoryResponse> category,
  }) = _HomeResponse;

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  @override
  HomeResponse fromMap(Map<String, dynamic> map) {
    return HomeResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
