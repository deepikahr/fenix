import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/thankyou/thankyou_screen.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Payment extends HookWidget {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {});
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
                context.read(homeTabsProvider.notifier).showScreen(Thankyou());
              }),
              SizedBox(height: 30),
              custombuttonsmFW(context, 'PAGAR EN METÁLICO', () {
                context.read(homeTabsProvider.notifier).showScreen(Thankyou());
              }),
              SizedBox(height: 30),
              custombuttonsmFW(context, 'PAGAR CON DATAFONO', () {
                context.read(homeTabsProvider.notifier).showScreen(Thankyou());
              }),
            ],
          )
        ],
      ),
    );
  }
}
