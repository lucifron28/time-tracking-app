import 'package:flutter/material.dart';
import 'package:time_tracking/providers/time_entry_provider.dart';
import 'package:provider/provider.dart';


class AllEntries extends StatefulWidget {
  const AllEntries({super.key});

  @override
  State<AllEntries> createState() => _AllEntriesState();
}

class _AllEntriesState extends State<AllEntries> {

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<TimeEntryProvider>(context, listen: false).loadEntries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<TimeEntryProvider>(
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
          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return ListTile(
                style: ListTileStyle.drawer,
                leading: Icon(Icons.access_time),
                title: Text(entry.projectName),
                subtitle: Text(entry.taskName),
                trailing: Text("${entry.totalMinutes} min"),
              );
            },
          );
        },
      ),
    );
  }
}
