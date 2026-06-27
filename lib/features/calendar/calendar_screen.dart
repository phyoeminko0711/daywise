import 'package:daywise/app/constants/app_colors.dart';
import 'package:daywise/app/routes/app_router.dart';
import 'package:daywise/core/services/daywise_scope.dart';
import 'package:daywise/core/utils/date_formatters.dart';
import 'package:daywise/core/widgets/app_card.dart';
import 'package:daywise/core/widgets/mm_text.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = DayWiseScope.of(context);
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Calendar', style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              'Choose a Gregorian date and preview its Myanmar calendar details.',
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 20),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.date_range_rounded,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              DateFormatters.longGregorian(
                                appState.selectedDate,
                              ),
                              style: textTheme.titleLarge,
                            ),
                            const SizedBox(height: 6),
                            MmText(appState.myanmarDate.localizedDate),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _pickDate(context, appState),
                          icon: const Icon(Icons.calendar_month),
                          label: const Text('Select date'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Myanmar Calendar Details', style: textTheme.titleLarge),
                  const SizedBox(height: 16),
                  _CalendarDetailRow(
                    label: 'Myanmar Year',
                    value: appState.myanmarDate.year.toString(),
                  ),
                  _CalendarDetailRow(
                    label: 'Myanmar Month',
                    value: appState.myanmarDate.monthName,
                    isMyanmar: true,
                  ),
                  _CalendarDetailRow(
                    label: 'Moon Phase',
                    value: appState.myanmarDate.moonPhase,
                    isMyanmar: true,
                  ),
                  _CalendarDetailRow(
                    label: 'Weekday',
                    value: appState.myanmarDate.weekdayName,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRouter.guidance);
                },
                child: const Text('View guidance for this date'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate(BuildContext context, appState) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: appState.selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (selected != null) {
      appState.selectDate(selected);
    }
  }
}

class _CalendarDetailRow extends StatelessWidget {
  const _CalendarDetailRow({
    required this.label,
    required this.value,
    this.isMyanmar = false,
  });

  final String label;
  final String value;
  final bool isMyanmar;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: isMyanmar
                ? MmText(
                    value,
                    style: textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                : Text(
                    value,
                    textAlign: TextAlign.end,
                    style: textTheme.titleMedium,
                  ),
          ),
        ],
      ),
    );
  }
}
