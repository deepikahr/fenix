import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:restaurant_saas/screens/others/settings/settings.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/normalText.dart';

class Categories extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
      child: Stack(
        children: [
          
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: new BoxDecoration(
                  color: secondary1,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 20
                    )
                  ]
                ),
              ),
            Positioned(
            top: 30,
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
                 borderRadius: BorderRadius.circular(12)
                ),
                child: Icon(Icons.settings,color: secondary1,size: 40,),
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 50,
            right: 50,
            child: Column(
              children: [
                titleTextDarkRegularBW(context,"GASTROBAR"),
                titleTextDarkRegularBW17(context,"CALLE LARIOS 12"),
              ],
            ),
          ),
        ],
      ),
      preferredSize: new Size(MediaQuery.of(context).size.width, 80.0),
    ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal:15,vertical:20),
            child: titleTextDarkRegularBB20(context,'CATEGORIA 1'),
          ),
          Divider(),
           Container(
            padding: EdgeInsets.symmetric(horizontal:15,vertical:20),
            child: titleTextDarkRegularBB20(context,'CATEGORIA 2'),
          ),
          Divider(),
        ],
      )
    );
  }
}
