import 'package:flutter/material.dart';
import 'screens/home_screen.dart';


class TimeTrackingApp extends StatelessWidget {
  const TimeTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Time Tracking App",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}