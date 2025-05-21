import 'package:flutter/material.dart';
import 'package:time_tracking/models/time_entry.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_tracking/services/time_entry_services.dart';

class TimeEntryProvider with ChangeNotifier {
  List<TimeEntry> _entries = [];

  List<TimeEntry> get entries => _entries;

  void addEntry(TimeEntry entry) {
    _entries.add(entry);
    TimeEntryServices.addTimeEntry(entry);
    notifyListeners();
  }

  void deleteEntry(String id) {
    _entries.removeWhere((entry) => entry.id == id);
    TimeEntryServices.deleteTimeEntry(id);
    notifyListeners();
  }

  void updateEntry(TimeEntry entry) {
    final index = _entries.indexWhere((e) => e.id == entry.id);
    if (index != -1) {
      _entries[index] = entry;
      TimeEntryServices.updateTimeEntry(entry);
      notifyListeners();
    }
  }

  void loadEntries() {
    final box = Hive.box('time_entries');
    final entriesFromBox = box.get('entries', defaultValue: []);
    _entries = (entriesFromBox as List)
        .map((e) => TimeEntry.fromJson(Map<String, dynamic>.from(e)))
        .toList();
    notifyListeners();
  }

  void clearEntries() {
    _entries.clear();
    TimeEntryServices.deleteAllTimeEntries();
    notifyListeners();
  }

}
