import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant_saas/models/api_response_models/image/image_model.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
class BannerModel with BaseModel<BannerModel>, _$BannerModel {
  const BannerModel._();

  const factory BannerModel({
    ImageModel? image,
    @JsonKey(name: '_id') String? id,
    bool? status,
    String? bannerType,
    String? franchiseId,
    String? title,
    String? description,
    String? productId,
    String? productName,
    String? categoryId,
    String? categoryName,
    String? franchiseName,
    String? vendorId,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  @override
  BannerModel fromMap(Map<String, dynamic> map) {
    return BannerModel.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
