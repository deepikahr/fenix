import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'htmlDataReponse.freezed.dart';
part 'htmlDataReponse.g.dart';

@freezed
class HtmlDataReponse with BaseModel<HtmlDataReponse>, _$HtmlDataReponse {
  const HtmlDataReponse._();

  const factory HtmlDataReponse({
    @Default('') String title,
    @Default('') String description,
  }) = _HtmlDataReponse;

  factory HtmlDataReponse.fromJson(Map<String, dynamic> json) =>
      _$HtmlDataReponseFromJson(json);

  @override
  HtmlDataReponse fromMap(Map<String, dynamic> map) {
    return HtmlDataReponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
