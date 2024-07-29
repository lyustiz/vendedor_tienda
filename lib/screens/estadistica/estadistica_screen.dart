import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/estadistica/estadistica_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/entities/estadistica.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/screens/estadistica/widgets/pie_chart.dart';

import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'package:vendedor_tienda/widgets/menus/app_menu.dart';
import 'package:vendedor_tienda/utils/format/format_data.dart' as fd;
import 'package:vendedor_tienda/widgets/layout/app_message.dart' as msg;

// ignore: must_be_immutable
class EstadisticaScreen extends StatelessWidget {
  EstadisticaScreen({super.key});
  late fd.FormatLocale fL;

  @override
  Widget build(BuildContext context) {
    Juego juego = context.read<ItemsBloc>().state.juegoSelected;
    fL = fd.FormatLocale(locale: juego.moneda);
    return BlocProvider(
      create: (context) => EstadisticaBloc(),
      child: AppScaffold(
          color: 'white',
          titleBar: AppTitleBarVariant(
            title: 'Estadisticas',
            leading: IconButton(
                onPressed: () => navigateTo(context, 'juego'),
                icon: const Icon(Icons.chevron_left)),
          ),
          drawer: const AppMenu(itemsMenu: []),
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Text(
                        'Estadisticas Juego ${juego.idProgramacionJuego.toString().padLeft(3, '0')}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                  BlocBuilder<EstadisticaBloc, EstadisticaState>(
                    buildWhen: (previous, current) {
                      if (current is EstadisticaError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            msg.appMessage(context, 'error', current.error));
                        return false;
                      }

                      return true;
                    },
                    builder: (context, state) {
                      if (state is EstadisticaInitial) {
                        context
                            .read<EstadisticaBloc>()
                            .add(GetEstadistica(juego.idProgramacionJuego));
                      }
                      return Container(
                          child: (state is EstadisticaLoaded)
                              ? listEstadisticas(context, state, juego)
                              : const LinearProgressIndicator());
                    },
                  ),
                ],
              ))),
    );
  }

  Widget listEstadisticas(
      context, EstadisticaLoaded estadisticaState, Juego juego) {
    Estadistica est = estadisticaState.estadistica;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                chartContainer(
                  context,
                  title: 'Cartones Vendidos',
                  chart: PieChart(
                    radio: 90,
                    value: est.cartonesVendidos,
                    total: est.totalCartones,
                    colorValue: Colors.green,
                    colorTotal: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: ListTile(
                  title: const Text(
                    'Estado del Cobro',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    est.cobrado ? 'Cobrado' : 'Pendiente',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  trailing: Icon(
                      est.cobrado ? Icons.lock_clock : Icons.access_time,
                      color: est.cobrado ? Colors.red : Colors.green,
                      size: 38),
                )),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: ListTile(
                  title: const Text(
                    'Cartones Vendidos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  trailing: Text('${est.cartonesVendidos}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.secondary)),
                )),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: ListTile(
                  title: const Text(
                    'Ventar Realizadas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  trailing: Text('${est.cantidadVentas}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.secondary)),
                )),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: ListTile(
                  title: const Text(
                    'Total Ventas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    ' ${juego.cartonesPromocion > 1 ? 'Promocion ${juego.cartonesPromocion} x' : 'Valor Carton'} ${fL.currency(juego.valorCarton)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  trailing: Text(fL.currency(est.totalVentas),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.secondary)),
                )),
          ],
        ),
      ),
    );
  }

  Widget chartContainer(context,
      {required String title, required Widget chart}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      padding: const EdgeInsets.only(top: 18, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Column(
        children: [
          chart,
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
