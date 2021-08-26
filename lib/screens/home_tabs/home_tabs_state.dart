import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_tabs_state.freezed.dart';

@freezed
class HomeTabsState with _$HomeTabsState {
  const factory HomeTabsState({
    @Default(false) bool isLoading,
    @Default(Center(child: Text('Nothing to show'))) Widget currentScreen,
    @Default(0) int bottomBarIndex,
  }) = _Default;
}
