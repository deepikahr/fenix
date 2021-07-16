import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/screens/others/thank_you/thankYou.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:hooks_riverpod/all.dart';

class Payment extends HookWidget {
  bool isChecked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    final homeState = useProvider(homeTabsProvider);

    return Scaffold(
        backgroundColor: light,
        key: _scaffoldKey,
        drawer: DrawerPage(),
      appBar: fenixAppbar(context, _scaffoldKey, items, homeState.selectedLanguage ?? items.first,
              (String? value) => context.read(homeTabsProvider.notifier).onSelectLanguage(value!)
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              custombuttonsmFW(context, 'PAGAR AQUÍ, EN PILARBOX', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Thankyou(),
                  ),
                );
              }),
              SizedBox(height: 30),
              custombuttonsmFW(context, 'PAGAR EN METÁLICO', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Thankyou(),
                  ),
                );
              }),
              SizedBox(height: 30),
              custombuttonsmFW(context, 'PAGAR CON DATAFONO', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Thankyou(),
                  ),
                );
              }),
            ],
          )
        ],
      ),


    );
  }
}
