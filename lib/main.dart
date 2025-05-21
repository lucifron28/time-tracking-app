import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracking/providers/time_entry_provider.dart';
import 'package:time_tracking/providers/project_management_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_tracking/app.dart';
import 'package:time_tracking/models/project.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProjectAdapter());
  await Hive.openBox('time_entries');
  await Hive.openBox('projects');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TimeEntryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProjectManagementProvider(),
        ),
      ],
      child: TimeTrackingApp(),
    ),
  );
}
