import 'package:intl/intl.dart';

/// Formats a DateTime object into a user-friendly string representation
///
/// Returns:
/// - "now" if the time difference is less than 1 minute
/// - "yesterday" if the date was yesterday
/// - Time in 12-hour format (e.g., "2:30 PM") if it's today
/// - Date in M/d/yy format (e.g., "8/12/25") if older than yesterday
String formatTime(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  // Less than 1 minute ago
  if (difference.inMinutes < 1) {
    return "now";
  }

  // Check if it's today
  final today = DateTime(now.year, now.month, now.day);
  final messageDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

  if (messageDate.isAtSameMomentAs(today)) {
    // Today - return time in 12-hour format
    return DateFormat('h:mm a').format(dateTime);
  }

  // Check if it's yesterday
  final yesterday = today.subtract(const Duration(days: 1));
  if (messageDate.isAtSameMomentAs(yesterday)) {
    return "yesterday";
  }

  // Older than yesterday - return date in M/d/yy format
  return DateFormat('M/d/yy').format(dateTime);
}
