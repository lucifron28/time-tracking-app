import 'package:time_tracking/utils/id_generator.dart';

class Task {
  final String id;
  final String projectId;
  final String name;

  Task({
    String? id,
    required this.projectId,
    required this.name,
  }) : id = id ?? IdGenerator.generate();

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String?,
      projectId: json['projectId'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectId': projectId,
      'name': name,
    };
  }
}
