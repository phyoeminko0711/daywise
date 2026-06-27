import 'package:daywise/app/routes/app_router.dart';
import 'package:daywise/core/extensions/date_time_extension.dart';
import 'package:daywise/core/services/daywise_scope.dart';
import 'package:daywise/core/utils/date_formatters.dart';
import 'package:daywise/core/widgets/app_card.dart';
import 'package:daywise/core/widgets/mm_text.dart';
import 'package:flutter/material.dart';

class TodayTabContent extends StatelessWidget {
  const TodayTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = DayWiseScope.of(context);
    final today = DateTime.now();
    final myanmar = appState.myanmarDate;
    final guidance = appState.guidance;
    final textTheme = Theme.of(context).textTheme;

    if (!appState.selectedDate.isSameDate(today)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        appState.selectDate(today);
      });
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Today', style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              DateFormatters.longGregorian(today),
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 18),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MmText(myanmar.localizedDate, style: textTheme.titleLarge),
                  const SizedBox(height: 12),
                  Text(guidance.auspiciousInfo, style: textTheme.bodyLarge),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRouter.guidance);
                      },
                      child: const Text('Open Today\'s Guidance'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
