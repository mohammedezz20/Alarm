import 'dart:math';

import 'package:alarm_task/shared/Sizer.dart';
import 'package:flutter/material.dart';

class MinutePointer extends StatelessWidget {
  const MinutePointer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minute = DateTime.now().minute.toDouble();
    final angle = (-pi * (minute / -60)) * 2;
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: const Offset(0, 20),
          child: Center (child:
          Container(
            height:getHeight(context, 75) ,
            width:getWidth(context, 4) ,
            decoration: BoxDecoration(
                color: const Color(0xff646E82).withOpacity(.75),
                borderRadius: BorderRadius.circular(20)
            ),
          ),),
        ),
      ),
    );
  }
}
