import 'package:fenix_user/models/api_response_models/notification_response/notification_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:get/get.dart';

class NotifyWaiter extends HookWidget {

  bool isChecked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    final state = useProvider(notifyWaiterProvider);
    final homeState = useProvider(homeTabsProvider);
    final settingsState = useProvider(settingsProvider);

    final notifyWaiterNotifier = useProvider(notifyWaiterProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        if (isMounted()) {
          await context.read(notifyWaiterProvider.notifier).fetchNotification();
          await context.read(homeTabsProvider.notifier).fetchLanguage();
          // await context.read(settingsProvider.notifier).fetchSettings();
        }
      });
      return;
    }, const []);

    return Scaffold(
        backgroundColor: light,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(context, _scaffoldKey,
                (value) => context.read(homeTabsProvider.notifier).onSelectLanguage(value!),
            homeState.languages, homeState.isLoading,  settingsState.settings!.tabSetting!.callToWaiter
        ),
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
                  if ((state.notification.length) > 0)
                  requestBlock(context, state.notification),
                ],
              ),
            ),
            if (state.isLoading) GFLoader(type: GFLoaderType.ios)
          ],
        ));
  }

  requestBlock(BuildContext context, List<NotificationResponse> notification) {
    return ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: notification.length,
        itemBuilder: (BuildContext context, int i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              custombuttonsmFW(context, notification[i].title, () async {
                final response = await context.read(notifyWaiterProvider.notifier).callWaiter(notification[i].title, notification[i].description);
                if(response != null)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$response')));
              }),
              SizedBox(height: 30),
            ],
          );
        });
  }

}
