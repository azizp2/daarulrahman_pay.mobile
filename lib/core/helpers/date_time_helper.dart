import 'package:intl/intl.dart';

class DateTimeHelper {
  DateTimeHelper._();

  static String format(
    DateTime? date, {
    String pattern = 'dd/MM/yyyy',
    String fallback = '',
  }) {
    if (date == null) return fallback;
    return DateFormat(pattern).format(date);
  }

  static DateTime? parse(String? text, {pattern = 'dd/MM/yyyy'}) {
    if (text == null || text.trim().isEmpty) return null;

    try {
      return DateFormat(pattern).parse(text);
    } catch (_) {
      return null;
    }
  }
}
