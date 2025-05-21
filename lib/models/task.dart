class Task {
  final String id;
  final String projectId;
  final String name;

  Task({
    required this.id,
    required this.projectId,
    required this.name,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
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
