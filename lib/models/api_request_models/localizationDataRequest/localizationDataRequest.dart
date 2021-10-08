import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'localizationDataRequest.freezed.dart';
part 'localizationDataRequest.g.dart';

@freezed
class LocalizationDataRequest
    with BaseModel<LocalizationDataRequest>, _$LocalizationDataRequest {
  const LocalizationDataRequest._();

  const factory LocalizationDataRequest({String? code}) =
      _LocalizationDataRequest;

  factory LocalizationDataRequest.fromJson(Map<String, dynamic> json) =>
      _$LocalizationDataRequestFromJson(json);

  @override
  LocalizationDataRequest fromMap(Map<String, dynamic> map) {
    return LocalizationDataRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
