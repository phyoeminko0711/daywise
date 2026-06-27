import 'package:daywise/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.color,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.surface,
      borderRadius: BorderRadius.circular(24),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
