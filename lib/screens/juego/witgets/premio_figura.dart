import 'package:flutter/material.dart';
import 'package:vendedor_tienda/entities/premio.dart';

class PremioFigura extends StatelessWidget {
  final Premio premio;
  final String tipoJuego;

  const PremioFigura(
      {super.key, required this.premio, required this.tipoJuego});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final double wsize = constraints.maxWidth;
        const int space = 3;
        final double squareSize = (wsize - space) / 7;
        final double fontSize = (squareSize + 4) / 2;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (tipoJuego == 'B')
                ? bingo(
                    premio: premio, squareSize: squareSize, fontSize: fontSize)
                : rombo(
                    premio: premio, squareSize: squareSize, fontSize: fontSize)
          ],
        );
      }),
    );
  }

  Widget rombo(
      {required Premio premio,
      required double squareSize,
      required double fontSize}) {
    List<String> posicion = premio.posiciones.split('');
    return SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: posicion[0],
                    squareSize: squareSize,
                    fontSize: fontSize),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: posicion[1],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[2],
                    squareSize: squareSize,
                    fontSize: fontSize),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: posicion[3],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[4],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[5],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[6],
                    squareSize: squareSize,
                    fontSize: fontSize),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: posicion[7],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[8],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[9],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[10],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[11],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[12],
                    squareSize: squareSize,
                    fontSize: fontSize),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: posicion[13],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[14],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[15],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[16],
                    squareSize: squareSize,
                    fontSize: fontSize),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: posicion[17],
                    squareSize: squareSize,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: posicion[18],
                    squareSize: squareSize,
                    fontSize: fontSize),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: posicion[19],
                    squareSize: squareSize,
                    fontSize: fontSize),
              ],
            ),
          ],
        ));
  }
}

Widget bingo(
    {required Premio premio,
    required double squareSize,
    required double fontSize}) {
  List<String> posicion = premio.posiciones.padRight(25, '0').split('');
  squareSize += 2;
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              numberSquare(
                  numberBall: posicion[0],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[1],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[2],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[3],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[4],
                  squareSize: squareSize,
                  fontSize: fontSize),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              numberSquare(
                  numberBall: posicion[5],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[6],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[7],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[8],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[9],
                  squareSize: squareSize,
                  fontSize: fontSize),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              numberSquare(
                  numberBall: posicion[10],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[11],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[12],
                  squareSize: squareSize,
                  fillColor: Colors.blue[900],
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[13],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[14],
                  squareSize: squareSize,
                  fontSize: fontSize),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              numberSquare(
                  numberBall: posicion[15],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[16],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[17],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[18],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[19],
                  squareSize: squareSize,
                  fontSize: fontSize),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              numberSquare(
                  numberBall: posicion[20],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[21],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[22],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[23],
                  squareSize: squareSize,
                  fontSize: fontSize),
              numberSquare(
                  numberBall: posicion[24],
                  squareSize: squareSize,
                  fontSize: fontSize),
            ],
          ),
        ],
      ));
}

Widget numberSquare(
    {required String numberBall,
    required double squareSize,
    Color? fillColor,
    double fontSize = 15}) {
  Color color = (numberBall == '1') ? Colors.purple : Colors.white;

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 0.2, vertical: 0.8),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40.0)),
        color: (fillColor == null) ? color : fillColor),
    height: squareSize,
    width: squareSize,
    child: Center(
      child: Text(
        '',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fontSize),
      ),
    ),
  );
}
