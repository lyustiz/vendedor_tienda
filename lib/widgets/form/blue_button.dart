import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const BlueButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 35,
        child: Center(
          child: Text(text,
              style: const TextStyle(color: Colors.white, fontSize: 17)),
        ),
      ),
    );
  }
}
