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
        child: Icon(Icons.create_new_folder_outlined, size: 32),
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
    return Consumer<ProjectManagementProvider>(
      builder: (context, provider, child) {
        final projects = provider.projects;
        if (projects.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.folder_open_rounded, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text("No Projects Found", style: TextStyle(fontSize: 24, color: Colors.grey)),
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return ListTile(
              title: Text(project.name),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  provider.deleteProject(project.id);
                },
              ),
            );
          },
        );
      },
    );
  }
}
