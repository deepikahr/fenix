import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'image_request.freezed.dart';

part 'image_request.g.dart';

@freezed
class ImageRequest with BaseModel<ImageRequest>, _$ImageRequest {
  const ImageRequest._();

  const factory ImageRequest({
    String? profilePictureUrl,
    String? profilePictureId,
    String? profilePictureFilePath,
  }) = _ImageRequest;

  factory ImageRequest.fromJson(Map<String, dynamic> json) =>
      _$ImageRequestFromJson(json);

  @override
  ImageRequest fromMap(Map<String, dynamic> map) {
    return ImageRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
