import 'package:daywise/core/models/daily_guidance.dart';
import 'package:daywise/core/models/myanmar_date_info.dart';
import 'package:daywise/core/services/guidance_repository.dart';
import 'package:daywise/core/services/myanmar_calendar_service.dart';
import 'package:daywise/core/utils/date_formatters.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  AppState({required this.repository, required this.myanmarCalendarService}) {
    _selectedDate = DateTime.now();
    _syncDerivedState();
  }

  final GuidanceRepository repository;
  final MyanmarCalendarService myanmarCalendarService;

  late DateTime _selectedDate;
  late MyanmarDateInfo _myanmarDate;
  late DailyGuidance _guidance;
  final List<DateTime> _recentDates = <DateTime>[];
  final Set<String> _favoriteKeys = <String>{};
  int _bottomNavIndex = 0;
  bool _notificationsEnabled = true;
  bool _showMyanmarFirst = true;

  DateTime get selectedDate => _selectedDate;
  MyanmarDateInfo get myanmarDate => _myanmarDate;
  DailyGuidance get guidance => _guidance;
  int get bottomNavIndex => _bottomNavIndex;
  bool get notificationsEnabled => _notificationsEnabled;
  bool get showMyanmarFirst => _showMyanmarFirst;

  List<DateTime> get recentDates => List<DateTime>.unmodifiable(_recentDates);
  List<DateTime> get favoriteDates =>
      _favoriteKeys.map(DateTime.parse).toList()
        ..sort((a, b) => b.compareTo(a));

  bool isFavorite(DateTime date) => _favoriteKeys.contains(_normalizeKey(date));

  void selectDate(DateTime date) {
    _selectedDate = DateTime(date.year, date.month, date.day);
    _syncDerivedState();
    _pushRecentDate(_selectedDate);
    notifyListeners();
  }

  void jumpToToday() {
    setBottomNavIndex(2);
    selectDate(DateTime.now());
  }

  void setBottomNavIndex(int index) {
    _bottomNavIndex = index;
    notifyListeners();
  }

  void toggleFavorite([DateTime? date]) {
    final target = _normalizeKey(date ?? _selectedDate);
    if (_favoriteKeys.contains(target)) {
      _favoriteKeys.remove(target);
    } else {
      _favoriteKeys.add(target);
    }
    notifyListeners();
  }

  void setNotificationsEnabled(bool value) {
    _notificationsEnabled = value;
    notifyListeners();
  }

  void setShowMyanmarFirst(bool value) {
    _showMyanmarFirst = value;
    notifyListeners();
  }

  String buildShareText() {
    return '''
DayWise - Daily Guidance

${DateFormatters.longGregorian(_selectedDate)}
${_myanmarDate.localizedDate}

Do:
${_guidance.doList.map((item) => '* $item').join('\n')}

Avoid:
${_guidance.dontList.map((item) => '* $item').join('\n')}

${_guidance.auspiciousInfo}
''';
  }

  void _syncDerivedState() {
    _myanmarDate = myanmarCalendarService.fromGregorian(_selectedDate);
    _guidance = repository.getGuidanceForDate(_selectedDate, _myanmarDate);
  }

  void _pushRecentDate(DateTime date) {
    final normalized = DateTime(date.year, date.month, date.day);
    _recentDates.removeWhere((item) => item == normalized);
    _recentDates.insert(0, normalized);
    if (_recentDates.length > 8) {
      _recentDates.removeLast();
    }
  }

  String _normalizeKey(DateTime date) =>
      DateTime(date.year, date.month, date.day).toIso8601String();
}
