import 'package:daywise/app/constants/app_colors.dart';
import 'package:daywise/app/routes/app_router.dart';
import 'package:daywise/core/services/daywise_scope.dart';
import 'package:daywise/core/utils/date_formatters.dart';
import 'package:daywise/core/widgets/app_card.dart';
import 'package:daywise/core/widgets/mm_text.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class GuidanceScreen extends StatelessWidget {
  const GuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = DayWiseScope.of(context);
    final guidance = appState.guidance;
    final textTheme = Theme.of(context).textTheme;
    final isFavorite = appState.isFavorite(appState.selectedDate);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text('Daily Guidance'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  Text(
                    DateFormatters.longGregorian(appState.selectedDate),
                    style: textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  MmText(
                    appState.myanmarDate.localizedDate,
                    style: textTheme.bodyLarge?.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    guidance.weekday,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _GuidanceListCard(
                    title: 'Do\'s',
                    icon: Icons.check_circle_rounded,
                    iconColor: AppColors.success,
                    items: guidance.doList,
                  ),
                  const SizedBox(height: 16),
                  _GuidanceListCard(
                    title: 'Don\'ts',
                    icon: Icons.cancel_rounded,
                    iconColor: AppColors.danger,
                    items: guidance.dontList,
                  ),
                  const SizedBox(height: 16),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: AppColors.accentGold.withValues(
                                  alpha: 0.14,
                                ),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(
                                Icons.auto_awesome,
                                color: AppColors.accentGold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Auspicious Info',
                              style: textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          guidance.auspiciousInfo,
                          style: textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: <Widget>[
                            _InfoChip(
                              label: 'Lucky Color',
                              value: guidance.luckyColor,
                            ),
                            _InfoChip(
                              label: 'Lucky Number',
                              value: guidance.luckyNumber.toString(),
                            ),
                            _InfoChip(
                              label: 'Direction',
                              value: guidance.luckyDirection,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Detailed Reading', style: textTheme.titleLarge),
                        const SizedBox(height: 14),
                        Text(
                          guidance.description,
                          style: textTheme.bodyLarge?.copyWith(height: 1.7),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppCard(
                    color: const Color(0xFFFFFCF2),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.accentGold.withValues(alpha: 0.16),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.workspace_premium_outlined,
                            color: AppColors.accentGold,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Unlock detailed insights with Premium',
                                style: textTheme.titleMedium,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Extended interpretations, timing hints, and saved history are reserved for the next version.',
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => SharePlus.instance.share(
                            ShareParams(text: appState.buildShareText()),
                          ),
                          icon: const Icon(Icons.share_outlined),
                          label: const Text('Share'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => appState.toggleFavorite(),
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_rounded,
                          ),
                          label: Text(isFavorite ? 'Saved' : 'Save Favorite'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (guidance.isPremium)
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRouter.premium);
                        },
                        child: const Text('See premium preview'),
                      ),
                    ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GuidanceListCard extends StatelessWidget {
  const _GuidanceListCard({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.items,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon, color: iconColor),
              const SizedBox(width: 12),
              Text(title, style: textTheme.titleLarge),
            ],
          ),
          const SizedBox(height: 14),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: iconColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item,
                      style: textTheme.bodyLarge?.copyWith(height: 1.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x12000000)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(value, style: textTheme.titleMedium),
        ],
      ),
    );
  }
}
