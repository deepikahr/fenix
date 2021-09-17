import 'dart:async';

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
    timer = Timer.periodic(Duration(milliseconds: 600), (timer) {
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
      duration: Duration(milliseconds: 500), // Animation speed
      transform: Transform.translate(
        offset: Offset(0, up ? -100 : -40), // Change -100 for the y offset
      ).transform,
      child: Image.asset(
        'lib/assets/images/down_arrow.png',
        height: 50,
        width: 20,
      ),
    );
  }
}
