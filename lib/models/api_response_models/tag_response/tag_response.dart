import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'tag_response.freezed.dart';
part 'tag_response.g.dart';

@freezed
class TagResponse with BaseModel<TagResponse>, _$TagResponse {
  const TagResponse._();

  const factory TagResponse({@JsonKey(name: '_id') String? id, String? title}) =
      _TagResponse;

  factory TagResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResponseFromJson(json);

  @override
  TagResponse fromMap(Map<String, dynamic> map) {
    return TagResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
