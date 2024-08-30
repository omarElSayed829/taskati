
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class taskModel {
  @HiveField(0)
  late final String id;
  @HiveField(1)
  late final String title;
  @HiveField(2)
  late final String note; 
  @HiveField(3)
  late final String date;
  @HiveField(4)
  late final String startTime;
  @HiveField(5)
  late final String endTime;
  @HiveField(6)
  late final int color;
  @HiveField(7)
  late final bool isCompleted;

taskModel({
  required this.id,
  required this.title,
  required this.note,
  required this.date,
  required this.startTime,
  required this.endTime,
  required this.color,
  required this.isCompleted
});



}


