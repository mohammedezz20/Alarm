
import 'package:alarm_task/shared/Cubit/app_cubit/cubit.dart';
import 'package:alarm_task/shared/bloc_obserer.dart';
import 'package:alarm_task/shared/network/Local/Notification_Helper.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/main_screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer=MyBlocObserver();
  Notification_Helper.initializeNotification();
  runApp(const MainApp());



  await AndroidAlarmManager.periodic(const Duration(seconds: 5), 1, (){
    print("helllllo");
  });

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..db.database()..get_alarms(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
