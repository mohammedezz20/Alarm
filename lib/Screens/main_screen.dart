import 'package:alarm_task/shared/Sizer.dart';
import 'package:alarm_task/shared/Cubit/app_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../shared/Cubit/app_cubit/state.dart';
import '../shared/widget/alarms_container.dart';
import '../shared/widget/clock.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(context, 20),
                ),
                 Clock(),
                // DigitalClock(),
                SizedBox(
                  height: getHeight(context, 30),
                ),
                 Expanded(
                    child:AlarmsContainer(),
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
