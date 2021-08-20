import 'package:fenix_user/models/api_response_models/notification_response/notification_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:get/get.dart';

class NotifyWaiter extends HookWidget {

  @override
  Widget build(BuildContext context) {

    List notifyList = [
      'HELP WITH THE NAPKIN RACK',
      'ASK SOMETHING',
      'REQUEST NAPKINS'
    ];

    final state = useProvider(notifyWaiterProvider);
    final notifier = useProvider(notifyWaiterProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          // await notifier.fetchNotification();
        });
      }
      return;
    }, const []);

    return Container(
        color: light,
       child: Stack(
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
                final response = await context.read(notifyWaiterProvider.notifier).callWaiter(notification[i], notification[i]);
                if(response != null)
                  Fluttertoast.showToast(msg: '$response');
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$response')));
              }),
              SizedBox(height: 30),
            ],
          );
        });
  }

}
