import 'package:daywise/app/routes/app_router.dart';
import 'package:daywise/app/theme/app_theme.dart';
import 'package:daywise/core/services/app_state.dart';
import 'package:daywise/core/services/daywise_scope.dart';
import 'package:daywise/core/services/guidance_repository.dart';
import 'package:daywise/core/services/myanmar_calendar_service.dart';
import 'package:flutter/material.dart';

class DayWiseApp extends StatefulWidget {
  const DayWiseApp({super.key});

  @override
  State<DayWiseApp> createState() => _DayWiseAppState();
}

class _DayWiseAppState extends State<DayWiseApp> {
  late final AppState _appState;

  @override
  void initState() {
    super.initState();
    _appState = AppState(
      repository: GuidanceRepository(),
      myanmarCalendarService: MyanmarCalendarService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DayWiseScope(
      notifier: _appState,
      child: MaterialApp(
        title: 'DayWise',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        initialRoute: AppRouter.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
