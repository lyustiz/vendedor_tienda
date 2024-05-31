import 'package:flutter/material.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/screens/carton/witget/carton_bingo.dart';
import 'package:vendedor_tienda/screens/carton/witget/carton_rombo.dart';

class CartonContainer extends StatelessWidget {
  const CartonContainer(
      {super.key,
      required this.carton,
      required this.tipojuego,
      required this.encabezado,
      this.verFondo = true});

  final Carton carton;
  final String tipojuego;
  final bool verFondo;
  final String encabezado;

  @override
  Widget build(BuildContext context) {
    DecorationImage? imagenFondo = verFondo
        ? const DecorationImage(
            image: AssetImage('assets/images/fondo_carton.png'),
            alignment: Alignment.topCenter,
            fit: BoxFit.fill)
        : null;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          image: imagenFondo,
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: (tipojuego == 'B')
                          ? const AssetImage('assets/images/marco_bingo.png')
                          : const AssetImage('assets/images/marco_carton.png'),
                      alignment: Alignment.center,
                      fit: BoxFit.fill),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: (tipojuego == 'B')
                    ? CartonBingo(
                        carton: carton,
                        encabezado: encabezado,
                      )
                    : CartonRombo(carton: carton)),
          ],
        ),
      );
    });
  }
}
