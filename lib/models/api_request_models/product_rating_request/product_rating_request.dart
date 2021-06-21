import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'product_rating_request.freezed.dart';
part 'product_rating_request.g.dart';

@freezed
class ProductRatingRequest
    with BaseModel<ProductRatingRequest>, _$ProductRatingRequest {
  const ProductRatingRequest._();

  const factory ProductRatingRequest({
    double? rate,
    String? rateDescription,
    String? orderId,
    String? productId,
    String? sizeName,
  }) = _ProductRatingRequest;
  factory ProductRatingRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRatingRequestFromJson(json);

  @override
  ProductRatingRequest fromMap(Map<String, dynamic> map) {
    return ProductRatingRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
