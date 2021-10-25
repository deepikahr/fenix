import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/screens/settings/settings_state.dart';
import 'package:get/get.dart';

bool get shouldPaymentButtonBeFunctionalInKioskMode {
  return DB().getKioskMode() != KIOSKMODE.PAY_CHECKOUT_PICK_PRODUCT;
}

bool get isNormalFlowInKioskMode {
  return DB().getKioskMode() == KIOSKMODE.OFF;
}

bool get isPayCheckoutAndPickProduct {
  return DB().getKioskMode() == KIOSKMODE.PAY_CHECKOUT_PICK_PRODUCT;
}

String get getOrderInProcessTitleInKioskMode {
  switch (DB().getKioskMode()) {
    case KIOSKMODE.OFF:
      return '${'YOUR_ORDER_IS'.tr} \n ${'IN_PROCESS'.tr}\n\n';
    case KIOSKMODE.PAY_CHECKOUT_PICK_PRODUCT:
      return '${'PAY_CHECKOUT'.tr}\n${'AND'.tr}\n${'PICK_PRODUCT'.tr}\n\n';
    case KIOSKMODE.PAY_CHECKOUT_DELIVERY_TABLE:
      return '${'PAY_CHECKOUT'.tr}\n${'AND'.tr}\n${'DELIVERY_TABLE'.tr}\n\n';
    case KIOSKMODE.PAY_TABLE_DELIVERY_TABLE:
      return '${'PAY_TABLE'.tr}\n${'AND'.tr}\n${'DELIVERY_TABLE'.tr}\n\n';
    default:
      return '${'YOUR_ORDER_IS'.tr} \n ${'IN_PROCESS'.tr}\n\n';
  }
}

String get getOrderInProcessImageUrlInKioskMode {
  switch (DB().getKioskMode()) {
    case KIOSKMODE.OFF:
      return 'lib/assets/images/timer.png';
    case KIOSKMODE.PAY_CHECKOUT_PICK_PRODUCT:
      return 'lib/assets/images/counter.png';
    case KIOSKMODE.PAY_CHECKOUT_DELIVERY_TABLE:
      return 'lib/assets/images/countertocheckout.png';
    case KIOSKMODE.PAY_TABLE_DELIVERY_TABLE:
      return 'lib/assets/images/pickup.png';
    default:
      return 'lib/assets/images/timer.png';
  }
}

// bool get shouldModificationOfOrderBePossibleInKiosMode {
//   return DB().getOrderId() == null || DB().getKioskMode() == KIOSKMODE.OFF;
// }

// if order id is null, can change the tabs, if order is in pending state can't change the tabs, if the kioskMode is off(while all other requirements are false) then can change the tabs
bool get shouldBeAbleToChangeTabs {
  if (DB().getIsOrderPending()) {
    return false;
  }
  return DB().getOrderId() == null || DB().getKioskMode() == KIOSKMODE.OFF;
}
