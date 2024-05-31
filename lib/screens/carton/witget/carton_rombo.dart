import 'package:flutter/material.dart';
import 'package:vendedor_tienda/entities/carton.dart';

class CartonRombo extends StatelessWidget {
  final Carton carton;

  const CartonRombo({super.key, required this.carton});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final double wsize = constraints.maxWidth;
        const int space = 14;
        final double squareSize = (wsize - space) / 7;
        final double fontSize = (squareSize + 4) / 2;

        return Column(
          children: [
            rombo(carton: carton, squareSize: squareSize, fontSize: fontSize)
          ],
        );
      }),
    );
  }

  Widget rombo(
      {required Carton carton,
      required double squareSize,
      required double fontSize}) {
    return Container(
        child: Row(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              numberSquare(
                  numberBall: '${carton.p1}',
                  squareSize: squareSize,
                  borderColor: Colors.blue[300] ?? Colors.lightBlue,
                  fontSize: fontSize),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numberSquare(
                numberBall: '${carton.p2}',
                squareSize: squareSize,
                borderColor: Colors.blue[300] ?? Colors.lightBlue,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p3}',
                squareSize: squareSize,
                borderColor: Colors.blue[300] ?? Colors.lightBlue,
                fontSize: fontSize),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numberSquare(
                numberBall: '${carton.p4}',
                squareSize: squareSize,
                borderColor: Colors.blue[300] ?? Colors.lightBlue,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p5}',
                squareSize: squareSize,
                borderColor: Colors.blue[300] ?? Colors.lightBlue,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p6}',
                squareSize: squareSize,
                borderColor: Colors.blue[300] ?? Colors.lightBlue,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p7}',
                squareSize: squareSize,
                borderColor: Colors.blue[300] ?? Colors.lightBlue,
                fontSize: fontSize),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numberSquare(
                numberBall: '${carton.p8}',
                squareSize: squareSize,
                borderColor: Colors.red[600] ?? Colors.red,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p9}',
                squareSize: squareSize,
                borderColor: Colors.red[600] ?? Colors.red,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p10}',
                squareSize: squareSize,
                borderColor: Colors.red[600] ?? Colors.red,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p11}',
                squareSize: squareSize,
                borderColor: Colors.red[600] ?? Colors.red,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p12}',
                squareSize: squareSize,
                borderColor: Colors.red[600] ?? Colors.red,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p13}',
                squareSize: squareSize,
                borderColor: Colors.red[600] ?? Colors.red,
                fontSize: fontSize),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numberSquare(
                numberBall: '${carton.p14}',
                squareSize: squareSize,
                borderColor: Colors.green[900] ?? Colors.green,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p15}',
                squareSize: squareSize,
                borderColor: Colors.green[900] ?? Colors.green,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p16}',
                squareSize: squareSize,
                borderColor: Colors.green[900] ?? Colors.green,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p17}',
                squareSize: squareSize,
                borderColor: Colors.green[900] ?? Colors.green,
                fontSize: fontSize),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numberSquare(
                numberBall: '${carton.p18}',
                squareSize: squareSize,
                borderColor: Colors.green[900] ?? Colors.green,
                fontSize: fontSize),
            numberSquare(
                numberBall: '${carton.p19}',
                squareSize: squareSize,
                borderColor: Colors.green[900] ?? Colors.green,
                fontSize: fontSize),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numberSquare(
                numberBall: '${carton.p20}',
                squareSize: squareSize,
                borderColor: Colors.green[900] ?? Colors.green,
                fontSize: fontSize),
          ],
        ),
      ],
    ));
  }
}

Widget numberSquare(
    {required String numberBall,
    required double squareSize,
    Color borderColor = Colors.red,
    double fontSize = 15}) {
  double borderSize = squareSize > 28 ? 4 : 1;

  return Container(
    margin: const EdgeInsets.all(1),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: borderSize),
      borderRadius: const BorderRadius.all(Radius.circular(40.0)),
      color: Colors.white,
    ),
    height: squareSize,
    width: squareSize,
    child: Center(
      child: Text(
        numberBall,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: Colors.black87),
      ),
    ),
  );
}
