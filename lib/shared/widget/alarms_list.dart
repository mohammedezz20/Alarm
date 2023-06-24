import 'package:alarm_task/models/alarmModel.dart';
import 'package:alarm_task/shared/Cubit/app_cubit/cubit.dart';
import 'package:alarm_task/shared/Cubit/app_cubit/state.dart';
import 'package:alarm_task/shared/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'alarm_item.dart';

class AlarmsList extends StatelessWidget {
  const AlarmsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=AppCubit.get(context);
        List<AlarmModel> alarms=cubit.alarms;
        return 
          (alarms.isNotEmpty)?  
          ListView.builder(
          itemCount: alarms.length,
            itemBuilder: (context, index) {
            AlarmModel curr=alarms[index];
            return AlarmItem(alarm: curr);
          // return Container(
          //   margin: EdgeInsets.all(10),
          //   width: 200,
          //   height: 100,
          //   child: Column(
          //     children: [
          //       Text(curr.time),
          //       Text(curr.title),
          //       Text(curr.date),
          //       Text("${curr.status}"),
          //       Text("${curr.id}"),
          //     ],
          //   ),
          // );
        }):Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: getWidth(context, 35),),
                Image.asset('assets/noAlarm.png',width: getWidth(context, 150),height: getHeight(context, 150),),
              ],
            ),
         const Text("No Alarms")
          ],
        );
      },
    );
  }
}
