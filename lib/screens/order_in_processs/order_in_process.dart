import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/cart_screen/cart_screen.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs.dart';
import 'package:fenix_user/screens/order_details/order_details.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrdersInProcess extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final notifier = useProvider(orderInProcess.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          final order = await notifier.fetchOrderDetails();
          if (order != null) {
            if (order.orderStatus == ORDER_STATUS.completed) {
              await CartNotifier().deleteCart();
              await DB().removeOrderId();
              await Get.offAll(() => HomeTabs());
            } else if (order.orderStatus == ORDER_STATUS.cancelled) {
              Fluttertoast.showToast(msg: 'ORDER_IS_CANCELLED'.tr);
              await DB().removeOrderId();
              context.read(homeTabsProvider.notifier).showScreen(CartScreen());
            } else if (order.orderStatus == ORDER_STATUS.pending) {
              notifier.getOrderStatus(
                  order.id, context.read(homeTabsProvider.notifier));
            } else if (order.orderStatus == ORDER_STATUS.confirmed) {
              context
                  .read(homeTabsProvider.notifier)
                  .showScreen(OrderDetails());
            }
          }
        });
      }
    }, const []);

    return Stack(
      children: [
        Container(
          color: light,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      // stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        Color(0xFF2B80C9),
                        Color(0xFF2989D3),
                        Color(0xFF2886CC),
                        Color(0xFF2887CD),
                        Color(0xFF42ADEA),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${'YOUR_ORDER_IS'.tr} \n ${'IN_PROCESS_...'.tr}\n\n',
                      style: textWhiteLargeBMM(context),
                    ),
                    Image.asset(
                      'lib/assets/images/timer.png',
                      scale: 3,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
