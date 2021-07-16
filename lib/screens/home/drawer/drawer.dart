import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/auth/change_password/changePassword.dart';
import 'package:fenix_user/screens/auth/login/login.dart';
import 'package:fenix_user/screens/others/settings/settings.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerPage extends HookWidget {
  @override
  Widget build(BuildContext context) {

    final homeState = useProvider(homeProvider);
    final state = useProvider(drawerProvider);
    final isMounted = useIsMounted();

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        if (isMounted()) {
          await context.read(homeProvider.notifier).fetchHome();
        }
      });
      return;
    }, const []);

    return Container(
      child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 110,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: new BoxDecoration(color: secondary1, boxShadow: [
                      BoxShadow(color: Colors.black45, blurRadius: 20)
                    ]),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settings(),
                          ),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          Icons.settings,
                          color: secondary1,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 45,
                    left: 50,
                    right: 50,
                    child: Column(
                      children: [
                        titleTextDarkRegularBW(context, "GASTROBAR"),
                        titleTextDarkRegularBW17(context, "CALLE LARIOS 12"),
                      ],
                    ),
                  ),
                ],
              ),
              if ((homeState.homeData?.category.length ?? 0) > 0)
                categoryBlock(context, homeState.homeData?.category),
              if(homeState.isLoading) GFLoader(type: GFLoaderType.ios,),
              InkWell(
                onTap:  (){Get.to(() => ChangePasswordPage());},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: titleTextDarkRegularBB20(context, 'Change Password'),
                ),
              ),
              Divider(),
              InkWell(
                onTap:  (){
                  if (DB().isLoggedIn()) {
                    context.read(drawerProvider.notifier).logout();
                  } else {
                    Get.to(() => LoginPage());
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: titleTextDarkRegularBB20(context, DB().isLoggedIn() ? 'LOGOUT' : 'LOGIN'),
                ),
              ),
              Divider(),
            ],
          )),
    );
  }

  Widget categoryBlock(BuildContext context, List<CategoryResponse>? category) {
    return ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: category!.length,
        itemBuilder: (BuildContext context, int i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: titleTextDarkRegularBB20(context, category[i].title),
              ),
              Divider(),
            ],
          );
        });
  }

}
