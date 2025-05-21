import 'package:flutter/material.dart';


class TaskManagement extends StatelessWidget {
  const TaskManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Tasks"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: TaskManagementBody(),
    );
  }
}



class TaskManagementBody extends StatefulWidget {
  const TaskManagementBody({super.key});

  @override
  State<TaskManagementBody> createState() => _TaskManagementBodyState();
}

class _TaskManagementBodyState extends State<TaskManagementBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Manage Tasks Screen"),
      );
  }
}