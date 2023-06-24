import 'dart:math';

import 'package:alarm_task/shared/Sizer.dart';
import 'package:flutter/material.dart';

class HourPointer extends StatelessWidget {
  const HourPointer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour.toDouble();
    final angle = (-pi * (hour / -12)) * 2;
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: const Offset(0, 20),
          child: Center (child:
            Container(
              height:getHeight(context, 60) ,
              width:getWidth(context, 4) ,
              decoration: BoxDecoration(
                color: const Color(0xff646E82),
                borderRadius: BorderRadius.circular(20)
              ),
            ),),
        ),
      ),
    );
  }
}
