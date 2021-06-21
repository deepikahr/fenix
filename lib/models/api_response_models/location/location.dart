import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with BaseModel<Location>, _$Location {
  const Location._();

  const factory Location({
    @Default('Point') String type,
    @Default([]) List<double> coordinates,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  @override
  Location fromMap(Map<String, dynamic> map) {
    return Location.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
