import 'package:fenix_user/models/api_response_models/home_response/home_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawerState.freezed.dart';

@freezed
class DrawerState with _$DrawerState {
  const factory DrawerState({
    @Default(false) bool isLoading,
    HomeResponse? homeData
  }) = _Default;
}
