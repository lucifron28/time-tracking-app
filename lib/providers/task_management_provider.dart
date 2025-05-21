import 'package:flutter/material.dart';
import 'package:time_tracking/models/task.dart';
import 'package:time_tracking/services/task_services.dart';


class TaskManagementProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    TaskServices.addTask(task);
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    TaskServices.deleteTask(id);
    notifyListeners();
  }

  void updateTask(Task task) {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      TaskServices.updateTask(task);
      notifyListeners();
    }
  }

  void loadTasks() {
    _tasks = TaskServices.getTasks();
    notifyListeners();
  }
}