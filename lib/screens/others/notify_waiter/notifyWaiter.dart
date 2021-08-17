import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotifyWaiter extends HookWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final homeState = useProvider(homeTabsProvider);
    final settingsState = useProvider(settingsProvider);

    final isMounted = useIsMounted();

    List notifyList = [
      'HELP WITH THE NAPKIN RACK',
      'ASK SOMETHING',
      'REQUEST NAPKINS'
    ];

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await context.read(notifyWaiterProvider.notifier).fetchNotification();
          await context.read(homeTabsProvider.notifier).fetchLanguage();
          // await context.read(settingsProvider.notifier).fetchSettings();
        });
      }

      return;
    }, const []);

    return Scaffold(
        backgroundColor: light,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(
            context,
            _scaffoldKey,
            (value) => context
                .read(homeTabsProvider.notifier)
                .onSelectLanguage(value!),
            homeState.languages,
            homeState.isLoading,
            settingsState.isLoading,
            settingsState, () {
          context.read(homeTabsProvider.notifier).onPageChanged(0);
          Get.to(() => HomeTabs(tabIndex: 0));
        }),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Center(
                      child: Text('${'NOTICE_TO_THE_WAITER'.tr}',
                          style: textBlackLargeBM(context))),
                  SizedBox(height: 20),
                  // if ((state.notification.length) > 0)
                  requestBlock(context, notifyList),
                ],
              ),
            ),
            // if (state.isLoading) GFLoader(type: GFLoaderType.ios)
          ],
        ));
  }

  requestBlock(BuildContext context, notification) {
    return ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: notification.length,
        itemBuilder: (BuildContext context, int i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              custombuttonsmFW(context, notification[i], () async {
                final response = await context
                    .read(notifyWaiterProvider.notifier)
                    .callWaiter(notification[i], notification[i]);
                if (response != null)
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('$response')));
              }),
              SizedBox(height: 30),
            ],
          );
        });
  }
}
