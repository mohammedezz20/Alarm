
class AlarmModel {
   var  id;
   String title;
   DateTime date;
   DateTime time;
   int status;

  AlarmModel({
    this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toString(),
      'time': time.toString(),
      'status': status,
    };
  }
}
