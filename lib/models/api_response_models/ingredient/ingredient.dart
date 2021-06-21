import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with BaseModel<Ingredient>, _$Ingredient {
  const Ingredient._();

  const factory Ingredient({String? token, String? role, String? id}) =
      _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  @override
  Ingredient fromMap(Map<String, dynamic> map) {
    return Ingredient.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
