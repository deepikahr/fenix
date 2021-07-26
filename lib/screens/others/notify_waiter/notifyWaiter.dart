import 'package:fenix_user/models/api_response_models/notification_response/notification_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class NotifyWaiter extends HookWidget {

  bool isChecked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<String> requestList = <String>[
    "HELP WITH NAPKIN RACK",
    "ASK SOMETHING",
    "REQUEST NAPKINS"
  ];

  @override
  Widget build(BuildContext context) {

    final state = useProvider(notifyWaiterProvider);
    final homeState = useProvider(homeTabsProvider);

    final notifyWaiterNotifier = useProvider(notifyWaiterProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        if (isMounted()) {
          await context.read(notifyWaiterProvider.notifier).fetchNotification();
        }
      });
      return;
    }, const []);

    return Scaffold(
        backgroundColor: light,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(context, _scaffoldKey, items, homeState.selectedLanguage ?? items.first,
                (String? value) => context.read(homeTabsProvider.notifier).onSelectLanguage(value!)
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Center(
                child: Text('AVISO AL CAMARERO',
                    style: textBlackLargeBM(context))),
            SizedBox(height: 20),
            if ((state.notification.length) > 0)
            requestBlock(context, state.notification),
          ],
        ));
  }

  requestBlock(BuildContext context, List<NotificationResponse> notification) {
    return ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: requestList.length,
        itemBuilder: (BuildContext context, int i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              custombuttonsmFW(context, notification[i].title, () {
                final response = context.read(notifyWaiterProvider.notifier).callWaiter(notification[i].title, notification[i].description);
                if(response != null)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$response')));
              }),
              SizedBox(height: 30),
            ],
          );
        });
  }

}
