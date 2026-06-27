import 'package:daywise/app/constants/app_colors.dart';
import 'package:daywise/app/routes/app_router.dart';
import 'package:daywise/core/services/daywise_scope.dart';
import 'package:daywise/core/utils/date_formatters.dart';
import 'package:daywise/core/widgets/animated_entrance.dart';
import 'package:daywise/core/widgets/app_card.dart';
import 'package:daywise/core/widgets/mm_text.dart';
import 'package:daywise/core/widgets/scale_tap.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = DayWiseScope.of(context);
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final quickActionCount = constraints.maxWidth >= 640 ? 4 : 2;

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AnimatedEntrance(
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu_rounded),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(
                                  alpha: 0.08,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.wb_sunny_rounded,
                                color: AppColors.primary,
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('DayWise', style: textTheme.headlineSmall),
                            const SizedBox(height: 4),
                            Text(
                              'Daily guidance from the Myanmar Calendar',
                              textAlign: TextAlign.center,
                              style: textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_rounded),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                AnimatedEntrance(
                  delay: const Duration(milliseconds: 100),
                  child: AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Selected Date', style: textTheme.titleMedium),
                        const SizedBox(height: 16),
                        Text(
                          DateFormatters.longGregorian(appState.selectedDate),
                          style: textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 12),
                        MmText(
                          appState.myanmarDate.localizedDate,
                          style: textTheme.bodyLarge?.copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: <Widget>[
                            ScaleTap(
                              onTap: () => _pickDate(context, appState),
                              child: Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.08,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(
                                  Icons.calendar_month_rounded,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => _pickDate(context, appState),
                                child: const Text('Change date'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                AnimatedEntrance(
                  delay: const Duration(milliseconds: 180),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRouter.guidance);
                      },
                      child: const Text('View Daily Guidance'),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                AnimatedEntrance(
                  delay: const Duration(milliseconds: 260),
                  child: _SectionTitle(
                    title: 'Recent Dates',
                    actionLabel: 'Today',
                    onPressed: appState.jumpToToday,
                  ),
                ),
                const SizedBox(height: 14),
                AnimatedEntrance(
                  delay: const Duration(milliseconds: 320),
                  child: SizedBox(
                    height: 112,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: appState.recentDates.isEmpty
                          ? 1
                          : appState.recentDates.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        if (appState.recentDates.isEmpty) {
                          return const _EmptyRecentCard();
                        }
                        final date = appState.recentDates[index];
                        final isSelected = date == appState.selectedDate;
                        return ScaleTap(
                          onTap: () => appState.selectDate(date),
                          child: _RecentDateCard(
                            date: date,
                            isSelected: isSelected,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                AnimatedEntrance(
                  delay: const Duration(milliseconds: 400),
                  child: const _SectionTitle(title: 'Quick Actions'),
                ),
                const SizedBox(height: 14),
                AnimatedEntrance(
                  delay: const Duration(milliseconds: 460),
                  child: GridView.count(
                    crossAxisCount: quickActionCount,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: quickActionCount == 4 ? 1.4 : 0.96,
                    children: <Widget>[
                      _QuickActionCard(
                        icon: Icons.calendar_month_outlined,
                        title: 'Calendar',
                        subtitle: 'Pick any date',
                        onTap: () => appState.setBottomNavIndex(1),
                      ),
                      _QuickActionCard(
                        icon: appState.isFavorite(appState.selectedDate)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        title: 'Favorites',
                        subtitle: '${appState.favoriteDates.length} saved',
                        onTap: () {
                          if (appState.favoriteDates.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No saved favorites yet.'),
                              ),
                            );
                            return;
                          }
                          appState.selectDate(appState.favoriteDates.first);
                          Navigator.of(context).pushNamed(AppRouter.guidance);
                        },
                      ),
                      _QuickActionCard(
                        icon: Icons.auto_awesome_outlined,
                        title: 'Guidance',
                        subtitle: 'Open selected day',
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRouter.guidance);
                        },
                      ),
                      _QuickActionCard(
                        icon: Icons.share_outlined,
                        title: 'Share',
                        subtitle: 'Send summary',
                        onTap: () => SharePlus.instance.share(
                          ShareParams(text: appState.buildShareText()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _pickDate(BuildContext context, appState) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: appState.selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.primary,
              surface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selected != null) {
      appState.selectDate(selected);
    }
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, this.actionLabel, this.onPressed});

  final String title;
  final String? actionLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: <Widget>[
        Expanded(child: Text(title, style: textTheme.titleLarge)),
        if (actionLabel != null)
          TextButton(onPressed: onPressed, child: Text(actionLabel!)),
      ],
    );
  }
}

class _RecentDateCard extends StatelessWidget {
  const _RecentDateCard({required this.date, required this.isSelected});

  final DateTime date;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      width: 140,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            DateFormatters.shortGregorian(date),
            style: textTheme.titleMedium?.copyWith(
              color: isSelected ? Colors.white : AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          Text(
            DateFormatters.monthYear(date),
            style: textTheme.bodySmall?.copyWith(
              color: isSelected ? Colors.white70 : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyRecentCard extends StatelessWidget {
  const _EmptyRecentCard();

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      padding: EdgeInsets.all(18),
      child: SizedBox(
        width: 180,
        child: Center(
          child: Text('Your recently selected dates will appear here.'),
        ),
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ScaleTap(
      onTap: onTap,
      child: AppCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppColors.primary, size: 22),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
