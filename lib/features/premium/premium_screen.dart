import 'package:daywise/app/constants/app_colors.dart';
import 'package:daywise/core/widgets/app_card.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Premium')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Premium Preview', style: textTheme.headlineMedium),
              const SizedBox(height: 10),
              Text(
                'This screen is intentionally a placeholder for the MVP. The app remains offline-first with no payment flow yet.',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 20),
              AppCard(
                color: const Color(0xFFFFFCF2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.accentGold.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.workspace_premium_rounded,
                            color: AppColors.accentGold,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Unlock detailed insights with Premium',
                            style: textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Future versions can add richer guidance history, advanced auspicious timing, reminders, favorites sync, and personalized reading layers.',
                      style: textTheme.bodyLarge?.copyWith(height: 1.6),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
