import 'package:flutter/material.dart';
import '../models/time_entry.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TimeEntryProvider with ChangeNotifier {
  List<TimeEntry> _entries = [];

  List<TimeEntry> get entries => _entries;

  void addEntry(TimeEntry entry) {
    _entries.add(entry);
    notifyListeners();
  }

  void deleteEntry(String id) {
    _entries.removeWhere((entry) => entry.id == id);
    notifyListeners();
  }

  void saveEntries() {
    final box = Hive.box('time_entries');
    box.put('entries', _entries.map((e) => e.toJson()).toList());
  }

  void loadEntries() {
    final box = Hive.box('time_entries');
    final entriesFromBox = box.get('entries', defaultValue: []);
    _entries = (entriesFromBox as List)
        .map((e) => TimeEntry.fromJson(Map<String, dynamic>.from(e)))
        .toList();
    notifyListeners();
  }

}
