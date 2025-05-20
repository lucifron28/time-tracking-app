import 'package:flutter/material.dart';


class ProjectManagement extends StatelessWidget {
  const ProjectManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Projects"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ProjectManagementBody(),
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
    return Center(
      child: Text("Projects"),
    );
  }
}