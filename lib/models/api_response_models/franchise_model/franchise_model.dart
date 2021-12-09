import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';
part 'franchise_model.freezed.dart';
part 'franchise_model.g.dart';

@freezed
class FranchiseModel with BaseModel<FranchiseModel>, _$FranchiseModel {
  const FranchiseModel._();

  const factory FranchiseModel({
    @JsonKey(name: '_id') String? id,
    String? nif,
    String? restaurantName,
    String? contactNumber,
    String? franchiseName,
    FranchiseAddress? franchiseAddress,
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

@freezed
class FranchiseAddress with _$FranchiseAddress {
  const FranchiseAddress._();
  const factory FranchiseAddress({
    String? city,
    String? country,
    String? state,
    String? address,
    String? postalCode,
  }) = _FranchiseAddress;

  factory FranchiseAddress.fromJson(Map<String, dynamic> json) =>
      _$FranchiseAddressFromJson(json);

  String getAddressString() {
    return '$address, $city, $state, $country - $postalCode';
  }
}
