import 'package:daywise/app/constants/app_colors.dart';
import 'package:daywise/app/routes/app_router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    Future<void>.delayed(const Duration(milliseconds: 1800), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRouter.home);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: FadeTransition(
        opacity: _opacity,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.wb_sunny_rounded,
                  size: 42,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text('DayWise', style: textTheme.displayMedium),
              const SizedBox(height: 8),
              Text(
                'Daily guidance from the Myanmar Calendar',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
