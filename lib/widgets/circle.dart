import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    required this.diameter,
    this.color = Colors.blue,
    this.child,
  });

  final double diameter;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
