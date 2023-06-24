import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Sizer.dart';

class DigitalClock extends StatelessWidget {
  const DigitalClock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          print(DateTime.now());
          final time =DateTime.now();
         final timeOfNow =DateFormat('hh:mm a').format(time);


          return SizedBox(
            width: getWidth(context, 232),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
               timeOfNow.toString().substring(0,5),
                  style: const TextStyle(
                    fontSize: 84,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff646E82)
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      timeOfNow.toString().substring(5,8),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff646E82)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
