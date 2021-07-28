import 'package:fenix_user/models/api_response_models/notification_list_response/notification_list_response.dart';
import 'package:fenix_user/models/api_response_models/notification_response/notification_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifyWaiterState.freezed.dart';

@freezed
class NotifyWaiterState with _$NotifyWaiterState {
  const factory NotifyWaiterState({
    @Default(false) bool isLoading,
    String? selectedLanguage,
    @Default([]) List<NotificationResponse> notification
  }) = _Default;
}
