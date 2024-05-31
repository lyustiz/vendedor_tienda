import 'package:intl/intl.dart';

abstract class Model {
  static int dateToInt(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

  DateTime? intToDate(int? timestamp) {
    if (timestamp != null) {
      return DateTime.fromMillisecondsSinceEpoch(timestamp);
    }
    return null;
  }

  String? intToDateTimeString(int? timestamp) {
    if (timestamp != null) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      return DateFormat('MM/dd/yyyy hh:mm a').format(dateTime);
    }
    return null;
  }

  String? intToDateString(int? timestamp) {
    if (timestamp != null) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      return DateFormat('MM/dd/yyyy').format(dateTime);
    }
    return null;
  }

  String? intToTimeString(int? timestamp) {
    if (timestamp != null) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      return DateFormat('hh:mm a').format(dateTime);
    }
    return null;
  }

  int? nowToInt() {
    return (DateTime.now().millisecondsSinceEpoch);
  }
}
