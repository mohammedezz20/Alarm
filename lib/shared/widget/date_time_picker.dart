import 'package:alarm_task/shared/Cubit/app_cubit/cubit.dart';
import 'package:alarm_task/shared/Cubit/app_cubit/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatelessWidget {
   DateTimePicker({super.key, required this.isdate}) ;
   var  isdate=true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit =AppCubit.get(context);
        return SizedBox(
          height: 250,
          width: double.infinity,
          child: CupertinoDatePicker(
            backgroundColor: Colors.white,
            onDateTimeChanged: (DateTime newTime){
              isdate?cubit.selectDate(newTime):cubit.selectTime(newTime);

            },
            minimumDate: DateTime.now(),
            use24hFormat: false,
            mode: isdate?CupertinoDatePickerMode.date:CupertinoDatePickerMode.time,
            showDayOfWeek: true,
          ),
        );
      },
    );
  }
}
