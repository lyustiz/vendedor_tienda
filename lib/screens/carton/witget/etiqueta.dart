import 'package:flutter/material.dart';

class Etiqueta extends StatelessWidget {
  const Etiqueta({
    super.key,
    this.texto = 'es_CO',
  });

  final String? texto;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primary,
            ],
          ),
        ),
        child: RichText(
            text: TextSpan(
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                children: [
              TextSpan(text: texto),
            ])));
  }
}
