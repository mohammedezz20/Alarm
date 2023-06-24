import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/alarmModel.dart';

class DB_Helper {
   Future<Database> database() async {

    return openDatabase(
      "alarm.db",
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE alarms(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, date TEXT, time TEXT, realDate TEXT, realTime TEXT, status INTEGER)',
        ).then((value){
          print("database Created");
        });
      },
    ).then((value) {
      print('database Opened');
      return value;
    });
  }

   Future<int> addToDatabase(AlarmModel alarm) async {
    final db = await database();
    int id=0;
    await db.insert(
      'alarms',
      alarm.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ).then((value) {
      id=value;
    });
    return id;
  }

   Future<List<AlarmModel>> getAlarms() async {
    final db = await database();
    final List<Map<String, dynamic>> maps = await db.query('alarms');

    return List.generate(maps.length, (index) {
      return AlarmModel(
        id: maps[index]['id'],
        title: maps[index]['title'],
        date: DateFormat('yyyy-MM-dd HH:mm:ss').parse(maps[index]['date']),
        time: DateFormat('yyyy-MM-dd HH:mm:ss').parse(maps[index]['time']),
        status: maps[index]['status'],


      );
    });
  }

   Future<void> editAlarm(AlarmModel alarm) async {
    final db = await database();
    await db.update(
      'alarms',
      alarm.toMap(),
      where: 'id = ?',
      whereArgs: [alarm.id],
    ).then((value){
      print("alarm Updated Successfully");
    });
  }

   Future<void> deleteAlarm(int id) async {
    final db = await database();
    await db.delete(
      'alarms',
      where: 'id = ?',
      whereArgs: [id],
    ).then((value) {
      print("Alarm deleted successfully");
    });
  }
}
