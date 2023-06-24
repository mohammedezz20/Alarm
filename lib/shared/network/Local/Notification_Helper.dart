import 'package:alarm_task/res/assets_res.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class Notification_Helper {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: "high_importance_channel",
              channelName: "channelName",
              channelDescription: "alarm task",
              ledColor: Colors.white,
              importance: NotificationImportance.Max,
              channelShowBadge: true,
              enableVibration: true,
              playSound: true,
              enableLights:true ,
              onlyAlertOnce: false,
              criticalAlerts: true,
              defaultRingtoneType: DefaultRingtoneType.Ringtone,)
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: "important channel group",
              channelGroupName: "Alarm Group")
        ],
        debug: true);

    await AwesomeNotifications().isNotificationAllowed().then((value) async {
      if (!value) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    print("onNotificationCreatedMethod");
  }

  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    print("onNotificationDisplayedMethod");
  }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    print("onDismissActionReceivedMethod");
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    print("onActionReceivedMethod");
    final payload = receivedAction.payload ?? {};

    if (payload["navigation"] == true) {
      print("payload Navigation");
    }
  }

  static Future<void> showNotification({
    required final String title,
    required final String body,
    required final int id,
    required final int year,
    required final int month,
    required final int day,
    required final int hour,
    required final int minute,
    required final int secound,
    final String? summary,
    final ActionType actionTyp = ActionType.Default,
    final Map<String, String>? payload,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final bool schesuled = false,
    final int? interval,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id,
          channelKey: "high_importance_channel",
          title: title,
          body: body,
          actionType: actionTyp,
          notificationLayout: notificationLayout,
          summary: summary,
          category: category,

          wakeUpScreen: true,
          customSound: 'resource://assets/alarm.mp3',
          payload: payload,
          autoDismissible: false,
          bigPicture: bigPicture,
          fullScreenIntent: true),
      actionButtons: actionButtons,
      schedule: schesuled
          ? NotificationCalendar(
              year: year,
              month: month,
              day: day,
              hour: hour,
              minute: minute,
              second: secound)
          : null,
    );
  }
}
