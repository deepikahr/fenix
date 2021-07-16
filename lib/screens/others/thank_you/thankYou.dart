import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class Thankyou extends HookWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {

    final homeState = useProvider(homeTabsProvider);

    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(context, _scaffoldKey, items, homeState.selectedLanguage ?? items.first,
                (String? value) => context.read(homeTabsProvider.notifier).onSelectLanguage(value!)
        ),
        body: ListView(
          children: [
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
                      Color(0xFF359D59),
                      Color(0xFF1B4F2D),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¡PAGADO! \n MUCHAS GRACIAS, \n LE ESPERAMOS PRONTO.\n\n',
                    style: textWhiteLargeBMM(context),
                  ),
                  Image.asset(
                    'lib/assets/images/smiley.png',
                    scale: 2,
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
