import 'dart:math';

import 'package:alarm_task/shared/Sizer.dart';
import 'package:flutter/material.dart';

class SecoudPointer extends StatelessWidget {
  const SecoudPointer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final second = DateTime.now().second.toDouble();
    final angle = (-pi * (second / -60)) * 2;
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: const Offset(0, 20),
          child: Center (child:
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height:getHeight(context, 85) ,
                width:getWidth(context, 3) ,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xffFD251E),
                      Color(0xffFE725C),
                    ]),
                    color: const Color(0xff646E82),
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
             Positioned(
               top: -10,
               right:-1 ,

               child:  Container(
               height:getHeight(context, 20) ,
               width:getWidth(context, 5) ,
               decoration: BoxDecoration(

                   color: const Color(0xffFD251E),
                   borderRadius: BorderRadius.circular(20)
               ),
             ),)
            ],
          ),),
        ),
      ),
    );
  }
}
