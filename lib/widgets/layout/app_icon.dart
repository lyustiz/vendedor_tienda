import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double radius;
  final Color color;
  final IconData icon;
  const AppIcon(
      {super.key,
      this.radius = 40,
      this.color = Colors.red,
      this.icon = Icons.help});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: Colors.white, width: 2),
            color: color),
        child: Icon(icon, size: 28));
  }
}
