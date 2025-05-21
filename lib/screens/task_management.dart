import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracking/widgets/add_task_form.dart';
import 'package:time_tracking/providers/task_management_provider.dart';


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
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Add New Task'),
            content: AddTaskForm(
              onSubmit: (task) {
                Provider.of<TaskManagementProvider>(context, listen: false).addTask(task);
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.create_new_folder_outlined, size: 32),
      ),
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
      child: Consumer<TaskManagementProvider>(
        builder: (context, provider, child) {
          final tasks = provider.tasks;
          if (tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.task, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'No tasks available',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(task.name),
                subtitle: Text(task.projectName),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    provider.deleteTask(task.id);
                  },
                ),
              );
            },
          );
        },
      ),
      );
  }
}