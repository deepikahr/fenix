import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'add_on_category.freezed.dart';
part 'add_on_category.g.dart';

@freezed
class AddOnCategory with BaseModel<AddOnCategory>, _$AddOnCategory {
  const AddOnCategory._();

  const factory AddOnCategory({
    @JsonKey(name: '_id') String? id,
    String? addOnCategoryId,
    String? addOnCategoryName,
    String? selectionType,
    @JsonKey(name: 'required') bool? isRequired,
    @Default([]) List<AddOnItem> addOnItems,
  }) = _AddOnCategory;

  factory AddOnCategory.fromJson(Map<String, dynamic> json) =>
      _$AddOnCategoryFromJson(json);

  @override
  AddOnCategory fromMap(Map<String, dynamic> map) {
    return AddOnCategory.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
