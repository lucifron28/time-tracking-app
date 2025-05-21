import 'package:hive/hive.dart';
import 'package:time_tracking/models/time_entry.dart';

class TimeEntryServices {
  static const String _boxName = 'time_entries';

  static Future<void> init() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<TimeEntry>(_boxName);
    }
  }

  static Box<TimeEntry> get _box => Hive.box<TimeEntry>(_boxName);

  static Future<void> addTimeEntry(TimeEntry timeEntry) async {
    await _box.put(timeEntry.id, timeEntry);
  }

  static Future<List<TimeEntry>> getTimeEntries() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<TimeEntry>(_boxName);
    }
    return Hive.box<TimeEntry>(_boxName).values.toList();
  }

  static Future<void> updateTimeEntry(TimeEntry timeEntry) async {
    await _box.put(timeEntry.id, timeEntry);
  }

  static Future<void> deleteTimeEntry(String id) async {
    await _box.delete(id);
  }

  static Future<void> deleteAllTimeEntries() async {
    await _box.clear();
  }

  static Future<void> deleteEntriesByProject(String projectName) async {
    final box = Hive.box<TimeEntry>(_boxName);
    final keysToDelete = box.values
        .where((entry) => entry.projectName == projectName)
        .map((entry) => entry.id)
        .toList();
    for (var key in keysToDelete) {
      await box.delete(key);
    }
  }

  static Future<void> deleteEntriesByTask(String taskName) async {
    final box = Hive.box<TimeEntry>(_boxName);
    final keysToDelete = box.values
        .where((entry) => entry.taskName == taskName)
        .map((entry) => entry.id)
        .toList();
    for (var key in keysToDelete) {
      await box.delete(key);
    }
  }
}
