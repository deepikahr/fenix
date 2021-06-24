import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawerState.freezed.dart';

@freezed
class DrawerState with _$DrawerState {
  const factory DrawerState({
    @Default(false) bool isLoading,
  }) = _Default;
}
