import 'package:flutter/material.dart';

class ScaleTap extends StatefulWidget {
  const ScaleTap({super.key, required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  State<ScaleTap> createState() => _ScaleTapState();
}

class _ScaleTapState extends State<ScaleTap>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.96,
      upperBound: 1,
      value: 1,
    );
    _scale = _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    await _controller.reverse();
    await _controller.forward();
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap == null ? null : _handleTap,
      child: ScaleTransition(scale: _scale, child: widget.child),
    );
  }
}
