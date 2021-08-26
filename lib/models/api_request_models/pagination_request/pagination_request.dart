import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'pagination_request.freezed.dart';

part 'pagination_request.g.dart';

@freezed
class PaginationRequest with BaseModel<PaginationRequest>, _$PaginationRequest {
  const PaginationRequest._();

  const factory PaginationRequest({@Default(10) int limit, int? page}) =
  _PaginationRequest;

  factory PaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$PaginationRequestFromJson(json);

  @override
  PaginationRequest fromMap(Map<String, dynamic> map) {
    return PaginationRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
