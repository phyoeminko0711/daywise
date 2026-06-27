class DailyGuidance {
  const DailyGuidance({
    required this.id,
    required this.gregorianDate,
    required this.myanmarYear,
    required this.myanmarMonth,
    required this.myanmarDay,
    required this.weekday,
    required this.doList,
    required this.dontList,
    required this.auspiciousInfo,
    required this.description,
    required this.luckyColor,
    required this.luckyNumber,
    required this.luckyDirection,
    required this.isPremium,
  });

  final String id;
  final DateTime gregorianDate;
  final int myanmarYear;
  final String myanmarMonth;
  final int myanmarDay;
  final String weekday;
  final List<String> doList;
  final List<String> dontList;
  final String auspiciousInfo;
  final String description;
  final String luckyColor;
  final int luckyNumber;
  final String luckyDirection;
  final bool isPremium;

  DailyGuidance copyWith({
    String? id,
    DateTime? gregorianDate,
    int? myanmarYear,
    String? myanmarMonth,
    int? myanmarDay,
    String? weekday,
    List<String>? doList,
    List<String>? dontList,
    String? auspiciousInfo,
    String? description,
    String? luckyColor,
    int? luckyNumber,
    String? luckyDirection,
    bool? isPremium,
  }) {
    return DailyGuidance(
      id: id ?? this.id,
      gregorianDate: gregorianDate ?? this.gregorianDate,
      myanmarYear: myanmarYear ?? this.myanmarYear,
      myanmarMonth: myanmarMonth ?? this.myanmarMonth,
      myanmarDay: myanmarDay ?? this.myanmarDay,
      weekday: weekday ?? this.weekday,
      doList: doList ?? this.doList,
      dontList: dontList ?? this.dontList,
      auspiciousInfo: auspiciousInfo ?? this.auspiciousInfo,
      description: description ?? this.description,
      luckyColor: luckyColor ?? this.luckyColor,
      luckyNumber: luckyNumber ?? this.luckyNumber,
      luckyDirection: luckyDirection ?? this.luckyDirection,
      isPremium: isPremium ?? this.isPremium,
    );
  }
}
