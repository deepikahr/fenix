import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'favourite_request.freezed.dart';

part 'favourite_request.g.dart';

@freezed
class FavouriteRequest with BaseModel<FavouriteRequest>, _$FavouriteRequest {
  const FavouriteRequest._();

  const factory FavouriteRequest({String? franchiseId}) = _FavouriteRequest;

  factory FavouriteRequest.fromJson(Map<String, dynamic> json) =>
      _$FavouriteRequestFromJson(json);

  @override
  FavouriteRequest fromMap(Map<String, dynamic> map) {
    return FavouriteRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
