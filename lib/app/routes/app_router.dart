import 'package:daywise/features/guidance/guidance_screen.dart';
import 'package:daywise/features/home/home_screen.dart';
import 'package:daywise/features/premium/premium_screen.dart';
import 'package:daywise/features/settings/settings_screen.dart';
import 'package:daywise/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

abstract final class AppRouter {
  static const splash = '/';
  static const home = '/home';
  static const guidance = '/guidance';
  static const premium = '/premium';
  static const settings = '/settings';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    late final Widget page;
    switch (routeSettings.name) {
      case splash:
        page = const SplashScreen();
      case home:
        page = const HomeScreen();
      case guidance:
        page = const GuidanceScreen();
      case premium:
        page = const PremiumScreen();
      case settings:
        page = const SettingsScreen(isStandalone: true);
      default:
        page = const HomeScreen();
    }

    return PageRouteBuilder<void>(
      settings: routeSettings,
      transitionDuration: const Duration(milliseconds: 320),
      pageBuilder: (_, animation, secondaryAnimation) => page,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        final curve = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: curve,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.04),
              end: Offset.zero,
            ).animate(curve),
            child: child,
          ),
        );
      },
    );
  }
}
