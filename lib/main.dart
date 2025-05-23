import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracking/providers/time_entry_provider.dart';
import 'package:time_tracking/providers/project_management_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_tracking/app.dart';
import 'package:time_tracking/models/project.dart';
import 'package:time_tracking/models/task.dart';
import 'package:time_tracking/models/time_entry.dart';
import 'package:time_tracking/services/project_services.dart';
import 'package:time_tracking/services/task_services.dart';
import 'package:time_tracking/providers/task_management_provider.dart';
import 'package:time_tracking/services/time_entry_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProjectAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TimeEntryAdapter());
  await ProjectServices.init();
  await TaskServices.init();
  await TimeEntryServices.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimeEntryProvider()),
        ChangeNotifierProvider(
          create: (context) => ProjectManagementProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskManagementProvider(),
        ),
      ],
      child: TimeTrackingApp(),
    ),
  );
}
