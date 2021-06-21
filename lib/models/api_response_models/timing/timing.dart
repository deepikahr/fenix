import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'timing.freezed.dart';
part 'timing.g.dart';

@freezed
class Timing with BaseModel<Timing>, _$Timing {
  const Timing._();

  const factory Timing({
    @JsonKey(name: '_id') String? id,
    String? slot,
    int? openTime,
    int? closeTime,
    bool? isOpen,
  }) = _Timing;

  factory Timing.fromJson(Map<String, dynamic> json) => _$TimingFromJson(json);

  @override
  Timing fromMap(Map<String, dynamic> map) {
    return Timing.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
