import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'htmlDataResponse.freezed.dart';
part 'htmlDataResponse.g.dart';

@freezed
class HtmlDataResponse with BaseModel<HtmlDataResponse>, _$HtmlDataResponse {
  const HtmlDataResponse._();

  const factory HtmlDataResponse({
    @Default('') String? title,
    @Default('') String? description,
  }) = _HtmlDataResponse;

  factory HtmlDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HtmlDataResponseFromJson(json);

  @override
  HtmlDataResponse fromMap(Map<String, dynamic> map) {
    return HtmlDataResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
