import 'dart:isolate';

import 'package:alarm_task/shared/Cubit/app_cubit/cubit.dart';
import 'package:alarm_task/shared/Sizer.dart';
import 'package:alarm_task/shared/network/Local/Notification_Helper.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../Screens/add_alarm_screen.dart';
import '../Cubit/app_cubit/state.dart';
import 'alarms_list.dart';

class AlarmsContainer extends StatelessWidget {
  AlarmsContainer({Key? key}) : super(key: key);
  void printHello() {
    final DateTime now = DateTime.now();
    final int isolateId = Isolate.current.hashCode;
    print(
        "[$now] Hello, world! isolate=$isolateId function='$printHello'aboezz");
  }

  int id = 1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return CupertinoPageScaffold(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color(0xffE2E4EA),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.only(
                top: getHeight(context, 15),
                right: getHeight(context, 10),
                left: getHeight(context, 10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: getWidth(context, 30),
                      ),
                      const Text(
                        "Alarms",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff646E82)),
                      ),
                        // CupertinoButton(child: Text(
                        //   "Notification Test",
                        //   style: TextStyle(
                        //       letterSpacing: 1,
                        //       fontSize: 18,
                        //       fontWeight: FontWeight.w600,
                        //       color: Color(0xff646E82)),
                        // ), onPressed: (){
                        //   Notification_Helper.showNotification(
                        //       title: "test from flutter ",
                        //       body: "ssssssssssssssssssssssssss",
                        //       actionButtons: [
                        //         NotificationActionButton(key: "key",
                        //             color: Colors.white,
                        //             actionType: ActionType.DismissAction,
                        //             isDangerousOption: true,
                        //
                        //             label: "dww")
                        //       ],
                        //       interval:5,
                        //       actionTyp: ActionType.SilentAction,
                        //       id: 22,
                        //       year: 2023,
                        //       month: 6,
                        //       day: 24,
                        //       hour: 2,
                        //       minute: 37,
                        //       secound: 0
                        //   );
                        // })
                    ],
                  ),
                  SizedBox(
                    height: getHeight(context, 5),
                  ),
                  const Expanded(child: AlarmsList()),
                  SizedBox(
                    height: getHeight(context, 5),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.only(
                      top: getHeight(context, 5),
                      bottom: getHeight(context, 10),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: getHeight(context, 50),
                      width: getHeight(context, 180),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffFFFFFF)),
                      child: const Text(
                        "Add New",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff646E82)),
                      ),
                    ),
                    onPressed: () {
                      cubit.titlecontroller.clear();
                      var newtime = DateTime.now().add(const Duration(minutes: 20));
                      cubit.selectTime(newtime);
                      var newdate =
                          DateTime.now();
                      cubit.selectDate(newdate);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AddAlarmScreen()));
                    },
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
