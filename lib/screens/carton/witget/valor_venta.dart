import 'package:flutter/material.dart';
import 'package:vendedor_tienda/utils/format/format_data.dart' as Fd;

class ValorVenta extends StatelessWidget {
  const ValorVenta({
    super.key,
    this.valor = 0,
    this.moneda = 'es_CO',
  });

  final double? valor;
  final String? moneda;

  @override
  Widget build(BuildContext context) {
    final Fd.FormatLocale fL = Fd.FormatLocale(locale: moneda ?? 'es_CO');
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
              const TextSpan(text: 'Total Pagar: '),
              TextSpan(text: fL.currency(valor)),
            ])));
  }
}
