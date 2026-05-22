import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';

class TimeUtils {
  static const int MINUTES_PER_HOUR = 60;
  static const int SECONDS_PER_MINUTE = 60;
  
  static DateTime now() {
    return DateTime.timestamp();
  }

  static Timestamp nowTimestamp() {
    return Timestamp.fromDateTime(now());
  }

  static Duration timeSince(DateTime current, DateTime older) {
    return current.difference(older);
  }

  static Duration timeUntil(DateTime now, DateTime next) {
    return next.difference(now);
  }

  static String formatTime(Duration duration, {int numDigits = 2}) {
    int seconds = duration.inSeconds;
    int minutes = duration.inMinutes;
    int hours = duration.inHours;

    switch (numDigits) {
      case 1:
        if (hours > 0) {
          return '$hours';
        }
        else if (minutes > 0) {
          return '$minutes';
        }
        else {
          return '$seconds';
        }

      case 2:
        if (hours > 0) {
          minutes -= hours * MINUTES_PER_HOUR;
          return '${hours}h ${minutes}m';
        } else if (minutes > 0) {
          seconds -= minutes * SECONDS_PER_MINUTE;
          return '${minutes}m ${seconds}s';
        }
        else {
          return '$seconds';
        }

      case 3:
        seconds -= minutes * SECONDS_PER_MINUTE;
        minutes -= hours * MINUTES_PER_HOUR;
        return '${hours}h ${minutes}m ${seconds}s';

    }

    return '${duration.inSeconds}';
  }
}