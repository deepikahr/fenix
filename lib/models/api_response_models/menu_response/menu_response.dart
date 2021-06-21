import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'menu_response.freezed.dart';
part 'menu_response.g.dart';

@freezed
class MenuResponse with BaseModel<MenuResponse>, _$MenuResponse {
  const MenuResponse._();

  const factory MenuResponse({
    @JsonKey(name: '_id') String? id,
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
