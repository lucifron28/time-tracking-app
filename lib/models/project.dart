import '../utils/id_generator.dart';
class Project {
  final String? id;
  final String name;

  Project({
    String? id,
    required this.name,
  }) : id = id ?? IdGenerator.generate();

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String?,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
