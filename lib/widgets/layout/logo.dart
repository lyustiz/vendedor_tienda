import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;
  final double fontSize;

  const Logo({super.key, required this.titulo, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Image(
            image: AssetImage('assets/icons/logo.png'),
            height: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            titulo,
            style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
