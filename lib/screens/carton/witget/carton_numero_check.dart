import 'package:flutter/material.dart';
import 'package:vendedor_tienda/entities/carton.dart';

class CartonNumeroCheck extends StatelessWidget {
  const CartonNumeroCheck({
    super.key,
    required this.carton,
    required this.isVendido,
  });

  final Carton carton;
  final bool isVendido;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 1),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      padding: const EdgeInsets.all(1),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              padding: const EdgeInsets.only(
                  top: 0.8, bottom: 0.8, left: 26, right: 6),
              child: Text(
                '${carton.numero}'.padLeft(4, '0'),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )),
          Positioned(
            left: -4,
            top: -1.5,
            child: Container(
              width: 23,
              height: 23,
              padding: const EdgeInsets.all(0.8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      /*Theme.of(context).colorScheme.primaryContainer,
                      Theme.of(context).colorScheme.primary,*/
                      Colors.white,
                      Colors.white
                    ],
                  )),
              child: Container(
                margin: const EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Icon(
                  (isVendido) ? Icons.check_circle : Icons.circle,
                  color: (isVendido) ? Colors.green : Colors.grey[350],
                  size: 19.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
