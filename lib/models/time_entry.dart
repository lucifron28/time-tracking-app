class TimeEntry {
  final String id;
  final String projectId;
  final String taskId;
  final int totalMinutes;
  final DateTime date;
  final String? notes;

  TimeEntry({
    required this.id,
    required this.projectId,
    required this.taskId,
    required this.totalMinutes,
    required this.date,
    this.notes,
  });

  factory TimeEntry.fromJson(Map<String, dynamic> json) {
    return TimeEntry(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      taskId: json['taskId'] as String,
      totalMinutes: json['totalMinutes'] as int,
      date: DateTime.parse(json['date'] as String),
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectId': projectId,
      'taskId': taskId,
      'totalMinutes': totalMinutes,
      'date': date.toIso8601String(),
      'notes': notes,
    };
  }
}
