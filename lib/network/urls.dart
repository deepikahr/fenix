class URL {
  URL._();

  static const LOGIN_VERIFY = '/users/login/table';
  static const CHANGE_PASSWORD = '/users/table/change-password';

  static const MENU_DROPDOWN = '/menu/user/drop-down/';
  static const SETTINGS = '/users/profile/details';
  static const SETTINGS_UPDATE = '/users/update/tabSetting/';

  static const HOME = '/categories/home-page/';
  static const CATEGORY = '/categories/type-based';
  static const SUB_CATEGORY = '/sub-categories/user/list';

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
  static const ORDER_MODIFIED_STATUS_REQUEST_EVENT =
      'OrderUpdate-Item-Response-ORDER_ID';

  static const String DELIVERY_BOY_SEND_MESSAGE_TO_USER_SOCKET =
      "message-delivery-boy-to-user";
  static const String USER_SEND_MESSAGE_TO_DELIVERY_BOY_SOCKET_LISTEN =
      "message-delivery-boy-user-";

  static const NOTIFI_WAITER_REQUEST_EVENT =
      'Other-Request-Acknowledged-USER_ID';
}
