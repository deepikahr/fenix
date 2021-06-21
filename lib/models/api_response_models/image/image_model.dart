import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with BaseModel<ImageModel>, _$ImageModel {
  const ImageModel._();

  const factory ImageModel({
    String? imageUrl,
    String? imageId,
    String? filePath,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  @override
  ImageModel fromMap(Map<String, dynamic> map) {
    return ImageModel.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
