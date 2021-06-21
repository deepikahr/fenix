import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_ratingState.freezed.dart';

@freezed
class ProductRatingState with _$ProductRatingState {
  const factory ProductRatingState(
      {@Default(false) bool showProductRating,
      @Default(true) bool isLoading,
      @Default(0.0) double rating}) = _Default;
}
