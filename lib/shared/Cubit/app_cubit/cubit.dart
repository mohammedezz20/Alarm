import 'package:alarm_task/models/alarmModel.dart';
import 'package:alarm_task/shared/Cubit/app_cubit/state.dart';
import 'package:alarm_task/shared/network/Local/Notification_Helper.dart';
import 'package:alarm_task/shared/network/Local/dbHelper.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../models/durationModel.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  var db = DB_Helper();

  DateTime selectedTime = DateTime.now().add(const Duration(minutes: 20));
  DateTime selectedDate = DateTime.now();
  var titlecontroller = TextEditingController();
  var isactive = true;
  var AlarmForEdit;

  chane_statuse(bool newstatus) {
    isactive = newstatus;
    emit(AppChaneStatusState());
  }

  selectTime(newTime) {
    selectedTime = newTime;
    emit(AppSelectTimeState());
  }

  selectDate(newTime) {
    selectedDate = newTime;
    emit(AppSelectDateState());
  }

  List<AlarmModel> alarms = [];
  add_alarm(AlarmModel alarm) async {
    try {
      var id = await db.addToDatabase(alarm);
      print(id);
      DurationModel duration =calculateDuration(alarm.time,alarm.date);
      Notification_Helper.showNotification(
          title:'Alarm',
          body: alarm.title,
          schesuled: true,
          actionButtons: [
            NotificationActionButton(key: "key",
                color: Colors.white,
                actionType: ActionType.DismissAction,
                label: "Stop")
          ],
          actionTyp: ActionType.SilentAction,
          id: id,
          year: duration.years,
          month: duration.months,
          day: duration.days,
          hour: duration.hours,
          minute: duration.minutes,
          secound: 0
      );


      get_alarms();

      emit(AppAddAlarmSuccessState());
    } catch (error) {
      print("error when add to database : ${error.toString()} ");
      emit(AppAddAlarmSFaildState(error.toString()));
    }
  }

  get_alarms() async {
    alarms = [];
    try {
      alarms = await db.getAlarms();
      emit(AppGetAlarmsSuccessState());
    } catch (error) {
      emit(AppAddAlarmSFaildState(error.toString()));
    }
  }

  edit_alarm(alarm) {
    try {
      db.editAlarm(alarm);
      emit(AppEditAlarmSuccessState());
    } catch (error) {
      emit(AppEditAlarmFaildState(error.toString()));
    }
  }

  delete_alarm() {
    try {
      db.deleteAlarm(AlarmForEdit.id);
      get_alarms();
      emit(AppDeleteAlarmSuccessState());
    } catch (error) {
      emit(AppDeleteAlarmFaildState(error.toString()));
    }
  }

  DurationModel calculateDuration(
      DateTime time, DateTime date) {
    print(time);
    print(date);
    int years =date.year;
    int months=date.month;
    int days =date.day;
    int hours =time.hour;
    int minutes = time.minute;
    print("==================================================================");
    print("years : $years");
    print("months : $months");
    print("days : $days");
    print("houres : $hours");
    print("minutes : $minutes");
    print("==================================================================");

    return DurationModel(
      years: years,
      months: months,
      days: days,
      hours: hours,
      minutes: minutes,
    );
  }
}
