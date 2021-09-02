class URL {
  URL._();

  static const LOGIN_VERIFY = '/users/login/table';
  static const CHANGE_PASSWORD = '/users/table/change-password';

  static const MENU_DROPDOWN = '/menu/user/drop-down/';
  static const SETTINGS = '/users/profile/details';
  static const SETTINGS_UPDATE = '/users/update/tabSetting/';

  static const HOME = '/categories/home-page/';
  static const CATEGORY = '/categories/type-based';

  static const PRODUCT_LIST = '/products/list/';
  static const PRODUCT_DETAILS = '/products/detail/';

  static const CREATE_ORDER = '/orders/create';
  static const UPDATE_ORDER = '/orders/item/update';
  static const ORDER_DETAILS = '/orders/detail/';

  static const CALL_WAITER = '/notifications/request';
  static const CALL_WAITER_LIST = '/notifications/list';

  static const LANGUAGES = '/languages/list';
  static const GET_LOCALIZATION_JSON = '/languages/user';

  static const PAYMENT_REQUEST = '/payment-notification/new-payment-request';

  static const PAYMENT_REQUEST_EVENT = 'Payment-Request-Complete-ORDER_ID';
  static const ORDER_STATUS_REQUEST_EVENT = 'Order-Status-Update-ORDER_ID';
}
