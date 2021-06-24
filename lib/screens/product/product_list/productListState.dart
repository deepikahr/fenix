import 'package:freezed_annotation/freezed_annotation.dart';

part 'productListState.freezed.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState({
    @Default(false) bool isLoading,
  }) = _Default;
}
