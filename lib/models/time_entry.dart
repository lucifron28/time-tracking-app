import 'package:time_tracking/utils/id_generator.dart';
import 'package:hive/hive.dart';

part 'time_entry.g.dart';

@HiveType(typeId: 2)
class TimeEntry {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String projectName;
  @HiveField(2)
  final String taskName;
  @HiveField(3)
  final int totalMinutes;
  @HiveField(4)
  final DateTime date;
  @HiveField(5)
  final String? notes;

  TimeEntry({
    String? id,
    required this.projectName,
    required this.taskName,
    required this.totalMinutes,
    required this.date,
    this.notes,
  }) : id = id ?? IdGenerator.generate();

  factory TimeEntry.fromJson(Map<String, dynamic> json) {
    return TimeEntry(
      id: json['id'] as String?,
      projectName: json['projectName'] as String,
      taskName: json['taskName'] as String,
      totalMinutes: json['totalMinutes'] as int,
      date: DateTime.parse(json['date'] as String),
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectName': projectName,
      'taskName': taskName,
      'totalMinutes': totalMinutes,
      'date': date.toIso8601String(),
      'notes': notes,
    };
  }
}
