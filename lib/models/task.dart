import 'package:time_tracking/utils/id_generator.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String projectName;

  @HiveField(2)
  String name;

  Task({
    String? id,
    required this.projectName,
    required this.name,
  }) : id = id ?? IdGenerator.generate();

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String?,
      projectName: json['projectId'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectId': projectName,
      'name': name,
    };
  }
}
