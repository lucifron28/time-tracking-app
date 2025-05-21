import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_tracking/models/project.dart';


class ProjectManagementProvider with ChangeNotifier {
  List<Project> _projects = [];

  List<Project> get projects => _projects;

  void addProject(Project project) {
    _projects.add(project);
    notifyListeners();
  }

  void deleteProject(String id) {
    _projects.removeWhere((project) => project.id == id);
    notifyListeners();
  }

  void saveProjects() {
    final box = Hive.box('projects');
    box.put('projects', _projects.map((p) => p.toJson()).toList());
  }

  void loadProjects() {
    final box = Hive.box('projects');
    final projectsFromBox = box.get('projects', defaultValue: []);
    _projects = (projectsFromBox as List)
        .map((p) => Project.fromJson(Map<String, dynamic>.from(p)))
        .toList();
    notifyListeners();
  }
}