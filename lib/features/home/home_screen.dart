import 'package:daywise/app/routes/app_router.dart';
import 'package:daywise/core/services/daywise_scope.dart';
import 'package:daywise/features/calendar/calendar_screen.dart';
import 'package:daywise/features/home/widgets/guide_tab_content.dart';
import 'package:daywise/features/home/widgets/home_dashboard.dart';
import 'package:daywise/features/home/widgets/today_tab_content.dart';
import 'package:daywise/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = DayWiseScope.of(context);

    final pages = <Widget>[
      const HomeDashboard(),
      const CalendarScreen(),
      const TodayTabContent(),
      const GuideTabContent(),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: appState.bottomNavIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: appState.bottomNavIndex,
        onDestinationSelected: appState.setBottomNavIndex,
        height: 76,
        backgroundColor: Colors.white,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.today_outlined),
            selectedIcon: Icon(Icons.today),
            label: 'Today',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_outlined),
            selectedIcon: Icon(Icons.auto_awesome),
            label: 'Guide',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: appState.bottomNavIndex == 3
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouter.premium);
              },
              icon: const Icon(Icons.workspace_premium_outlined),
              label: const Text('Premium'),
            )
          : null,
    );
  }
}
