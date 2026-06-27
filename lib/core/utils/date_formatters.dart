import 'package:intl/intl.dart';

abstract final class DateFormatters {
  static final DateFormat _longGregorianFormat = DateFormat('EEEE, d MMMM y');
  static final DateFormat _shortGregorianFormat = DateFormat('d MMM y');
  static final DateFormat _monthYearFormat = DateFormat('MMMM y');

  static String longGregorian(DateTime date) =>
      _longGregorianFormat.format(date);

  static String shortGregorian(DateTime date) =>
      _shortGregorianFormat.format(date);

  static String monthYear(DateTime date) => _monthYearFormat.format(date);
}
