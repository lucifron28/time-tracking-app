import 'package:flutter/material.dart';
import 'package:time_tracking/models/time_entry.dart';
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

  Future<void> loadEntries() async {
    _entries = await TimeEntryServices.getTimeEntries();
    notifyListeners();
  }

  void clearEntries() {
    _entries.clear();
    TimeEntryServices.deleteAllTimeEntries();
    notifyListeners();
  }

}
