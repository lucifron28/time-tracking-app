import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracking/models/project.dart';
import 'package:time_tracking/providers/project_management_provider.dart';
import 'package:time_tracking/widgets/add_project_form.dart';

class ProjectManagement extends StatelessWidget {
  const ProjectManagement({super.key});

  void _addProjectForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Project'),
        content: AddProjectForm(
          onSubmit: (name) {
            // save project logic here
            print("Project Name: $name");
            final newProject = Project(name: name);
            Provider.of<ProjectManagementProvider>(context, listen: false).addProject(newProject);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Projects"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ProjectManagementBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addProjectForm(context),
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProjectManagementBody extends StatefulWidget {
  const ProjectManagementBody({super.key});

  @override
  State<ProjectManagementBody> createState() => _ProjectManagementBodyState();
}

class _ProjectManagementBodyState extends State<ProjectManagementBody> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Projects"));
  }
}
