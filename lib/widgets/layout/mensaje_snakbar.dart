import 'package:flutter/material.dart';

class MensajeSnackBar extends StatelessWidget {
  final String type;
  final String title;
  const MensajeSnackBar({super.key, required this.type, required this.title});

  @override
  SnackBar build(BuildContext context) {
    final Map<String, Color> mensajeColor = {
      'error': Colors.red,
      'warning': Colors.amber,
      'info': Colors.blue
    };
    final Map<String, IconData> mensajeIcono = {
      'error': Icons.error,
      'warning': Icons.warning,
      'info': Icons.info
    };

    return SnackBar(
        content: Row(children: [
      Icon(
        mensajeIcono[type],
        color: mensajeColor[type],
      ),
      Container(
        margin: const EdgeInsets.only(left: 6),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ]));
  }
}
