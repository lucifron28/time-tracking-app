import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracking/providers/time_entry_provider.dart';
import 'package:time_tracking/services/project_services.dart';
import 'package:time_tracking/services/task_services.dart';
import 'package:intl/intl.dart';
import 'package:time_tracking/models/time_entry.dart';

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
  final TextEditingController timeController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  DateTime selectedDate = DateTime.now();

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

  void _saveTimeEntry(BuildContext context) async {
    final totalTimeStr = timeController.text.trim();
    final notes = noteController.text.trim();

    if (selectedProjectName == null ||
        selectedTaskName == null ||
        totalTimeStr.isEmpty) {
      // show a snackbar or alert
      return;
    }

    final totalMinutes = (double.tryParse(totalTimeStr) ?? 0 * 60).toInt();

    final newEntry = TimeEntry(
      projectName: selectedProjectName!,
      taskName: selectedTaskName!,
      totalMinutes: totalMinutes,
      date: selectedDate,
      notes: notes.isEmpty ? null : notes,
    );

    Provider.of<TimeEntryProvider>(context, listen: false).addEntry(newEntry);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Time entry saved successfully!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
    if (!context.mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: "Project"),
            items: allProjects
                    .map(
                      (name) =>
                          DropdownMenuItem(value: name, child: Text(name)),
                    )
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
            items:
                allTasks
                    .map(
                      (name) =>
                          DropdownMenuItem(value: name, child: Text(name)),
                    )
                    .toList(),
            value: selectedTaskName,
            onChanged: (value) {
              setState(() {
                selectedTaskName = value;
              });
            },
          ),
          Text("Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}"),
          ElevatedButton(
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                setState(() {
                  selectedDate = picked;
                });
              }
            },
            child: Text("Select Date"),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: timeController,
            decoration: InputDecoration(labelText: "Time (in hours)"),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: noteController,
            decoration: InputDecoration(labelText: "Note"),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _saveTimeEntry(context),
            child: Text("Save Entry"),
          ),
        ],
      ),
    );
  }
}
