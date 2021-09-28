import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';
part 'menu_response.freezed.dart';
part 'menu_response.g.dart';

@freezed
class MenuResponse with BaseModel<MenuResponse>, _$MenuResponse {
  const MenuResponse._();

  const factory MenuResponse({
  @JsonKey(name: '_id') String? id,
  String? title,
  String? menuId,
  String? masterMenuId,
  String? vendorId,
  String? franchiseId,
  @Default(false) bool isMenuCloned,
  String? cloneType,
  @Default(false) bool menuClonedFromMasterMenu,
  @Default(false) bool menuClonedFromRestaurantMenu,
  String? createdAt,
  String? updatedAt,

  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

  @override
  MenuResponse fromMap(Map<String, dynamic> map) {
    return MenuResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
