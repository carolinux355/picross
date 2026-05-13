import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';

class TimeUtils {
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

  static String formatTime(Duration duration) {
    return '${duration.inSeconds}';
  }
}