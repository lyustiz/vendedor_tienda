import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  const PieChart(
      {super.key,
      required this.radio,
      required this.value,
      required this.total,
      this.colorValue = Colors.green,
      this.colorTotal = Colors.red});

  final double radio;
  final int value;
  final int total;
  final Color colorValue;
  final Color colorTotal;

  @override
  Widget build(BuildContext context) {
    final double percent = (total == 0) ? 0 : (value / total);
    return SizedBox(
      height: radio,
      width: radio,
      child: Stack(alignment: Alignment.center, children: [
        SizedBox(
          height: radio,
          width: radio,
          child: CircularProgressIndicator(
            value: percent,
            strokeWidth: 20,
            valueColor: AlwaysStoppedAnimation<Color>(colorValue),
            semanticsLabel: 'Cartones Vendidos',
            backgroundColor: colorTotal,
          ),
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: '${value.toInt()}',
                  style: TextStyle(color: colorValue)),
              TextSpan(
                  text: '/', style: TextStyle(fontSize: 18, color: colorTotal)),
              TextSpan(
                  text: '${total.toInt()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: colorTotal)),
            ],
          ),
        )
      ]),
    );
  }
}
