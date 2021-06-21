import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'franchise.freezed.dart';

part 'franchise.g.dart';

@freezed
class Franchise with BaseModel<Franchise>, _$Franchise {
  const Franchise._();

  const factory Franchise({
    @JsonKey(name: '_id') String? id,
    String? restaurantName,
    String? franchiseName,
    @Default(0) int preparationTime,
  }) = _Franchise;

  factory Franchise.fromJson(Map<String, dynamic> json) =>
      _$FranchiseFromJson(json);

  @override
  Franchise fromMap(Map<String, dynamic> map) {
    return Franchise.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
