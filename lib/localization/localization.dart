import 'package:get/get.dart';

class Localization extends Translations {
  final Map<String, Map<String, String>>? json;
  Localization(this.json);
  @override
  Map<String, Map<String, String>> get keys =>
      // json ??
      {
        'en': {
          'HELLO': 'Hello',
          'LOGIN': 'Login to Continue',
          'TABLE_NUMBER': 'Table number',
          'FRANCHISE_CODE': 'Franchise code',
          'PASSCODE': 'Passcode',
          'SUBMIT': 'Submit',
          'ACCESS_SETTINGS': 'Access settings',
          'SESSION EXPIRED': 'Session Expired',
          'SERVER_NOT_RESPONDING': 'Server not responding',
          'CANCEL': 'Cancel',
          'UPDATE': 'Update',
          'OK': 'ok',
          'PLEASE_SELECT_MENU': 'Please select menu',
          'CONNECTION_CODE': 'Connection code',
          'TABLE_CAPACITY': 'Table capacity',
          'SELECT_COLOR': 'Select color',
          'SELECT_MENU': 'Select menu',
          'CHOOSE_MENU': 'Choose menu',
          'CATEGORY_REPRESENTATION': 'Category representation',
          'LIST': 'list',
          'GRID': 'grid',
          'RESET_CATEGORY': 'Reset Category',
          'ORDERING_MODE': 'Ordering mode',
          'ENABLE_CALL_TO_WAITER': 'Enable call to waiter',
          'PAY_WHEN_YOU_MAKE_THE_COMMAND_(KIOSK TYPE)':
              'Pay when you make the command (KIOSK TYPE)',
          'VALIDATE_PAYMENT_/_COMMANDS_BY_WAITER':
              'Validate payment / Commands by waiter',
          'DESK': 'Desk',
          'HOME': 'Home',
          'TO_CALL': 'To Call',
          'ASK_FOR': 'Ask for',
          'RETURN': 'Return',
          'DRINKS': 'Drinks',
          'FOOD': 'Food',
          'TO_PAY': 'To pay',
          'ALLERGENS': 'Allergens',
          'ADD': 'Add',
          'NO_PRODUCT': 'No product',
          'MULTIPLE_SAME_PRODUCTS_IN_CART': 'Multiple same products in cart',
          'CART': 'Cart',
          'HOW_YOU_LIKE_TO_CUSTOMIZE_?': 'How you like to customize ?',
          'REPEAT_LAST': 'Repeat last',
          'NEW': 'New',
          'INSTRUCTIONS': 'Instructions',
          'CHOOSE_SIZE': 'Choose size',
          'SELECTED PRODUCTS': 'Selected Products',
          'CART_IS_EMPTY': 'Cart is empty',
          'PLACE_ORDER': 'Place order',
          'MODIFY_ORDER': 'Modify a shipment',
          'ADD_MORE_PRODUCTS': 'Add more products',
          'OK,_PAYMENT_METHODS': 'Ok, Payment Methods',
          'TOTAL_SELECTION': 'Total Selection',
          'DIVIDE_THE_ACCOUNT': 'Divide the account',
          'VAT_INCLUDE_TOTAL': 'VAT include Total',
          'SUB_TOTAL': 'Sub Total',
          'GRAND_TOTAL': 'Grand Total',
          'ORDER_ID': 'Order ID',
          'NOTICE_TO_THE_WAITER': 'Notify to the waiter',
          'YOUR_ORDER_IS': 'Your order is',
          'IN_PROCESS_...': 'in process ...',
          'PAID_OUT!': 'Paid out',
          'THANK_YOU_VERY_MUCH,': 'Thank you very much,',
          'WE_WAIT_FOR_YOU_SOON.': 'We wait for you soon.',
          'CHANGE_PASSCODE': 'Change passcode',
          'LOGOUT': 'Logout'
        }
      };
}
