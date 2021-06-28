import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'image_response.freezed.dart';
part 'image_response.g.dart';

@freezed
class ImageResponse with BaseModel<ImageResponse>, _$ImageResponse {
  const ImageResponse._();

  const factory ImageResponse({
    String? imageUrl,
    String? imageId,
    String? filePath,
  }) = _ImageResponse;

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);

  @override
  ImageResponse fromMap(Map<String, dynamic> map) {
    return ImageResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}

