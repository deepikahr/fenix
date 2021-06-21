import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';
part 'player_id_update.freezed.dart';
part 'player_id_update.g.dart';

@freezed
class PlayerIdUpdateResponse
    with BaseModel<PlayerIdUpdateResponse>, _$PlayerIdUpdateResponse {
  const PlayerIdUpdateResponse._();

  const factory PlayerIdUpdateResponse({String? playerId}) =
      _PlayerIdUpdateResponse;

  factory PlayerIdUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$PlayerIdUpdateResponseFromJson(json);

  @override
  PlayerIdUpdateResponse fromMap(Map<String, dynamic> map) {
    return PlayerIdUpdateResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
