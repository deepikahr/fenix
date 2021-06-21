import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'add_on_item.freezed.dart';
part 'add_on_item.g.dart';

@freezed
class AddOnItem with BaseModel<AddOnItem>, _$AddOnItem {
  const AddOnItem._();

  const factory AddOnItem({
    @JsonKey(name: '_id') String? id,
    String? addOnCategoryId,
    String? addOnItemId,
    String? addOnItemName,
    double? addOnItemPrice,
    bool? selected,
  }) = _AddOnItem;

  factory AddOnItem.fromJson(Map<String, dynamic> json) =>
      _$AddOnItemFromJson(json);

  @override
  AddOnItem fromMap(Map<String, dynamic> map) {
    return AddOnItem.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
