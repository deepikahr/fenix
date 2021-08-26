import 'package:fenix_user/models/api_response_models/image_response/image_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';
part 'banner_response.freezed.dart';
part 'banner_response.g.dart';

@freezed
class BannerResponse with BaseModel<BannerResponse>, _$BannerResponse {
  const BannerResponse._();

  const factory BannerResponse({
    @JsonKey(name: '_id') String? id,
    ImageResponse? image,
    String? title
  }) = _BannerResponse;

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);

  @override
  BannerResponse fromMap(Map<String, dynamic> map) {
    return BannerResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}


