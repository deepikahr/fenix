import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/timing/timing.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'working_hours.freezed.dart';
part 'working_hours.g.dart';

@freezed
class WorkingHours with BaseModel<WorkingHours>, _$WorkingHours {
  const WorkingHours._();

  const factory WorkingHours({
    @JsonKey(name: '_id') String? id,
    @Default([]) List<Timing> timings,
    int? dayCode,
    String? dayName,
    bool? isOpen,
  }) = _WorkingHours;

  factory WorkingHours.fromJson(Map<String, dynamic> json) =>
      _$WorkingHoursFromJson(json);

  @override
  WorkingHours fromMap(Map<String, dynamic> map) {
    return WorkingHours.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
