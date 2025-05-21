import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/time_entry_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('time_entries');
  runApp(
    ChangeNotifierProvider(
      create: (context) => TimeEntryProvider(),
      child: TimeTrackingApp()
      )
    );
}
