import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/thank_you/thankYou.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Payment extends HookWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final homeState = useProvider(homeTabsProvider);

    return Scaffold(
      backgroundColor: light,
      key: _scaffoldKey,
      drawer: DrawerPage(),
      appBar: fenixAppbar(
          context,
          _scaffoldKey,
          (value) =>
              context.read(homeTabsProvider.notifier).onSelectLanguage(value!),
          homeState.languages,
          homeState.isLoading),
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
