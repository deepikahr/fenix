import 'package:flutter/foundation.dart';
import 'package:restaurant_saas/models/api_request_models/category_list_request/category_list_request.dart';
import 'package:restaurant_saas/models/api_request_models/loyalty_request/loyalty_request.dart';
import 'package:restaurant_saas/models/api_request_models/player_id_update/player_id_update.dart';
import 'package:restaurant_saas/models/api_request_models/restaurant_request/restaurant_request.dart';
import 'package:restaurant_saas/models/api_response_models/category_response/category_response.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/models/api_request_models/delivery_boy_rating/delivery_boy_rating_request.dart';
import 'package:restaurant_saas/models/api_request_models/facebook_login_request/facebook_login_request.dart';
import 'package:restaurant_saas/models/api_request_models/food_rating_request/food_rating_request.dart';
import 'package:restaurant_saas/models/api_request_models/google_login_request/google_login_request.dart';
import 'package:restaurant_saas/models/api_request_models/otp_verify_request/otp_verify_request.dart';
import 'package:restaurant_saas/models/api_request_models/pagination_request/pagination_request.dart';
import 'package:restaurant_saas/models/api_request_models/product_rating_request/product_rating_request.dart';
import 'package:restaurant_saas/models/api_request_models/profile_request/profile_request.dart';
import 'package:restaurant_saas/models/api_request_models/add_money_request/add_money_request.dart';
import 'package:restaurant_saas/models/api_response_models/add_money_response/add_money_response.dart';
import 'package:restaurant_saas/models/api_request_models/register_request/register_request.dart';
import 'package:restaurant_saas/models/api_request_models/update_email_request/update_email_request.dart';
import 'package:restaurant_saas/models/api_request_models/update_me_request/update_me_request.dart';
import 'package:restaurant_saas/models/api_response_model.dart';
import 'package:restaurant_saas/models/api_response_models/add_number_response/add_number_response.dart';
import 'package:restaurant_saas/models/api_response_models/brand_response/brand_response.dart';
import 'package:restaurant_saas/models/api_response_models/browse_by_cuisine_response/browse_by_cuisine_response.dart';
import 'package:restaurant_saas/models/api_response_models/cuisine_response/cuisine_response.dart';
import 'package:restaurant_saas/models/api_response_models/coupon_list_response/coupon_list_response.dart';
import 'package:restaurant_saas/models/api_response_models/coupon_response/coupon_response.dart';
import 'package:restaurant_saas/models/api_response_models/currencyApiResponse/currencyApiResponse.dart';
import 'package:restaurant_saas/models/api_response_models/error_response/error_response.dart';
import 'package:restaurant_saas/models/api_response_models/food_delivery_rating/food_delivery_rating_response.dart';
import 'package:restaurant_saas/models/api_response_models/home_data_response/home_data_response.dart';
import 'package:restaurant_saas/models/api_response_models/htmlDataReponse/htmlDataReponse.dart';
import 'package:restaurant_saas/models/api_response_models/loyalty/loyalty.dart';
import 'package:restaurant_saas/models/api_response_models/manage_address_resposne/manage_address_response.dart';
import 'package:restaurant_saas/models/api_response_models/offer/offer.dart';
import 'package:restaurant_saas/models/api_response_models/order_details_resposne/order_details_reposne.dart';
import 'package:restaurant_saas/models/api_response_models/order_track_response/order_track_response.dart';
import 'package:restaurant_saas/models/api_response_models/orders_list_response/orders_list_response.dart';
import 'package:restaurant_saas/models/api_response_models/otp_verify_response/otp_verify_response.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:restaurant_saas/models/api_response_models/products_response/products_response.dart';
import 'package:restaurant_saas/models/api_response_models/profile/profile.dart';
import 'package:restaurant_saas/models/api_response_models/referralDataResponse/referralDataResponse.dart';
import 'package:restaurant_saas/models/api_response_models/referralSettingDataResponse/referralSettingDataResponse.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant_response/restaurant_response.dart';
import 'package:restaurant_saas/models/api_response_models/tax_details_response/tax_details_response.dart';
import 'package:restaurant_saas/models/api_response_models/transactions_response/transactions_response.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';
import 'package:restaurant_saas/models/api_response_models/user_to_admin_chat_response/user_to_admin_chat_reponse.dart';
import 'package:restaurant_saas/models/api_response_models/user_to_delivery_boy_response/user_to_delivery_boy_chat_reponse.dart';
import 'package:restaurant_saas/network/urls.dart';
import 'package:restaurant_saas/models/api_request_models/image_request/image_request.dart';
import '../main.dart';
import 'api_helper.dart';
import 'package:restaurant_saas/models/api_request_models/favourite_request/favourite_request.dart';

import 'package:restaurant_saas/models/api_response_models/image_response/image_response.dart';
import 'package:restaurant_saas/models/api_response_models/discount/discount.dart';

class API {
  final _api = ApiHelper();

  Future<AddNumberResponse?> register(
      String mobileNumber, String countryCode, String referralCode,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<AddNumberResponse>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.post(
      URL.REGISTER,
      reqModel: RegisterRequest(
        mobileNumber: mobileNumber,
        countryCode: countryCode,
        referralCode: referralCode,
      ),
      resModel: AddNumberResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> googleSignIn(String token,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<String?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.postForStringResponse(
      URL.GOOGLE_LOGIN,
      reqModel:
          GoogleLoginRequest(googleId: token, playerId: db.getPlayerId() ?? ''),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> facebookSignIn(String token,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<String?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.postForStringResponse(
      URL.FACEBOOK_LOGIN,
      reqModel: FacebookLoginRequest(
          facebookId: token, playerId: db.getPlayerId() ?? ''),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<OtpVerifyResponse?> otpVerify(
    String mobileNumber,
    String otp,
    String? sId, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<OtpVerifyResponse>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.put(
      URL.OTP_VERIFY,
      reqModel: OtpVerifyRequest(
        mobileNumber: mobileNumber,
        otp: otp,
        sId: sId,
        playerId: db.getPlayerId() ?? '',
      ),
      resModel: OtpVerifyResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> updateProfile(
    ProfileRequest profileRequest, {
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.putForStringResponse(
      URL.UPDATE_PROFILE,
      reqModel: profileRequest,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<String?> updateProfilePlyerId(
    String? playerId, {
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.putForStringResponse(
      URL.UPDATE_PROFILE,
      reqModel: PlayerIdUpdateResponse(playerId: playerId),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<String?> updateProfileImage(
    ImageRequest imageRequest, {
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.putForStringResponse(
      URL.UPDATE_PROFILE,
      reqModel: imageRequest,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<String?> updateMe(String firstName, String lastName,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<String?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.putForStringResponse(
      URL.UPDATE_ME,
      reqModel: UpdateMeRequest(firstName: firstName, lastName: lastName),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> updateEmail(String email,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<String?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.putForStringResponse(
      URL.UPDATE_EMAIL,
      reqModel: UpdateEmailRequest(email: email),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<HomeDataResponse?> homeData(int limit, int page,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<HomeDataResponse>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.HOME,
      reqModel: PaginationRequest(limit: limit, page: page),
      resModel: HomeDataResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<BrandResponse?> brandList(int page,
      {ValueSetter<ErrorResponse>? errorListener,
      int limit = 10,
      ValueSetter<ApiResponse<BrandResponse>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.BRAND_LIST,
      reqModel: PaginationRequest(page: page, limit: limit),
      resModel: BrandResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<Loyalty?> getUserLoyalty(
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<Loyalty>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.USER_LOYALTY,
      resModel: Loyalty(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<RestaurantResponse?> getLoyaltyHistory(int limit, int page,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<RestaurantResponse>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.LOYALTY_HISTORY,
      reqModel: PaginationRequest(limit: limit, page: page),
      resModel: RestaurantResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> convertLoyaltyToWalletMoney(LoyaltyRequest loyaltyRequest,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<String?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.postForStringResponse(
      URL.CONVERT_LOYALTY,
      reqModel: loyaltyRequest,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<RestaurantResponse?> topRatedRestaurantsList(int page,
      {ValueSetter<ErrorResponse>? errorListener,
      int limit = 10,
      ValueSetter<ApiResponse<RestaurantResponse>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.TOP_RATED_RESTAURANT_LIST,
      reqModel: PaginationRequest(page: page, limit: limit),
      resModel: RestaurantResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<RestaurantResponse?> nearByRestaurantsList(int page,
      {ValueSetter<ErrorResponse>? errorListener,
      int limit = 10,
      ValueSetter<ApiResponse<RestaurantResponse>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.NEAR_BY_RESTAURANT_LIST,
      reqModel: PaginationRequest(page: page, limit: limit),
      resModel: RestaurantResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<RestaurantResponse?> featuredRestaurantsList(int page,
      {ValueSetter<ErrorResponse>? errorListener,
      int limit = 10,
      ValueSetter<ApiResponse<RestaurantResponse>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.FEATURED_RESTAURANTS_LIST,
      reqModel: PaginationRequest(page: page, limit: limit),
      resModel: RestaurantResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<RestaurantResponse?> getFavouriteList(int page,
          {ValueSetter<ErrorResponse>? errorListener,
          int limit = 10,
          ValueSetter<ApiResponse<RestaurantResponse>>? responseListener,
          bool autoErrorHandle = true}) async =>
      _api.get(
        URL.FAVOURITE_LIST,
        reqModel: PaginationRequest(page: page, limit: limit),
        resModel: RestaurantResponse(),
        errorListener: errorListener,
      );

  Future<BrowseByCuisineResponse?> browseByCuisineRestaurantsList(
          String cuisineId, int page,
          {ValueSetter<ErrorResponse>? errorListener,
          int limit = 10,
          ValueSetter<ApiResponse<BrowseByCuisineResponse>>? responseListener,
          bool autoErrorHandle = true}) async =>
      _api.get(
        URL.BROWSE_BY_CUISINES + cuisineId,
        reqModel: PaginationRequest(page: page, limit: limit),
        resModel: BrowseByCuisineResponse(),
        errorListener: errorListener,
      );

  Future<ProductsResponse?> searchByProduct(String searchWord, int page,
          {ValueSetter<ErrorResponse>? errorListener,
          int limit = 10,
          ValueSetter<ApiResponse<BrowseByCuisineResponse>>? responseListener,
          bool autoErrorHandle = true}) async =>
      _api.get(
        URL.SEARCH_PRODUCT + searchWord,
        reqModel: PaginationRequest(page: page, limit: limit),
        resModel: ProductsResponse(),
        errorListener: errorListener,
      );

  Future<RestaurantResponse?> searchByRestaurant(String searchWord, int page,
          {ValueSetter<ErrorResponse>? errorListener,
          int limit = 10,
          ValueSetter<ApiResponse<BrowseByCuisineResponse>>? responseListener,
          bool autoErrorHandle = true}) async =>
      _api.get(
        URL.SEARCH_RESTAURANT + searchWord,
        reqModel: PaginationRequest(page: page, limit: limit),
        resModel: RestaurantResponse(),
        errorListener: errorListener,
      );

  Future<BrowseByCuisineResponse?> browseByBrandRestaurantsList(
          String brandId, int page,
          {ValueSetter<ErrorResponse>? errorListener,
          int limit = 10,
          ValueSetter<ApiResponse<BrowseByCuisineResponse>>? responseListener,
          bool autoErrorHandle = true}) async =>
      _api.get(
        URL.BROWSE_BY_BRANDS + brandId,
        reqModel: PaginationRequest(page: page, limit: limit),
        resModel: BrowseByCuisineResponse(),
        errorListener: errorListener,
      );

  Future<CuisineResponse?> cuisinesList(int page,
      {ValueSetter<ErrorResponse>? errorListener,
      int limit = 10,
      ValueSetter<ApiResponse<CuisineResponse>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.CUISINE_LIST,
      reqModel: PaginationRequest(page: page, limit: limit),
      resModel: CuisineResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<List<Product>?> menu(String franchiseId, int limit, int page,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<List<Product>?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.getForArrayResponse(
      URL.MENU + franchiseId,
      reqModel: PaginationRequest(limit: limit, page: page),
      resModel: Product(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<List<CategoryResponse>?> categoryList(String franchiseId, bool isVeg,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<List<CategoryResponse>?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.getForArrayResponse(
      URL.CATEGORY_LIST + franchiseId,
      reqModel: CategoryListRequest(isVeg: isVeg),
      resModel: CategoryResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<List<Offer>?> offerList(String franchiseId, String vendorId,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<List<Offer>>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.getForArrayResponse(
      URL.OFFER_LIST + franchiseId + '/' + vendorId,
      resModel: Offer(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<Discount?> discountOffer(String vendorId,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<Discount>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.DISCOUNT_OFFER + vendorId,
      resModel: Discount(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<ProductDetailsResponse?> fetchProductDetails(
    String productId, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<ProductDetailsResponse>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.get(
      URL.PRODUCT_DETAILS + productId,
      resModel: ProductDetailsResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<TaxDetailsResponse?> fetchTaxDetails(
    String vendorId, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<TaxDetailsResponse>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.get(
      URL.TAX_DETAILS + vendorId,
      resModel: TaxDetailsResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<Cart?> verifyCart(
    Cart? cartVerifyRequest, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<Cart>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.post(
      URL.CART_VERIFY,
      errorListener: errorListener,
      reqModel: cartVerifyRequest,
      resModel: Cart(),
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> addAddress(
    UserAddress? userAddress, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<String?>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.postForStringResponse(
      URL.ADD_ADDRESS,
      errorListener: errorListener,
      reqModel: userAddress,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> addRestaurantToFavourite(
    FavouriteRequest favouriteRequest, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<String?>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.postForStringResponse(
      URL.ADD_RESTAURANT_TO_FAVOURITE,
      errorListener: errorListener,
      reqModel: favouriteRequest,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> removeRestaurantFromFavourite(
    String franchiseId, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<String?>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.deleteForStringResponse(
      URL.REMOVE_RESTAURANT_FROM_FAVOURITE + franchiseId,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> removeProfilePic({
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<String?>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.deleteForStringResponse(
      URL.REMOVE_IMAGE,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<AddMoneyResponse?> createOrder(
    Cart cart, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<AddMoneyResponse>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.post(
      URL.CREATE_ORDER,
      errorListener: errorListener,
      reqModel: cart,
      resModel: AddMoneyResponse(),
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<ManageAddressReponse?> addressList({
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<ManageAddressReponse>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.get(
      URL.ADDRESS_LIST,
      errorListener: errorListener,
      resModel: ManageAddressReponse(),
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> updateAddress(UserAddress address,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<String?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.putForStringResponse(
      URL.UPDATE_ADDRESS + address.id!,
      reqModel: address,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> deleteAddress(String addressId,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<String?>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.deleteForStringResponse(
      URL.DELETE_ADDRESS + addressId,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<OrderListResponse?> ordersUpcomingList({
    int limit = 10,
    int? page,
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<OrderListResponse>>? responseListener,
  }) async {
    return _api.get(
      URL.ORDERS_UPCOMING_LIST,
      errorListener: errorListener,
      reqModel: PaginationRequest(page: page, limit: limit),
      resModel: OrderListResponse(),
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<OrderListResponse?> ordersCompletedList({
    int limit = 10,
    int? page,
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<OrderListResponse>>? responseListener,
  }) async {
    return _api.get(
      URL.ORDERS_COMPLETED_LIST,
      errorListener: errorListener,
      reqModel: PaginationRequest(page: page, limit: limit),
      resModel: OrderListResponse(),
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<OrderTrackResponse?> orderTrack({
    required String orderId,
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<OrderTrackResponse>>? responseListener,
  }) async {
    return _api.get(
      URL.ORDER_TRACK + orderId,
      errorListener: errorListener,
      resModel: OrderTrackResponse(),
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<UserAddress?> fetchDefaultAddress({
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<UserAddress>>? responseListener,
  }) async {
    return _api.get(
      URL.DEFAULT_ADDRESS,
      errorListener: errorListener,
      resModel: UserAddress(),
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<Profile?> fetchUserProfile({
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.get(
      URL.GET_PROFILE,
      errorListener: errorListener,
      resModel: Profile(),
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<OrderDetailsDataResponse?> orderDetails(
    String orderId, {
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<OrderDetailsDataResponse>>? responseListener,
  }) async {
    return _api.get(
      URL.ORDER_DETAILS + orderId,
      resModel: OrderDetailsDataResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<String?> cancelOrder(
    String orderId, {
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<String?>>? responseListener,
  }) async {
    return _api.putForStringResponse(
      URL.CANCEL_ORDER + orderId,
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<Cart?> reOrder(
    String orderId, {
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<Cart>>? responseListener,
  }) async {
    return _api.get(
      URL.RE_ORDER + orderId,
      resModel: Cart(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<FoodDeliveryBoyRatingResponse?> getFoodDeliveryBoyRating(
      String orderId,
      {ValueSetter<ErrorResponse>? errorListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.FOOD_DELIVERY_BOY_RATING + orderId,
      resModel: FoodDeliveryBoyRatingResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<String?> saveDeliveryBoyRating(
    double rate,
    String description,
    String? orderId,
    String? deliveryBoyId, {
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.postForStringResponse(
      URL.DELIVERY_BOY_RATING,
      errorListener: errorListener,
      reqModel: DeliveryBoyRatingRequest(
          deliveryBoyId: deliveryBoyId,
          rate: rate,
          orderId: orderId,
          description: description),
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<String?> saveFoodBoyRating(
    double rate,
    String description,
    String? orderId,
    String? franchiseId, {
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.postForStringResponse(
      URL.FOOD_RATING,
      errorListener: errorListener,
      reqModel: FoodRatingRequest(
          franchiseId: franchiseId,
          rate: rate,
          orderId: orderId,
          description: description),
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<String?> saveMenuRating(
    double rate,
    String rateDescription,
    String? orderId,
    String? productId,
    String? sizeName, {
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.postForStringResponse(
      URL.PRODUCT_RATING,
      errorListener: errorListener,
      reqModel: ProductRatingRequest(
          productId: productId,
          sizeName: sizeName,
          rate: rate,
          orderId: orderId,
          rateDescription: rateDescription),
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<UserToAdminChatResponse?> getUserToAdminChatList(String orderId,
      {ValueSetter<ErrorResponse>? errorListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.USER_TO_ADMIN_CHAT_LIST + orderId,
      resModel: UserToAdminChatResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<UserToDeliveryBoyChatResponse?> getUserToDeliveryBoyChatList(
      String orderId,
      {ValueSetter<ErrorResponse>? errorListener,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.USER_TO_DELIVERY_BOY_CHAT_LIST + orderId,
      resModel: UserToDeliveryBoyChatResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
    );
  }

  Future<CouponListResponse?> getCouponsList(int? page, String franchiseId,
      {ValueSetter<ErrorResponse>? errorListener,
      int limit = 10,
      bool autoErrorHandle = true}) async {
    return _api.get(
      URL.COUPONS_LIST + franchiseId,
      resModel: CouponListResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      reqModel: PaginationRequest(page: page, limit: limit),
    );
  }

  Future<CouponResponse?> checkCouponCodeValidate(
    String couponCode,
    Cart? cartVerifyRequest, {
    ValueSetter<ErrorResponse>? errorListener,
    ValueSetter<ApiResponse<CouponResponse>>? responseListener,
    bool autoErrorHandle = true,
  }) async {
    return _api.post(
      URL.CHECK_COUPONS_VALIDATE + couponCode,
      errorListener: errorListener,
      reqModel: cartVerifyRequest,
      resModel: CouponResponse(),
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<AddMoneyResponse?> addMoney(
      double amount, String? paymentMethodId, String? paymentType,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<AddMoneyResponse>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.post(
      URL.ADD_MONEY,
      reqModel: AddMoneyRequest(
        amount: amount,
        paymentMethodId: paymentMethodId,
        paymentMethodType: paymentType,
      ),
      resModel: AddMoneyResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<ImageResponse?> uploadImage(body,
      {ValueSetter<ErrorResponse>? errorListener,
      ValueSetter<ApiResponse<ImageResponse>>? responseListener,
      bool autoErrorHandle = true}) async {
    return _api.imageUpload(
      URL.UPLOAD_IMAGE,
      reqModel: body,
      resModel: ImageResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<TransactionsResponse?> fetchWalletHistory({
    int page = 1,
    int limit = 10,
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<TransactionsResponse>>? responseListener,
  }) async {
    return _api.get(
      URL.WALLET_HISTORY,
      resModel: TransactionsResponse(),
      reqModel: PaginationRequest(page: page, limit: limit),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<HtmlDataReponse?> getAboutUsData({
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<HtmlDataReponse>>? responseListener,
  }) async {
    return _api.get(
      URL.ABOUT_US,
      resModel: HtmlDataReponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<HtmlDataReponse?> getHelpData({
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<HtmlDataReponse>>? responseListener,
  }) async {
    return _api.get(
      URL.HELP,
      resModel: HtmlDataReponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<HtmlDataReponse?> getTermsAndConditionData({
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<HtmlDataReponse>>? responseListener,
  }) async {
    return _api.get(
      URL.TERMS_AND_CONDITION,
      resModel: HtmlDataReponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<HtmlDataReponse?> getPrivacyData({
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<HtmlDataReponse>>? responseListener,
  }) async {
    return _api.get(
      URL.PRIVACY_POLICY,
      resModel: HtmlDataReponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<ReferralSettingDataResponse?> getLoginPageReferral({
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<ReferralSettingDataResponse>>? responseListener,
  }) async {
    return _api.get(
      URL.LOGIN_PAGE_REFERRAL_AVAILBLE,
      resModel: ReferralSettingDataResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<ReferralDataResponse?> getReferralData({
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<ReferralDataResponse>>? responseListener,
  }) async {
    return _api.get(
      URL.REFERRAL_DATA,
      resModel: ReferralDataResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<CurrencyApiResponse?> getCurrencyhData({
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<CurrencyApiResponse>>? responseListener,
  }) async {
    return _api.get(
      URL.GET_CURRENCY,
      resModel: CurrencyApiResponse(),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }

  Future<Restaurant?> fetchRestaurantDetails(
    String franchiseId,
    String? vendorId, {
    String? categoryId,
    ValueSetter<ErrorResponse>? errorListener,
    bool autoErrorHandle = true,
    ValueSetter<ApiResponse<Restaurant>>? responseListener,
  }) async {
    return _api.get(
      URL.RESTAURANT_DETAILS + franchiseId,
      resModel: Restaurant(),
      reqModel: RestaurantRequest(vendorId: vendorId, categoryId: categoryId),
      errorListener: errorListener,
      autoErrorHandle: autoErrorHandle,
      responseListener: responseListener,
    );
  }
}
