import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';

part 'call_waiter_request.freezed.dart';
part 'call_waiter_request.g.dart';

@freezed
class CallWaiterRequest with BaseModel<CallWaiterRequest>, _$CallWaiterRequest {
  const CallWaiterRequest._();

  const factory CallWaiterRequest({String? title, String? description}) =
      _CallWaiterRequest;

  factory CallWaiterRequest.fromJson(Map<String, dynamic> json) =>
      _$CallWaiterRequestFromJson(json);

  @override
  CallWaiterRequest fromMap(Map<String, dynamic> map) {
    return CallWaiterRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
