import 'package:flutter/material.dart';

class HelpIcon extends StatelessWidget {
  final double radius;
  const HelpIcon({super.key, this.radius = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: Colors.white, width: 3),
            color: Theme.of(context).colorScheme.secondary),
        child: const Icon(Icons.question_mark, size: 26, color: Colors.white));
  }
}
