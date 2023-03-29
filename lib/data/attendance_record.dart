import 'package:hive/hive.dart';

part 'attendance_record.g.dart';

@HiveType(typeId: 1)
class AttendanceRecord {
  AttendanceRecord({
    required this.name,
    required this.phone,
    required this.time,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String phone;

  @HiveField(2)
  DateTime time;
}
