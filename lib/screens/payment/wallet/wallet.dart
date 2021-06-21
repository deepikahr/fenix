import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/payment/addMoney/addMoney.dart';
import 'package:restaurant_saas/screens/payment/recentTransactions/recentTransactions.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:restaurant_saas/screens/payment/wallet/walletShimmer.dart';

class Wallet extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(walletProvider);
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          context.read(walletProvider.notifier).fetchAmount();
        });
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: light,
      appBar: titleAppbar(context, 'WALLET'.tr),
      body: Stack(
        children: [
          if (!state.isLoading)
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/images/wallet.png',
                      scale: 3,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    walletCard(
                        context,
                        '${'WALLET'.tr} \n${'BALANCE'.tr} :',
                        '${state.currencySymbol} ${state.amount.toStringAsFixed(2)}',
                        'lib/assets/icons/walletIcon.png', () async {
                      await Get.to(() => AddMoney());
                      await context.read(walletProvider.notifier).fetchAmount();
                    }),
                  ]),
            ),
          if (state.isLoading)
            Container(
              color: Colors.white,
              child: shimmerWallet(),
            )
        ],
      ),
      bottomNavigationBar: !state.isLoading
          ? Container(
              margin: EdgeInsets.all(16),
              height: 120,
              child: Column(
                children: [
                  outlineBlockButton(context, 'VIEW_RECENT_TRANSACTIONS'.tr,
                      () {
                    Get.to(() => RecentTransactions());
                  }),
                  SizedBox(height: 20),
                  primaryBlockButton(context, 'ADD_MONEY'.tr, () async {
                    await Get.to(() => AddMoney());
                    await context.read(walletProvider.notifier).fetchAmount();
                  })
                ],
              ))
          : SizedBox(
              height: 0,
              width: 0,
            ),
    );
  }
}
