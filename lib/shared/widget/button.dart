import 'package:flutter/cupertino.dart';

import '../Sizer.dart';

class Button extends StatelessWidget {
   Button({super.key, required this.function,required this.text}) ;
var function;
var text;
  @override
  Widget build(BuildContext context) {
    return  CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: function,
      child: Container(
        alignment: Alignment.center,
        height: getHeight(context, 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffE6E9EF)),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Color(0xff646E82)),
        ),
      ),
    );
  }
}
