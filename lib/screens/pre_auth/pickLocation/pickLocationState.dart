import 'package:freezed_annotation/freezed_annotation.dart';
part 'pickLocationState.freezed.dart';

@freezed
class PickLocationState with _$PickLocationState {
  const factory PickLocationState(
      {@Default(false) bool isLoading,
      @Default(true) bool currenctLocation,
      @Default(true) bool serviceEnabled,
      @Default('') String selectedLocationText}) = _Default;
}
