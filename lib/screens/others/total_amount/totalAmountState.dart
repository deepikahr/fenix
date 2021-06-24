import 'package:freezed_annotation/freezed_annotation.dart';

part 'totalAmountState.freezed.dart';

@freezed
class TotalAmountState with _$TotalAmountState {
  const factory TotalAmountState({
    @Default(false) bool isLoading,
  }) = _Default;
}
