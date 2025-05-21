import 'package:flutter/material.dart';
import 'package:time_tracking/models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';


class TaskManagementProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void saveTasks() {
    final box = Hive.box('tasks');
    box.put('tasks', _tasks.map((t) => t.toJson()).toList());
  }

  void loadTasks() {
    final box = Hive.box('tasks');
    final tasksFromBox = box.get('tasks', defaultValue: []);
    _tasks = (tasksFromBox as List)
        .map((t) => Task.fromJson(Map<String, dynamic>.from(t)))
        .toList();
    notifyListeners();
  }
}