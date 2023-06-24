import 'package:alarm_task/shared/Sizer.dart';
import 'package:flutter/material.dart';

class AnalogCircle extends StatelessWidget {
  const AnalogCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context, 176),
      width: getHeight(context, 176),
      decoration: BoxDecoration(
          color:Colors.transparent ,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color:  Color(0xffA6B4C8).withOpacity(.4),
              spreadRadius:0,
              blurRadius: 0,
              blurStyle: BlurStyle.normal,
              offset: Offset.zero, // changes the position of the shadow
            ),
            BoxShadow(
              color: Colors.white.withOpacity(1),
              spreadRadius:0,
              blurRadius: 20,
              blurStyle: BlurStyle.normal,
              offset: Offset.zero, // changes the position of the shadow
            ),

          ],
          border: Border.all(
              color:  Color(0xffcdd3e0),
              width: getWidth(context, 20),
              strokeAlign: BorderSide.strokeAlignOutside)),
    );
  }
}
