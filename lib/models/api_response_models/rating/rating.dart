import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant_saas/models/base_model.dart';

part 'rating.freezed.dart';
part 'rating.g.dart';

@freezed
class Rating with BaseModel<Rating>, _$Rating {
  const Rating._();

  const factory Rating({
    @Default(0) double rate,
    @Default('') String description,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  @override
  Rating fromMap(Map<String, dynamic> map) {
    return Rating.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
