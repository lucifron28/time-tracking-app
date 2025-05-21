import 'package:hive/hive.dart';
import 'package:time_tracking/models/task.dart';


class TaskServices {
  static const String _boxName = 'tasks';

  static Future<void> init() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<Task>(_boxName);
    }
  }

  static Box<Task> get _box => Hive.box<Task>(_boxName);

  static Future<void> addTask(Task task) async {
    await _box.put(task.id, task);
  }

  static List<Task> getTasks() {
    return _box.values.toList();
  }

  static Future<void> updateTask(Task task) async {
    await _box.put(task.id, task);
  }

  static Future<void> deleteTask(String id) async {
    await _box.delete(id);
  }
}