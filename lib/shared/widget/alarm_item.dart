
import 'package:alarm_task/shared/Cubit/app_cubit/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../Screens/add_alarm_screen.dart';
import '../../models/alarmModel.dart';
import '../Cubit/app_cubit/cubit.dart';
import '../Sizer.dart';

class AlarmItem extends StatefulWidget {
  AlarmItem({super.key, required this.alarm});
  AlarmModel alarm;
  @override
  State<AlarmItem> createState() => _AlarmItemState(alarm);
}

class _AlarmItemState extends State<AlarmItem> {
  _AlarmItemState(this.alarm);
  AlarmModel alarm;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return CupertinoButton(
          padding: EdgeInsets.symmetric(
              vertical: getHeight(context, 5),
              horizontal: getWidth(context, 15)),
          onPressed: () {
            cubit.AlarmForEdit=alarm;
            cubit.isactive=alarm.status==1?true:false;
            cubit.titlecontroller.text = alarm.title;
            cubit.selectedDate = alarm.date;
            cubit.selectedTime = alarm.time;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAlarmScreen(
                          isedit: true,
                        )));
          },
          child: Container(
              height: getHeight(context, 75),
              decoration: BoxDecoration(
                  color: const Color(0xffEEF0F5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffFFFFFF).withOpacity(.53),
                      blurRadius: 20,
                      offset: const Offset(-5, -5),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                        color: const Color(0xffA6B4C8).withOpacity(.53),
                        blurRadius: 12,
                        offset: const Offset(13, 14),
                        spreadRadius: -6),
                  ]),
              child: Padding(
                padding: EdgeInsets.only(left: getWidth(context, 10)),
                child: Row(children: [
                  Text(
                    DateFormat("hh:mm a").format(alarm.time),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: alarm.status == 1
                            ? const Color(0xff646E82)
                            : const Color(0xff646E82).withOpacity(.5)),
                  ),
                  const Spacer(),
                  Text(
                      DateFormat("E, d MMM").format(alarm.date),
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff646E82)),
                  ),
                  Switch(
                    value: alarm.status == 1 ? true : false,
                    onChanged: (value) {
                      
                      setState(() {
                        alarm.status = value == true ? 1 : 0;
                        AppCubit.get(context).edit_alarm(alarm);
                        print(alarm.status);
                      });
                    },
                    activeColor: const Color(0xffEEF0F5),
                    activeTrackColor: const Color(0xffFD2A22),
                    inactiveThumbColor: const Color(0xffEEF0F5),
                    inactiveTrackColor: const Color(0xffA6B4C8),
                  )
                ]),
              )),
        );
      },
    );
  }
}
