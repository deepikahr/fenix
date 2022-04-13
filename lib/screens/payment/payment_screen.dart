import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/tip_waiter/tip_waiter.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:get/get.dart';

class Payment extends HookWidget {
  final OrderDetailsResponse? order;
  Payment(this.order);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: light,
      child: ListView.separated(
        separatorBuilder: (__, _) {
          return SizedBox(height: 40);
        },
        padding: EdgeInsets.only(left: 12, right: 12, top: 50),
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: Constants.paymentList.length,
        itemBuilder: (BuildContext context, int i) {
          return custombuttonsmFW(
            context,
            '${Constants.paymentList[i]}'.tr,
            () async {
              context.read(homeTabsProvider.notifier).showScreen(
                    TipWaiter(
                      order: order,
                      paymentType: Constants.paymentList[i],
                    ),
                  );
            },
            false,
          );
        },
      ),
    );
  }
}
