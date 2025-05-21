import 'package:flutter/material.dart';
import 'package:time_tracking/services/project_services.dart';
import 'package:time_tracking/services/task_services.dart';

class CreateTimeEntry extends StatelessWidget {
  const CreateTimeEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an entry"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: CreateTimeEntryScreen(),
    );
  }
}

class CreateTimeEntryScreen extends StatefulWidget {
  const CreateTimeEntryScreen({super.key});

  @override
  State<CreateTimeEntryScreen> createState() => _CreateTimeEntryScreenState();
}

class _CreateTimeEntryScreenState extends State<CreateTimeEntryScreen> {
  List<String> allProjects = [];
  List<String> allTasks = [];
  String? selectedProjectName;
  String? selectedTaskName;

  @override
  void initState() {
    super.initState();
    loadDropdownData();
  }

  void loadDropdownData() {
    final projects = ProjectServices.getProjects();
    final tasks = TaskServices.getTasks();

    setState(() {
      allProjects = projects.map((p) => p.name).toList();
      allTasks = tasks.map((t) => t.name).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Time Entry")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Project"),
              items: allProjects
                  .map((name) => DropdownMenuItem(
                        value: name,
                        child: Text(name),
                      ))
                  .toList(),
              value: selectedProjectName,
              onChanged: (value) {
                setState(() {
                  selectedProjectName = value;
                  // You can also filter tasks related to the selected project here
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Task"),
              items: allTasks
                  .map((name) => DropdownMenuItem(
                        value: name,
                        child: Text(name),
                      ))
                  .toList(),
              value: selectedTaskName,
              onChanged: (value) {
                setState(() {
                  selectedTaskName = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
