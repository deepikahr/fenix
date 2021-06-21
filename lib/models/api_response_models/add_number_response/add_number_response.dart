import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'add_number_response.freezed.dart';
part 'add_number_response.g.dart';

@freezed
class AddNumberResponse with BaseModel<AddNumberResponse>, _$AddNumberResponse {
  const AddNumberResponse._();

  const factory AddNumberResponse({
    String? message,
    String? sId,
  }) = _AddNumberResponse;

  factory AddNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$AddNumberResponseFromJson(json);

  @override
  AddNumberResponse fromMap(Map<String, dynamic> map) {
    return AddNumberResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
