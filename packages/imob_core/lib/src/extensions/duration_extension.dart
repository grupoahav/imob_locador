extension ToStringDurationExtension on Duration {
  String toStringHourMinuteSeconds() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return '${twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  String toStringWithSufix() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(inSeconds.remainder(60));

    if (inHours > 0) {
      return '${twoDigits(inHours)}h$twoDigitMinutes horas';
    } else if (inMinutes > 0) {
      return '$twoDigitMinutes:$twoDigitSeconds minutos';
    } else {
      return '$twoDigitSeconds segundos';
    }
  }
}
