import 'package:freezed_annotation/freezed_annotation.dart';

part 'productDetailsState.freezed.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    @Default(false) bool isLoading,
  }) = _Default;
}
