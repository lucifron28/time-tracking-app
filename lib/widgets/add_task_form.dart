import 'package:flutter/material.dart';
import 'package:time_tracking/services/project_services.dart';
import 'package:time_tracking/models/task.dart';

class AddTaskForm extends StatefulWidget {
  final void Function(Task task) onSubmit;

  const AddTaskForm({super.key, required this.onSubmit});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final List<String> _projectNames = ProjectServices.getProjects().map((project) => project.name).toList();
  String? _selectedProjectName;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Task newTask = Task(
        projectName: _selectedProjectName ?? _projectNames.first,
        name: _nameController.text.trim(),
      );
      widget.onSubmit(newTask);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Task Name'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Enter a name' : null,
              ),
              DropdownButtonFormField<String>(
                value: _projectNames.isNotEmpty ? _projectNames.first : null,
                decoration: const InputDecoration(labelText: 'Project Name'),
                items: _projectNames.map((projectName) {
                  return DropdownMenuItem(
                    value: projectName,
                    child: Text(projectName),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedProjectName = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Select a project' : null,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _submitForm,
                    child: const Text('Add Project'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
