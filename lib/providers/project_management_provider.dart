import 'package:flutter/material.dart';
import 'package:time_tracking/models/project.dart';
import 'package:time_tracking/services/project_services.dart';


class ProjectManagementProvider with ChangeNotifier {
  List<Project> _projects = [];

  List<Project> get projects => _projects;

  void addProject(Project project) {
    _projects.add(project);
    ProjectServices.addProject(project);
    notifyListeners();
  }

  void deleteProject(String id) {
    _projects.removeWhere((project) => project.id == id);
    ProjectServices.deleteProject(id);
    notifyListeners();
  }
  void updateProject(Project project) {
    final index = _projects.indexWhere((p) => p.id == project.id);
    if (index != -1) {
      _projects[index] = project;
      ProjectServices.updateProject(project);
      notifyListeners();
    }
  }
  void loadProjects() {
    _projects = ProjectServices.getProjects();
    notifyListeners();
  }
}