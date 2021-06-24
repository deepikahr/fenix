import 'package:freezed_annotation/freezed_annotation.dart';

part 'categoryState.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(false) bool isLoading,
  }) = _Default;
}
