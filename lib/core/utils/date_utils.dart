import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class DateUtilsHelper {
  static String getHijriDate(DateTime date) {
    final hijriDate = HijriCalendar.fromDate(date);
    return hijriDate.fullDate();
  }

  static String getGregorianDateFormatted(DateTime date) {
    return DateFormat('EEEE, dd MMMM yyyy').format(date);
  }

  static DateTime getMonthStart(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  static DateTime getMonthEnd(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }

  static bool isFutureDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final compareDate = DateTime(date.year, date.month, date.day);
    return compareDate.isAfter(today);
  }
}
