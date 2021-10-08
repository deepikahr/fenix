import 'package:fenix_user/models/api_response_models/notification_response/notification_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';
part 'notification_list_response.freezed.dart';
part 'notification_list_response.g.dart';

@freezed
class NotificationListResponse
    with BaseModel<NotificationListResponse>, _$NotificationListResponse {
  const NotificationListResponse._();

  const factory NotificationListResponse({
    @Default([]) List<NotificationResponse> data,
  }) = _NotificationListResponse;

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseFromJson(json);

  @override
  NotificationListResponse fromMap(Map<String, dynamic> map) {
    return NotificationListResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
