import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  bool isSameDateWithoutTime(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isBetweenDates({
    required DateTime dateRangeInitial,
    required DateTime dateRangeFinal,
  }) {
    return (isAfter(dateRangeInitial) || isAtSameMomentAs(dateRangeInitial)) &&
        (isBefore(dateRangeFinal) || isSameDateWithoutTime(dateRangeFinal));
  }

  DateTime get lastHourMinuteSecond {
    return zeroHourMinuteSecond
        .add(const Duration(days: 1))
        .subtract(const Duration(microseconds: 1));
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime get zeroHourMinuteSecond {
    return DateTime(
      year,
      month,
      day,
      0,
      0,
      0,
      0,
      0,
    );
  }

  DateTime get previousYear {
    return DateTime(
      year - 1,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  DateTime get previousMouth {
    return DateTime(
      year,
      month - 1,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  String dateAndHour() {
    final format = DateFormat('dd/MM/yyyy HH:mm');
    return format.format(this);
  }

  String dayMonth() {
    final format = DateFormat('dd/MM');
    return format.format(this);
  }

  String dayMonthHourMinutes() {
    final format = DateFormat('dd/MM HH:mm');
    return format.format(this);
  }

  String hourMinutes() {
    final format = DateFormat('HH:mm');
    return format.format(this);
  }

  String dayMonthYear() {
    final format = DateFormat('dd/MM/yyyy');
    return format.format(this);
  }
}
