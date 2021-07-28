import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';

part 'notification_response.freezed.dart';
part 'notification_response.g.dart';

@freezed
class NotificationResponse with BaseModel<NotificationResponse>, _$NotificationResponse {
  const NotificationResponse._();

  const factory NotificationResponse({
    @JsonKey(name: '_id') String? id,
    String? title,
    String? description,
    int? tableNumber,
    String? franchiseId,
    String? notifyType,
    String? createdAt
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  @override
  NotificationResponse fromMap(Map<String, dynamic> map) {
    return NotificationResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
