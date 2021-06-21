import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_webservice/places.dart';

part 'enterLocationState.freezed.dart';

@freezed
class EnterLocationState with _$EnterLocationState {
  const factory EnterLocationState(
      {@Default(false) bool isLoading,
      @Default([]) List<Prediction> places}) = _Default;
}
