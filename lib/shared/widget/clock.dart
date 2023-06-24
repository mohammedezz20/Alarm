import 'package:alarm_task/shared/Sizer.dart';
import 'package:alarm_task/shared/widget/secoud_pointer.dart';
import 'package:flutter/material.dart';


import 'analog_circle.dart';
import 'hour_pointer.dart';
import 'minute_pointer.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {

          return SizedBox(
            height: getHeight(context, 203),
            width: getHeight(context, 203),
            child: Stack(
              alignment: Alignment.center,
              children: [
                 AnalogCircle(),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: getHeight(context, 162),
                    width: getHeight(context, 162),
                    child: Row(
                      children: [
                        Container(
                          height: getHeight(context, 2),
                          width: getWidth(context, 8),
                          decoration: BoxDecoration(
                              color: const Color(0xffA6B4C8),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const Spacer(),
                        Container(
                          height: getHeight(context, 2),
                          width: getWidth(context, 8),
                          decoration: BoxDecoration(
                              color: const Color(0xffA6B4C8),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: getHeight(context, 162),
                    width: getHeight(context, 162),
                    child: Column(
                      children: [
                        Container(
                          height: getHeight(context, 8),
                          width: getWidth(context, 2),
                          decoration: BoxDecoration(
                              color: const Color(0xffA6B4C8),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const Spacer(),
                        Container(
                          height: getHeight(context, 8),
                          width: getWidth(context, 2),
                          decoration: BoxDecoration(
                              color: const Color(0xffA6B4C8),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                ),
                 HourPointer(),
                 MinutePointer(),
                Container(
                  height: getHeight(context, 10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff646E82)),
                ),
                 SecoudPointer(),
                Container(
                  height: getHeight(context, 6),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffFD382D)),
                ),

              ],
            ),
          );
        });
  }
}
