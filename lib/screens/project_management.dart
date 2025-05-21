import 'package:flutter/material.dart';

class ProjectManagement extends StatelessWidget {
  const ProjectManagement({super.key});

  void _addProjectForm(BuildContext context) {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("Add Project"),
          content: TextField(
            decoration: InputDecoration(hintText: "Enter project name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // TODO: Add project logic
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      }
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
