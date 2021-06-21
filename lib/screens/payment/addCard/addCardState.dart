import 'package:freezed_annotation/freezed_annotation.dart';

part 'addCardState.freezed.dart';

@freezed
class AddCardState with _$AddCardState {
  const factory AddCardState({@Default(false) bool isLoading}) = _Default;
}
