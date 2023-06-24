import 'package:alarm_task/shared/Sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../models/alarmModel.dart';
import '../shared/Cubit/app_cubit/cubit.dart';
import '../shared/Cubit/app_cubit/state.dart';
import '../shared/widget/button.dart';
import '../shared/widget/date_time_picker.dart';
import '../shared/widget/select_date_and_time_widget.dart';

class AddAlarmScreen extends StatelessWidget {
  AddAlarmScreen({super.key, this.isedit = false});
  bool isedit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            body: CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  leading: CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                      cubit.titlecontroller.clear();
                      var newtime =
                          DateTime.now().add(const Duration(minutes: 20));
                      cubit.selectTime(newtime);
                      var newdate =
                          DateTime.now();
                      cubit.selectDate(newdate);
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  middle: Text(
                    isedit ? 'Edit Alarm' : 'New Alarm',
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff646E82)),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: getHeight(context, 100),
                      right: getWidth(context, 25),
                      left: getWidth(context, 25)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: getHeight(context, 50),
                          child: CupertinoTextField(
                            prefix: const SizedBox(
                              width: 5,
                            ),
                            controller: cubit.titlecontroller,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xff646E82),
                                )),
                            placeholder: 'Enter Alarm Title',
                            onChanged: (value) {
                              // Handle text field value changes
                            },
                          ),
                        ),
                        SizedBox(
                          height: getHeight(context, 20),
                        ),
                        SelectDateAndTimeWidget(
                          function: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) => DateTimePicker(
                                      isdate: true,
                                    )).then((value) {
                              if(isedit){cubit.AlarmForEdit.date=cubit.selectedDate;}
                            });
                          },
                          subtitle: DateFormat("E, d MMM").format(cubit.selectedDate),
                          mainText: "Date",
                        ),
                        SizedBox(
                          height: getHeight(context, 20),
                        ),
                        SelectDateAndTimeWidget(
                          function: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) => DateTimePicker(
                                      isdate: false,
                                    )).then((value) {
                                     if(isedit){cubit.AlarmForEdit.time=cubit.selectedTime;}
                                    });
                          },
                          subtitle: DateFormat("hh:mm a").format(cubit.selectedTime),
                          mainText: "Time",
                        ),
                        if (isedit) ...[
                          SizedBox(
                            height: getHeight(context, 20),
                          ),
                          Container(
                            height: getHeight(context, 75),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color(0xffE6E9EF),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xffFFFFFF).withOpacity(.53),
                                      blurRadius: 20,
                                      offset: const Offset(-5, -5),
                                      spreadRadius: 0,
                                      blurStyle: BlurStyle.outer),
                                  BoxShadow(
                                      color: const Color(0xffA6B4C8).withOpacity(.53),
                                      blurRadius: 12,
                                      offset: const Offset(13, 14),
                                      spreadRadius: -6),
                                ]),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: getWidth(context, 20)),
                              child: Row(
                                children: [
                                  const Text(
                                    "Status : ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff646E82)),
                                  ),
                                  const Spacer(),
                                  Switch(
                                    value: cubit.isactive,
                                    onChanged: (value) {
                                      cubit.chane_statuse(value);
                                      cubit.AlarmForEdit.status =
                                          value == true ? 1 : 0;
                                      print(cubit.AlarmForEdit.status);
                                    },
                                    activeColor: const Color(0xffEEF0F5),
                                    activeTrackColor: const Color(0xffFD2A22),
                                    inactiveThumbColor: const Color(0xffEEF0F5),
                                    inactiveTrackColor: const Color(0xffA6B4C8),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                        SizedBox(
                          height: getHeight(context, 50),
                        ),
                        Visibility(
                            visible: !isedit,
                            child: Button(
                              function: () {
                                if (cubit.titlecontroller.text == '') {
                                  showCupertinoDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CupertinoAlertDialog(
                                          content: const Text(
                                              "Alarm Title mustn't be empty"),
                                          actions: [
                                            CupertinoDialogAction(
                                              child: const Text('OK'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                } else {
                                  AlarmModel alarm = AlarmModel(
                                      title: cubit.titlecontroller.text,
                                      date: cubit.selectedDate,
                                      time: cubit.selectedTime,
                                      status: 1);
                                  cubit.add_alarm(alarm);

                                  Navigator.pop(context);
                                  cubit.titlecontroller.clear();
                                  var newtime =
                                      DateTime.now().add(const Duration(minutes: 20));
                                  cubit.selectTime(newtime);
                                  var newdate =
                                     DateTime.now();
                                  cubit.selectDate(newdate);

                                }
                              },
                              text: "Add New",
                            )),
                        if (isedit) ...[
                          Button(
                            function: () {
                              if (cubit.titlecontroller.text == '') {
                                showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        content:
                                            const Text("Alarm Title mustn't be empty"),
                                        actions: [
                                          CupertinoDialogAction(
                                            child: const Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                cubit.AlarmForEdit.title= cubit.titlecontroller.text;
                                AlarmModel alarm =cubit.AlarmForEdit;
                                cubit.edit_alarm(alarm);

                                Navigator.pop(context);
                                cubit.titlecontroller.clear();
                                var newtime = DateFormat("hh:mm a").format(
                                    DateTime.now().add(const Duration(minutes: 20)));
                                cubit.selectTime(newtime);
                                var newdate =
                                    DateFormat("E, d MMM").format(DateTime.now());
                                cubit.selectDate(newdate);
                              }
                            },
                            text: "Edit",
                          ),
                          SizedBox(
                            height: getHeight(context, 20),
                          ),
                          Button(
                            function: () {

                                Navigator.pop(context);
                                cubit.titlecontroller.clear();
                                var newtime =
                                    DateTime.now().add(const Duration(minutes: 20));
                                cubit.selectTime(newtime);
                                var newdate =
                                    DateTime.now();
                                cubit.selectDate(newdate);
                                cubit.delete_alarm();
                            },
                            text: "Delete",
                          )
                        ],
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}
