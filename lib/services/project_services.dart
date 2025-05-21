import 'package:hive/hive.dart';
import 'package:time_tracking/models/project.dart';

class ProjectServices {
  static const String _boxName = 'projects';

  static Future<void> init() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<Project>(_boxName);
    }
  }

  static Box<Project> get _box => Hive.box<Project>(_boxName);

  static Future<void> addProject(Project project) async {
    await _box.put(project.id, project);
  }

  static List<Project> getProjects() {
    return _box.values.toList();
  }

  static Future<void> updateProject(Project project) async {
    await _box.put(project.id, project);
  }

  static Future<void> deleteProject(String id) async {
    await _box.delete(id);
  }
}
