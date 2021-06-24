class URL {
  URL._();
  static const REGISTER = '/users/register';
  static const OTP_VERIFY = '/users/user/otp-verify';
  static const UPDATE_ME = '/users/user/update-me';
  static const GOOGLE_LOGIN = '/users/google-login';
  static const FACEBOOK_LOGIN = '/users/facebook-login';
  static const UPDATE_EMAIL = '/users/user/update-email';
  static const UPDATE_PROFILE = '/users/update/profile';
  static const GET_PROFILE = '/users/me';

  static const HOME = '/products/home';
  static const BRAND_LIST = '/settings/brand-list';
  static const TOP_RATED_RESTAURANT_LIST = '/franchise/top-rated-list';
  static const NEAR_BY_RESTAURANT_LIST = '/franchise/near-by-list';
  static const FEATURED_RESTAURANTS_LIST = '/franchise/feature-list';
  static const BROWSE_BY_CUISINES = '/franchise/browse-by-cuisine/';
  static const BROWSE_BY_BRANDS = '/franchise/browse-by-brand/';
  static const CUISINE_LIST = '/cuisine/list';
  static const MENU = '/products/list/';
  static const OFFER_LIST = '/coupons/offer-list/';
  static const DISCOUNT_OFFER = '/settings/discount-offer/';
  static const CATEGORY_LIST = '/categories/list/';
  static const PRODUCT_DETAILS = '/products/detail/';
  static const TAX_DETAILS = '/settings/details/';
  static const CART_VERIFY = '/orders/cart-verify';
  static const CREATE_ORDER = '/orders/create';
  static const ADD_ADDRESS = '/address/create';
  static const ADDRESS_LIST = '/address/list';
  static const GET_ADDRESS = '/address/';
  static const DEFAULT_ADDRESS = '/address/default-address';
  static const UPDATE_ADDRESS = '/address/update/';
  static const DELETE_ADDRESS = '/address/delete/';
  static const ORDERS_UPCOMING_LIST = '/orders/upcoming-list';
  static const ORDERS_COMPLETED_LIST = '/orders/completed-list';
  static const ORDER_DETAILS = '/orders/detail/';
  static const ORDER_TRACK = '/orders/track/';
  static const FOOD_DELIVERY_BOY_RATING = '/ratings/user/order-rate/';
  static const DELIVERY_BOY_RATING = '/ratings/rate/delivery-boy';
  static const FOOD_RATING = '/ratings/rate/franchise';
  static const PRODUCT_RATING = '/orders/user/rate-product';
  static const CANCEL_ORDER = '/orders/cancel/';
  static const RE_ORDER = '/orders/re-order/';
  static const ADD_MONEY = '/wallets/add/money';
  static const WALLET_HISTORY = '/wallets/history';
  static const SEARCH_PRODUCT = '/products/search?q=';
  static const SEARCH_RESTAURANT = '/franchise/search-by-text?q=';
  static const FAVOURITE_LIST = '/favourites/user/list';
  static const ADD_RESTAURANT_TO_FAVOURITE = '/favourites/franchise';
  static const REMOVE_RESTAURANT_FROM_FAVOURITE = '/favourites/remove/';
  static const COUPONS_LIST = '/coupons/user/list/';
  static const CHECK_COUPONS_VALIDATE = '/orders/coupon-validate/';
  static const UPLOAD_IMAGE = '/users/upload-image';
  static const REMOVE_IMAGE = '/users/user/delete-image';
  static const USER_LOYALTY = '/users/loyalty-points';
  static const CONVERT_LOYALTY = '/wallets/top-up/by-loyalty';
  static const LOYALTY_HISTORY = '/loyalty/transaction';
  static const RESTAURANT_DETAILS = '/categories/restaurants/detail/';

  // socket function user and admin chat and api
  static const USER_TO_ADMIN_CHAT_LIST = '/chats/user/';
  static const String USER_SEND_MESSAGE_TO_ADMIN_SOCKET =
      'message-user-to-admin';
  static const String ADMIN_SEND_MESSAGE_TO_USER_SOCKET_LISTEN =
      'message-user-';

  // socket function user and delivery chat and api
  static const USER_TO_DELIVERY_BOY_CHAT_LIST = '/chats/user/delivery-boy/';
  static const String USER_SEND_MESSAGE_TO_DELIVERY_BOY_SOCKET =
      'message-user-to-delivery-boy';
  static const String DELIVERY_BOY_SEND_MESSAGE_TO_USER_SOCKET_LISTEN =
      'message-user-delivery-boy-';

  static const ABOUT_US = '/page/about-us';
  static const TERMS_AND_CONDITION = '/page/terms-and-conditions';
  static const PRIVACY_POLICY = '/page/privacy-policy';
  static const HELP = '/page/help';
  static const LOGIN_PAGE_REFERRAL_AVAILBLE = '/admin-setting/referral';
  static const REFERRAL_DATA = '/users/referralCode/detail';
  static const GET_CURRENCY = '/admin-setting/currency/setting/for/user';
}
