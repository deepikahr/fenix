import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'manager.freezed.dart';
part 'manager.g.dart';

@freezed
class Manager with BaseModel<Manager>, _$Manager {
  const Manager._();

  const factory Manager({
    @JsonKey(name: '_id') String? id,
    String? managerId,
    String? managerName,
  }) = _Manager;

  factory Manager.fromJson(Map<String, dynamic> json) =>
      _$ManagerFromJson(json);

  @override
  Manager fromMap(Map<String, dynamic> map) {
    return Manager.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
