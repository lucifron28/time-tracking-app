import 'package:flutter/material.dart';
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
