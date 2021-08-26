import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with BaseModel<Cart>, _$Cart {
  Cart._();

  factory Cart({
    @JsonKey(name: 'cart') @Default([]) List<ProductDetailsResponse> products,
    @Default(0) grandTotal,
    @Default(0) subTotal,
    @Default(0) taxTotal,
    String? deliveryType,
    String? paymentType,
    String? restaurantName,
    String? franchiseName,
    String? franchiseId,
    String? vendorId,
    String? userId,
  }) = _Cart;

  late final int cartCount = products.length;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  @override
  Cart fromMap(Map<String, dynamic> map) {
    return Cart.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}

// "cart": [{
// "productName": "Veg Pizza",
// "productImage": {
// "imageUrl": "https://ik.imagekit.io/kplhvthqbi/tr:dpr-auto,tr:w-auto/1622473378929_original_Margherita_pizza_2x_Ae3-UACO4.png",
// "imageId": "60b4faa6ab31565ccaa5a13c",
// "filePath": "/1622473378929_original_Margherita_pizza_2x_Ae3-UACO4.png"
// },
// "categoryName": "Starters",
// "categoryId": "60d96bcc22c734003ca8a3e1",
// "originalPrice": 350,
// "sellingPrice": 350,
// "tax": 50,
// "taxInfo": {
// "taxName": "GST",
// "taxPercentage": 10
// },
// "quantity": 1,
// "totalProductPrice": 350,
// "addOnItems": [{
// "addOnItemName": "Paneer Roll",
// "addOnItemPrice": 6.2,
// "selected": true
// },
// {
// "addOnItemName": "Egg Roll",
// "addOnItemPrice": 7,
// "selected": true
// }
// ],
// "variants": {
// "price": 100,
// "sizeName": "Small",
// "isDefaultVariant": true,
// "outOfStock": false
// }
//
// }],
// "grandTotal": 400,
// "deliveryType": "abc",
// "paymentType": "COD",
// "restaurantName": "raddison",
// "franchiseName": "btm",
// "franchiseId": "60b4f9f65fca7e003a279a9c",
// "vendorId": "60b49b8871822d003ae0578f",
// "userId": "60a64c44cb54371688353cdc"
// }
