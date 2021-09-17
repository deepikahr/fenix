import 'dart:async';

import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ArrowTowardsCart extends StatefulWidget {
  ArrowTowardsCart({Key? key}) : super(key: key);

  @override
  _ArrowTowardsCartState createState() => _ArrowTowardsCartState();
}

class _ArrowTowardsCartState extends State<ArrowTowardsCart> {
  Timer? timer;
  bool up = false;
  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      setState(() {
        up = !up;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeOut,
      padding: EdgeInsets.all(10.0),
      duration: Duration(milliseconds: 300), // Animation speed
      transform: Transform.translate(
        offset: Offset(0, up ? -130 : -70), // Change -100 for the y offset
      ).transform,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Added',
            style: textBlackLargeBM32(context),
          ),
          //Height to match the transform scale and the added text size overlapping distance
          const SizedBox(
            height: 10,
          ),
          Transform.scale(
            scale: 2.5,
            child: Image.asset(
              'lib/assets/images/downArrow.png',
              height: 80,
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}
