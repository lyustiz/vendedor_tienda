import 'package:flutter/material.dart';
import 'package:vendedor_tienda/entities/carton.dart';

class CartonBingo extends StatelessWidget {
  final Carton carton;
  final String encabezado;

  const CartonBingo(
      {super.key, required this.carton, required this.encabezado});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final double wsize = constraints.maxWidth;
        const int space = 14;
        final double squareSize = (wsize - space) / 6.89;
        final double fontSize = (squareSize + 6) / 2;

        return Column(
          children: [
            bingo(context,
                carton: carton, squareSize: squareSize, fontSize: fontSize)
          ],
        );
      }),
    );
  }

  Widget bingo(BuildContext context,
      {required Carton carton,
      required double squareSize,
      required double fontSize}) {
    Color mainColor = Theme.of(context).colorScheme.secondary;

    var charEnc = encabezado.substring(0, 5).toUpperCase().split('');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numberSquare(
                numberBall: charEnc[0],
                squareSize: squareSize,
                borderColor: mainColor,
                fontColor: Colors.white,
                fillColor: mainColor,
                fontSize: fontSize + 1),
            numberSquare(
                numberBall: charEnc[1],
                squareSize: squareSize,
                borderColor: mainColor,
                fontColor: Colors.white,
                fillColor: mainColor,
                fontSize: fontSize + 1),
            numberSquare(
                numberBall: charEnc[2],
                squareSize: squareSize,
                borderColor: mainColor,
                fontColor: Colors.white,
                fillColor: mainColor,
                fontSize: fontSize + 1),
            numberSquare(
                numberBall: charEnc[3],
                squareSize: squareSize,
                borderColor: mainColor,
                fontColor: Colors.white,
                fillColor: mainColor,
                fontSize: fontSize + 1),
            numberSquare(
                numberBall: charEnc[4],
                squareSize: squareSize,
                borderColor: mainColor,
                fontColor: Colors.white,
                fillColor: mainColor,
                fontSize: fontSize + 1),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: '${carton.p1}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p2}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p3}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p4}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p5}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: '${carton.p6}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p7}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p8}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p9}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p10}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: '${carton.p11}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p12}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: ' ',
                    squareSize: squareSize,
                    borderColor: Colors.red[700]!,
                    fillColor: Colors.red[700]!,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p14}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p15}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: '${carton.p16}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p17}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p18}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p19}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p20}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberSquare(
                    numberBall: '${carton.p21}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p22}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p23}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p24}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
                numberSquare(
                    numberBall: '${carton.p25}',
                    squareSize: squareSize,
                    borderColor: mainColor,
                    fontSize: fontSize),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

Widget numberSquare(
    {required String numberBall,
    required double squareSize,
    Color borderColor = Colors.red,
    double fontSize = 16,
    Color fillColor = Colors.white,
    Color fontColor = Colors.black87}) {
  double borderSize = squareSize > 28 ? 4 : 1.5;

  return Container(
    margin: const EdgeInsets.all(1),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: borderSize),
      borderRadius: const BorderRadius.all(Radius.circular(7.5)),
      color: fillColor,
    ),
    height: squareSize,
    width: squareSize + 0.4,
    child: Center(
      child: Text(
        numberBall,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: fontSize, color: fontColor),
      ),
    ),
  );
}
