import 'package:flutter/material.dart';

class VenderButton extends StatelessWidget {
  const VenderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 36, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 80, top: 10, bottom: 10, right: 30),
            child: const Text(
              'Vender',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
            left: -6,
            top: -6,
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green),
                child: const Icon(Icons.check, size: 30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
