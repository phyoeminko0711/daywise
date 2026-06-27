import 'package:daywise/core/models/myanmar_date_info.dart';
import 'package:myanmar_calendar/myanmar_calendar.dart';

class MyanmarCalendarService {
  final MyanmarCalendar _calendar = MyanmarCalendar();

  static const List<String> _monthNames = <String>[
    'ပ-ဝါဆို',
    'တန်ခူး',
    'ကဆုန်',
    'နယုန်',
    'ဝါဆို',
    'ဝါခေါင်',
    'တော်သလင်း',
    'သီတင်းကျွတ်',
    'တန်ဆောင်မုန်း',
    'နတ်တော်',
    'ပြာသို',
    'တပို့တွဲ',
    'တပေါင်း',
  ];

  static const List<String> _moonPhases = <String>[
    'လဆန်း',
    'လပြည့်',
    'လဆုတ်',
    'လကွယ်',
  ];

  static const List<String> _weekdays = <String>[
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  MyanmarDateInfo fromGregorian(DateTime date) {
    final julianDay = _calendar.gregorianToJulianDay(
      date.year,
      date.month,
      date.day,
    );
    final data = _calendar.julianDayToMyanmarDate(julianDay);

    final year = data['my'] as int;
    final monthIndex = data['mm'] as int;
    final day = data['d'] as int;
    final weekdayIndex = data['wd'] as int;
    final moonPhaseIndex = data['ms'] as int;

    final monthName = _monthNames[monthIndex];
    final weekdayName = _weekdays[weekdayIndex];
    final moonPhase = _moonPhases[moonPhaseIndex];

    return MyanmarDateInfo(
      year: year,
      monthName: monthName,
      day: day,
      weekdayName: weekdayName,
      moonPhase: moonPhase,
      localizedDate: 'မြန်မာနှစ် $year ခု, $monthName $moonPhase $day ရက်',
    );
  }
}
