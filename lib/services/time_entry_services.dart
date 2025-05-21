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
}
