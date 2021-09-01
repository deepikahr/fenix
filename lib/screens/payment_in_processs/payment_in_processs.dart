import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaymentInProcess extends HookWidget {
  final OrderDetailsResponse? order;
  PaymentInProcess(this.order);
  @override
  Widget build(BuildContext context) {
    final state = useProvider(paymentInProcess);
    final notifier = useProvider(paymentInProcess.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          notifier.getPaymentStatus(
              order, context.read(homeTabsProvider.notifier));
        });
      }
    }, const []);

    return state.isLoading
        ? Center(child: GFLoader(type: GFLoaderType.ios))
        : Container(
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
                        '${'YOUR_PAYMENT_IS'.tr} \n ${'IN_PROCESS_...'.tr}\n\n',
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
          );
  }
}
