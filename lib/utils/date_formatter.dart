import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatTime(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
  }

  static String humanReadable(DateTime dateTime) {
    return DateFormat('EEEE, MMM d, yyyy • h:mm a').format(dateTime);
  }

  static String dayOnly(DateTime dateTime) {
    return DateFormat('EEEE').format(dateTime);
  }
}
