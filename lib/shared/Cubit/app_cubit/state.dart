abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppAddAlarmSuccessState extends AppStates{}
class AppAddAlarmSFaildState extends AppStates{
  String error;
  AppAddAlarmSFaildState(this.error){
    print(error);
  }
}
class AppGetAlarmsSuccessState extends AppStates{}
class AppGetAlarmsSFaildState extends AppStates{
  String error;
  AppGetAlarmsSFaildState(this.error){
    print(error);
  }
}
class AppSelectTimeState extends AppStates{}
class AppSelectDateState extends AppStates{}
class AppChaneStatusState extends AppStates{}
class AppEditAlarmSuccessState extends AppStates{}
class AppEditAlarmFaildState extends AppStates{
  String error;
  AppEditAlarmFaildState(this.error){
    print(error);
  }
}
class AppDeleteAlarmSuccessState extends AppStates{}
class AppDeleteAlarmFaildState extends AppStates{
  String error;
  AppDeleteAlarmFaildState(this.error){
    print(error);
  }
}