import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';
part 'franchise_model.freezed.dart';
part 'franchise_model.g.dart';

@freezed
class FranchiseModel with BaseModel<FranchiseModel>, _$FranchiseModel {
  const FranchiseModel._();

  const factory FranchiseModel({
    @JsonKey(name: '_id') String? id,
    String? franchiseName,
    String? restaurantName
  }) = _FranchiseModel;

  factory FranchiseModel.fromJson(Map<String, dynamic> json) =>
      _$FranchiseModelFromJson(json);

  @override
  FranchiseModel fromMap(Map<String, dynamic> map) {
    return FranchiseModel.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
