import 'package:daywise/app/constants/app_colors.dart';
import 'package:daywise/app/routes/app_router.dart';
import 'package:daywise/core/widgets/app_card.dart';
import 'package:daywise/core/widgets/mm_text.dart';
import 'package:flutter/material.dart';

class GuideTabContent extends StatelessWidget {
  const GuideTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Guide', style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              'A clean preview of where DayWise can grow next.',
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 20),
            const AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.lock_outline, color: AppColors.accentGold),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Unlock detailed insights with Premium',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  MmText(
                    'နေ့စဉ်အသေးစိတ်ဖတ်ရှုမှု၊ အကြိုက်ဆုံးနေ့များသိမ်းဆည်းမှု၊ နှင့် အထူးလမ်းညွှန်များကို နောက်ပိုင်းဗားရှင်းတွင် ထည့်သွင်းရန် အသင့်ပြင်ထားသည်။',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Planned Premium Features', style: textTheme.titleLarge),
                  const SizedBox(height: 16),
                  const _GuideFeatureRow(
                    icon: Icons.stars_rounded,
                    title: 'Extended daily interpretation',
                    subtitle:
                        'Longer insights, timing cues, and personalized notes.',
                  ),
                  const SizedBox(height: 12),
                  const _GuideFeatureRow(
                    icon: Icons.favorite_outline,
                    title: 'Favorites history',
                    subtitle: 'Save meaningful dates and revisit them quickly.',
                  ),
                  const SizedBox(height: 12),
                  const _GuideFeatureRow(
                    icon: Icons.notifications_active_outlined,
                    title: 'Smart reminders',
                    subtitle: 'Prepare for auspicious days before they arrive.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRouter.premium);
                },
                child: const Text('View Premium Preview'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GuideFeatureRow extends StatelessWidget {
  const _GuideFeatureRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
