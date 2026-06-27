import 'package:daywise/core/models/daily_guidance.dart';
import 'package:daywise/core/models/myanmar_date_info.dart';

class GuidanceRepository {
  final List<DailyGuidance> _samples = <DailyGuidance>[
    DailyGuidance(
      id: 'mon',
      gregorianDate: DateTime(2026, 6, 22),
      myanmarYear: 1388,
      myanmarMonth: 'ဝါဆို',
      myanmarDay: 7,
      weekday: 'Monday',
      doList: <String>[
        'Start planning work early and keep meetings short.',
        'Reach out to elders or mentors for practical guidance.',
        'Choose calm, ordered tasks that benefit from patience.',
      ],
      dontList: <String>[
        'Do not delay a clear decision once the facts are known.',
        'Avoid rushed spending on convenience purchases.',
      ],
      auspiciousInfo:
          'A grounded day for thoughtful commitments, learning, and home organization.',
      description:
          'Today favors discipline over speed. If you keep your schedule clean and focus on one important decision at a time, the day remains steady and productive. Conversations with family or senior colleagues can be especially useful.',
      luckyColor: 'Emerald Green',
      luckyNumber: 2,
      luckyDirection: 'East',
      isPremium: false,
    ),
    DailyGuidance(
      id: 'tue',
      gregorianDate: DateTime(2026, 6, 23),
      myanmarYear: 1388,
      myanmarMonth: 'ဝါဆို',
      myanmarDay: 8,
      weekday: 'Tuesday',
      doList: <String>[
        'Handle financial reviews and small negotiations.',
        'Keep your communication direct and documented.',
        'Make time for a short reset before evening.',
      ],
      dontList: <String>[
        'Avoid overcommitting to social plans.',
        'Do not ignore health signals caused by stress.',
      ],
      auspiciousInfo:
          'Favorable for account balancing, contracts, and measured progress.',
      description:
          'This is a practical day with good support for money-related decisions and routine discipline. Clear structure matters more than inspiration. A brief pause between work blocks helps prevent avoidable mistakes.',
      luckyColor: 'Soft Gold',
      luckyNumber: 5,
      luckyDirection: 'South-East',
      isPremium: false,
    ),
    DailyGuidance(
      id: 'wed',
      gregorianDate: DateTime(2026, 6, 24),
      myanmarYear: 1388,
      myanmarMonth: 'ဝါဆို',
      myanmarDay: 9,
      weekday: 'Wednesday',
      doList: <String>[
        'Present ideas, teach, or write something important.',
        'Tidy your workspace before starting a major task.',
        'Use the afternoon for follow-up and clarity.',
      ],
      dontList: <String>[
        'Avoid vague promises.',
        'Do not leave important messages unanswered all day.',
      ],
      auspiciousInfo:
          'A bright day for communication, learning, and relationship repair.',
      description:
          'The day supports expression and careful collaboration. If you need to explain a plan or move a discussion forward, do it with specifics and a calm tone. Written clarity brings better outcomes than last-minute improvisation.',
      luckyColor: 'Ivory White',
      luckyNumber: 7,
      luckyDirection: 'North',
      isPremium: false,
    ),
    DailyGuidance(
      id: 'thu',
      gregorianDate: DateTime(2026, 6, 25),
      myanmarYear: 1388,
      myanmarMonth: 'ဝါဆို',
      myanmarDay: 10,
      weekday: 'Thursday',
      doList: <String>[
        'Take leadership on a delayed task.',
        'Review long-term goals and priorities.',
        'Spend time with spiritual reflection or quiet reading.',
      ],
      dontList: <String>[
        'Avoid reactive arguments.',
        'Do not let minor setbacks change the larger plan.',
      ],
      auspiciousInfo:
          'Strong for responsibility, learning, and values-driven decisions.',
      description:
          'Thursday carries a stable, guiding energy. The best use of it is to finish what has been pending and to define the next responsible step. The day becomes more favorable when your actions are measured and consistent.',
      luckyColor: 'Deep Green',
      luckyNumber: 9,
      luckyDirection: 'North-East',
      isPremium: true,
    ),
    DailyGuidance(
      id: 'fri',
      gregorianDate: DateTime(2026, 6, 26),
      myanmarYear: 1388,
      myanmarMonth: 'ဝါဆို',
      myanmarDay: 11,
      weekday: 'Friday',
      doList: <String>[
        'Strengthen close relationships with kind, practical gestures.',
        'Choose elegant simplicity in work and home decisions.',
        'Wrap up open loops before the evening.',
      ],
      dontList: <String>[
        'Avoid comparing your path with others.',
        'Do not leave purchases or plans undefined.',
      ],
      auspiciousInfo:
          'Good for harmony, tasteful choices, and finishing the week with balance.',
      description:
          'The day rewards emotional steadiness and clean presentation. If you close unresolved conversations and keep your standards high, the pace becomes lighter. Beauty, order, and sincerity work in your favor.',
      luckyColor: 'Warm Gold',
      luckyNumber: 6,
      luckyDirection: 'West',
      isPremium: false,
    ),
    DailyGuidance(
      id: 'sat',
      gregorianDate: DateTime(2026, 6, 27),
      myanmarYear: 1388,
      myanmarMonth: 'ဝါဆို',
      myanmarDay: 12,
      weekday: 'Saturday',
      doList: <String>[
        'Work through one meaningful personal task from start to finish.',
        'Review the week honestly and simplify what is heavy.',
        'Take time outdoors or near natural light.',
      ],
      dontList: <String>[
        'Avoid carrying irritation into family conversations.',
        'Do not start too many unrelated tasks at once.',
      ],
      auspiciousInfo:
          'A useful day for reset, grounding, and steady personal progress.',
      description:
          'Saturday favors reset over noise. It is a good time to clear unfinished tasks, reflect without pressure, and set a practical tone for the next week. Keep the day spacious enough for rest, but structured enough to feel complete.',
      luckyColor: 'Jade',
      luckyNumber: 4,
      luckyDirection: 'South',
      isPremium: false,
    ),
    DailyGuidance(
      id: 'sun',
      gregorianDate: DateTime(2026, 6, 28),
      myanmarYear: 1388,
      myanmarMonth: 'ဝါဆို',
      myanmarDay: 13,
      weekday: 'Sunday',
      doList: <String>[
        'Set the tone for the week with a clear intention.',
        'Prepare clothes, tasks, and priorities in advance.',
        'Keep family communication warm and simple.',
      ],
      dontList: <String>[
        'Avoid doom-scrolling or unstructured distraction.',
        'Do not postpone planning until late at night.',
      ],
      auspiciousInfo:
          'Supportive for preparation, family time, and beginning again with clarity.',
      description:
          'Sunday is most helpful when it is used to reset your direction. Put tomorrow in order, leave some room for quiet, and choose one intention you can actually follow through on. The day remains auspicious when simplicity leads.',
      luckyColor: 'Pearl White',
      luckyNumber: 1,
      luckyDirection: 'North-West',
      isPremium: false,
    ),
  ];

  DailyGuidance getGuidanceForDate(DateTime date, MyanmarDateInfo myanmarDate) {
    final normalized = DateTime(date.year, date.month, date.day);

    for (final sample in _samples) {
      final sampleDate = DateTime(
        sample.gregorianDate.year,
        sample.gregorianDate.month,
        sample.gregorianDate.day,
      );
      if (sampleDate == normalized) {
        return sample.copyWith(
          gregorianDate: normalized,
          myanmarYear: myanmarDate.year,
          myanmarMonth: myanmarDate.monthName,
          myanmarDay: myanmarDate.day,
          weekday: myanmarDate.weekdayName,
        );
      }
    }

    final weekdayTemplate = _samples.firstWhere(
      (sample) => sample.weekday == _weekdayName(normalized.weekday),
      orElse: () => _samples.first,
    );

    return weekdayTemplate.copyWith(
      id: normalized.toIso8601String(),
      gregorianDate: normalized,
      myanmarYear: myanmarDate.year,
      myanmarMonth: myanmarDate.monthName,
      myanmarDay: myanmarDate.day,
      weekday: myanmarDate.weekdayName,
    );
  }

  String _weekdayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      default:
        return 'Sunday';
    }
  }
}
