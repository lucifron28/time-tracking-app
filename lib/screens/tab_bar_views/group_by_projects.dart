import 'package:flutter/material.dart';
import 'package:time_tracking/providers/time_entry_provider.dart';
import 'package:time_tracking/models/time_entry.dart';
import 'package:provider/provider.dart';

class GroupByProjects extends StatefulWidget {
  const GroupByProjects({super.key});

  @override
  State<GroupByProjects> createState() => _GroupByProjectsState();
}

class _GroupByProjectsState extends State<GroupByProjects> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<TimeEntryProvider>(context, listen: false).loadEntries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeEntryProvider>(
      builder: (context, provider, child) {
        final entries = provider.entries;
        if (entries.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_time, size: 100, color: Colors.grey),
              SizedBox(height: 20),
              Text(
                "No entries found",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          );
        }

        final groupedEntries = <String, List<TimeEntry>>{};

        for (var entry in entries) {
          groupedEntries.putIfAbsent(entry.projectName, () => []).add(entry);
        }

        return ListView(
          children: groupedEntries.entries.map((entry) {
            return ExpansionTile(
              title: Text(entry.key),
              children: entry.value.map((e) {
                return ListTile(
                  title: Text(e.taskName),
                  subtitle: Text("${e.totalMinutes} min"),
                );
              }).toList(),
            );
          }).toList(),
        );
      },
    );
  }
}