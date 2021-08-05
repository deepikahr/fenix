import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';
part 'language_response.freezed.dart';
part 'language_response.g.dart';

@freezed
class LanguageResponse with BaseModel<LanguageResponse>, _$LanguageResponse {
  const LanguageResponse._();

  const factory LanguageResponse(
      {@JsonKey(name: '_id') String? id,
      int? isDefault,
      String? languageCode,
      String? languageName,
      String? flagCode
      }) = _LanguageResponse;

  factory LanguageResponse.fromJson(Map<String, dynamic> json) =>
      _$LanguageResponseFromJson(json);

  @override
  LanguageResponse fromMap(Map<String, dynamic> map) {
    return LanguageResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
