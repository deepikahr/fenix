import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/screens/settings/settings_state.dart';
import 'package:get/get.dart';

bool get shouldPaymentButtonBeFunctionalInKioskMode {
  return DB().getKioskMode() == KIOSKMODE.OFF;
}

bool get shouldSendOrderToWaiterInKioskMode {
  return DB().getKioskMode() == KIOSKMODE.OFF;
}

String get getOrderInProcessTitleInKioskMode {
  switch (DB().getKioskMode()) {
    case KIOSKMODE.OFF:
      return '${'YOUR_ORDER_IS'.tr} \n ${'IN_PROCESS'.tr}\n\n';
    case KIOSKMODE.PAY_CHECKOUT_PICK_PRODUCT:
      return 'PAY_CHECKOUT_PICK_PRODUCT'.tr;
    case KIOSKMODE.PAY_CHECKOUT_DELIVERY_TABLE:
      return 'PAY_CHECKOUT_DELIVERY_TABLE'.tr;
    case KIOSKMODE.PAY_TABLE_DELIVERY_TABLE:
      return 'PAY_TABLE_DELIVERY_TABLE'.tr;
    default:
      return '${'YOUR_ORDER_IS'.tr} \n ${'IN_PROCESS'.tr}\n\n';
  }
}

String get getOrderInProcessImageUrlInKioskMode {
  switch (DB().getKioskMode()) {
    case KIOSKMODE.OFF:
      return 'lib/assets/images/timer.png';
    case KIOSKMODE.PAY_CHECKOUT_PICK_PRODUCT:
      return 'lib/assets/images/timer.png';
    case KIOSKMODE.PAY_CHECKOUT_DELIVERY_TABLE:
      return 'lib/assets/images/timer.png';
    case KIOSKMODE.PAY_TABLE_DELIVERY_TABLE:
      return 'lib/assets/images/timer.png';
    default:
      return 'lib/assets/images/timer.png';
  }
}

bool get shouldModificationOfOrderPossibleInKiosMode {
  return DB().getKioskMode() == KIOSKMODE.OFF;
}
