import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/screens/others/thank_you/thankYou.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:get/get.dart';

class Payment extends HookWidget {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    final isMounted = useIsMounted();
    final state = useProvider(paymentProvider);
    final notifier = useProvider(paymentProvider.notifier);

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {

        });
      }
      return;
    }, const []);

    return Container(
        color: light,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              custombuttonsmFW(context, 'PAGAR AQUÍ, EN PILARBOX', () {
                context.read(homeTabsProvider.notifier).onPageChanged(9);
              }),
              SizedBox(height: 30),
              custombuttonsmFW(context, 'PAGAR EN METÁLICO', () {
                context.read(homeTabsProvider.notifier).onPageChanged(9);
              }),
              SizedBox(height: 30),
              custombuttonsmFW(context, 'PAGAR CON DATAFONO', () {
                context.read(homeTabsProvider.notifier).onPageChanged(9);
              }),
            ],
          )
        ],
      ),
    );
  }
}
