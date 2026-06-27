import 'package:daywise/app/constants/app_colors.dart';
import 'package:daywise/core/services/daywise_scope.dart';
import 'package:daywise/core/widgets/app_card.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, this.isStandalone = false});

  final bool isStandalone;

  @override
  Widget build(BuildContext context) {
    final appState = DayWiseScope.of(context);
    final textTheme = Theme.of(context).textTheme;

    final content = SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!isStandalone) Text('Settings', style: textTheme.headlineMedium),
          if (!isStandalone) const SizedBox(height: 8),
          if (!isStandalone)
            Text(
              'Simple MVP preferences for a clean offline experience.',
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          if (!isStandalone) const SizedBox(height: 20),
          AppCard(
            child: Column(
              children: <Widget>[
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Daily notifications'),
                  subtitle: const Text(
                    'Placeholder setting for future reminders',
                  ),
                  value: appState.notificationsEnabled,
                  onChanged: appState.setNotificationsEnabled,
                ),
                const Divider(),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Show Myanmar date first'),
                  subtitle: const Text('Adjust the order of date emphasis'),
                  value: appState.showMyanmarFirst,
                  onChanged: appState.setShowMyanmarFirst,
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('About DayWise', style: textTheme.titleLarge),
                const SizedBox(height: 14),
                Text(
                  'Version 1 keeps everything local. Guidance data is static for now and can later be replaced with SQLite or Firebase without changing the presentation layer.',
                  style: textTheme.bodyMedium?.copyWith(height: 1.6),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (!isStandalone) {
      return SafeArea(child: content);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(child: content),
    );
  }
}
