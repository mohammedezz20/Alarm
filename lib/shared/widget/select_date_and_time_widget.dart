import 'package:alarm_task/shared/Sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SelectDateAndTimeWidget extends StatelessWidget {
  SelectDateAndTimeWidget({super.key, required this.function,required this.mainText,required this.subtitle});
  var function;
  var subtitle;
  var mainText;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context, 75),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffE6E9EF),
        borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffFFFFFF).withOpacity(.53),
              blurRadius: 20,
              offset: const Offset(-5,-5),
              spreadRadius: 0,
              blurStyle: BlurStyle.outer
            ),
            BoxShadow(
              color: const Color(0xffA6B4C8).withOpacity(.53),
              blurRadius: 12,
              offset: const Offset(13,14),
              spreadRadius: -6
            ),
          ]
      ),
      child:
      Padding(
        padding:  EdgeInsets.only(left: getWidth(context, 20)),
        child: Row(children: [

          Text("$mainText : ",style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color:  Color(0xff646E82)
          ),)
        ,
          Text("$subtitle",style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color:  Color(0xff646E82)
          ),)
        ,
        const Spacer(),

        CupertinoButton(onPressed:function, child: const Icon(Icons.arrow_forward_ios,color: Color(0xff646E82),))],),
      ),
    );
  }
}
