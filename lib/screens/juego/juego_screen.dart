import 'package:flutter/material.dart';
import 'package:vendedor_tienda/blocs/juego/juego_bloc.dart';
import 'package:vendedor_tienda/blocs/notificacion/notificacion_bloc.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/entities/premio.dart';
import 'package:vendedor_tienda/screens/juego/witgets/premio_figura.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/screens/juego/juego_menu.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/blocs/cobro/cobro_bloc.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'package:vendedor_tienda/utils/format/format_data.dart' as fd;
import 'package:vendedor_tienda/widgets/layout/app_message.dart' as msg;
import 'package:vendedor_tienda/widgets/layout/app_dialog.dart' as dlg;
import 'package:vendedor_tienda/widgets/layout/app_full_loading.dart' as fl;

// ignore: must_be_immutable
class JuegoScreen extends StatelessWidget {
  JuegoScreen({super.key});
  final mensaje = SnackBar(
      duration: const Duration(milliseconds: 700),
      content: Row(children: [
        const Icon(
          Icons.warning,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.only(left: 6),
          child: const Text(
            'Juego Terminado',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]),
      backgroundColor: Colors.amber,
      action: SnackBarAction(
        label: 'Aceptar',
        onPressed: () {
          // Some code to undo the change.
        },
      ));

  late Juego juego;
  late fd.FormatLocale fL;

  @override
  Widget build(BuildContext context) {
    juego = context.read<ItemsBloc>().state.juegoSelected;
    fL = fd.FormatLocale(locale: juego.moneda);
    final bool isHoraCierre = DateTime.now().isAfter(juego.horaCierre);

    return AppScaffold(
      color: 'white',
      titleBar: AppTitleBarVariant(
        title: 'Juego ${juego.idProgramacionJuego.toString().padLeft(3, '0')}',
        leading: IconButton(
            onPressed: () => navigateTo(context, 'juego_list'),
            icon: const Icon(Icons.chevron_left)),
        helpScreen: 'juego',
        nroNotifications: context.read<NotificacionBloc>().state.type.count,
      ),
      drawer: const JuegoMenu(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (juego.estado == 'C') {
                        navigateTo(context, 'carton_lista', 'D');
                      } else {
                        navigateTo(context, 'carton_multiple_list', 'D');
                      }
                      context
                          .read<ItemsBloc>()
                          .add(const SelectItem(tipoItem: 'vendido', item: ''));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.93,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(13)),
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Venta de Cartones',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          const SizedBox(
                            height: 1,
                          ),
                          iconButtonJuego(context, Icons.table_view_rounded),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                              '${juego.cartonesPromocion > 1 ? 'Pomocion ${juego.cartonesPromocion} x' : 'Valor Carton'} ${fL.currency(juego.valorCarton)}',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              padding: const EdgeInsets.only(
                  top: 5, left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primaryContainer,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FloatingActionButton(
                          mini: true,
                          heroTag: 'est',
                          tooltip: 'Estadisticas',
                          elevation: 1,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          onPressed: () => pushScreen(context, 'estadistica'),
                          child: const Icon(
                            Icons.bar_chart_rounded,
                            size: 26,
                          )),
                      FloatingActionButton(
                          mini: true,
                          heroTag: 'sol',
                          tooltip: 'Solicitudes',
                          elevation: 1,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          onPressed: () => pushScreen(context, 'solicitud'),
                          child: const Icon(
                            Icons.post_add,
                            size: 26,
                          )),
                      FloatingActionButton(
                          mini: true,
                          heroTag: 'ven',
                          tooltip: 'Ventas',
                          elevation: 1,
                          backgroundColor: Colors.green,
                          onPressed: () => pushScreen(context, 'ventas_list'),
                          child: const Icon(
                            Icons.paid,
                            size: 26,
                          )),
                      const Expanded(child: Text('')),
                      BlocConsumer<CobroBloc, CobroState>(
                        listener: (context, stateCobro) {},
                        buildWhen: (previous, current) {
                          if (current is CobroError) {
                            context.read<CobroBloc>().add(ResetCobro(true));
                            ScaffoldMessenger.of(context).showSnackBar(msg
                                .appMessage(context, 'error', current.error));
                            return false;
                          }

                          return true;
                        },
                        builder: (context, stateCobro) {
                          // cobro confirmado
                          if (stateCobro is CobroExito) {
                            context.read<CobroBloc>().add(ResetCobro(true));
                            Juego juegoUpd = juego.copyWith(
                                actualizado: DateTime.now(), cobrado: 'P');
                            final itemJuego = juegoUpd;
                            context.read<ItemsBloc>().add(
                                SelectItem(tipoItem: 'juego', item: itemJuego));
                            context
                                .read<JuegoBloc>()
                                .add(GetAllJuego(juego.estado));
                          }
                          return BlocBuilder<ItemsBloc, ItemsState>(
                            builder: (context, stateItem) {
                              bool esCobrado =
                                  stateItem.juegoSelected.cobrado != 'N';
                              return FloatingActionButton(
                                  mini: true,
                                  heroTag: '3',
                                  tooltip: esCobrado
                                      ? 'Juego Cerrado'
                                      : 'Cerrar Juego',
                                  elevation: 1,
                                  backgroundColor: esCobrado
                                      ? Colors.red
                                      : Colors.amber[600],
                                  onPressed: null,
                                  /* entregaCartones(
                                      context, esCobrado, juego),*/
                                  child: Icon(
                                    esCobrado ? Icons.lock : Icons.lock_open,
                                    size: 26,
                                  ));
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      'Venta activa hasta',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    subtitle: Text(
                      fL.formatDateTime(juego.horaCierre),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer),
                    ),
                    trailing: Badge(
                      label: Text(isHoraCierre ? 'cerrada' : 'abierta'),
                      backgroundColor: isHoraCierre ? Colors.red : Colors.green,
                      child: Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18)),
                            border: Border.all(color: Colors.white, width: 3),
                            color: Colors.white),
                        child: Icon(
                          isHoraCierre ? Icons.lock_clock : Icons.access_time,
                          color: isHoraCierre ? Colors.red : Colors.green,
                          size: 38,
                        ),
                      ),
                    ),
                    dense: true,
                    selected: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      infoTotales(context, juego.premios),
                      infoDevolucion(context, juego)
                    ],
                  ),
                  Container(
                    height: 20,
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Lista de Premios:',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  premiosList(context, juego.premios),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget premiosList(context, List<Premio> juegosPremios) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.15),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .40,
        child: Scrollbar(
          interactive: true,
          child: ListView.builder(
            itemCount: juegosPremios.length,
            itemBuilder: (context, index) {
              Premio premio = juegosPremios[index];
              return itemsPremio(context, premio);
            },
          ),
        ));
  }

  Widget itemsPremio(context, Premio premio) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ListTile(
            dense: true,
            leading: const SizedBox(
              width: 50,
            ),
            title: Text(premio.nombre,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(
              fL.currency(premio.valorPremio),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary, fontSize: 16),
            ),
          ),
          Positioned(
            left: -6,
            top: -7,
            child: Container(
              width: 77,
              height: 79,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.secondaryContainer
                  ],
                ),
              ),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child:
                      PremioFigura(premio: premio, tipoJuego: juego.tipoJuego)),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoTotales(context, List<Premio> juegosPremios) {
    double total = 0;
    for (var juegoPremio in juegosPremios) {
      total = total + (juegoPremio.valorPremio);
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 72,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer
          ],
        ),
      ),
      child: Column(
        children: [
          const Text('TOTAL PREMIOS'),
          const SizedBox(
            height: 3,
          ),
          Text(
            fL.currency(total),
            style: const TextStyle(fontSize: 26),
          ),
        ],
      ),
    );
  }

  Widget iconButtonJuego(context, IconData icon) {
    return Container(
      width: 77,
      height: 79,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 45,
        ),
      ),
    );
  }

  Widget infoDevolucion(BuildContext context, Juego juego) {
    final bool isAllowed = juego.permitirDevolucion == 'S';
    return Container(
      height: 70,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer
          ],
        ),
      ),
      child: Column(
        children: [
          const Text('Devolver'),
          Icon(
            isAllowed ? Icons.check_circle : Icons.remove_circle_outline,
            color: isAllowed ? Colors.lightGreen : Colors.red,
            size: 36,
          ),
        ],
      ),
    );
  }

  void entregaCartones(
      BuildContext context, bool isCobrado, Juego juego) async {
    if (isCobrado) {
      infoEntrega(context, juego);
    } else {
      confirmEntrega(context, juego);
    }
  }

  void confirmEntrega(BuildContext context, Juego juego) async {
    List<Widget> content = [
      ListTile(
        title: const Text('Juego'),
        trailing: Text(juego.idProgramacionJuego.toString().padLeft(3, '0')),
      ),
      const Text(
        'Desea hacer entrega de los cartones?',
        textAlign: TextAlign.justify,
      ),
      const SizedBox(height: 20),
      const Text(
        'Esta operacion bloquea las venta y no se puede revertir, por lo que no podra seguir haciendo operaciones con los cartones o modulos',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 14, color: Colors.amber),
      ),
    ];

    bool? isConfirm = await dlg.appDialog(
        context, 'Confirmar Entrega Cartones', content,
        action: 'Confirmar');

    if (isConfirm ?? false) {
      // ignore: use_build_context_synchronously
      realizarEntrega(context, juego);
    }
  }

  void infoEntrega(BuildContext context, Juego juego) async {
    List<Widget> content = [
      ListTile(
        title: const Text('Juego'),
        trailing: Text(juego.idProgramacionJuego.toString().padLeft(3, '0')),
      ),
      const Text(
        'Ya se hizo el cierre de ventas para este juego!!!',
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.yellow),
      ),
      const SizedBox(height: 20),
      const Text(
        'Esta operacion bloquea las venta y no se puede revertir, por lo que no podra seguir haciendo operaciones con los cartones o modulos',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 14, color: Colors.amber),
      ),
    ];

    dlg.appDialog(context, 'Cartones Entregados', content);
  }

  void realizarEntrega(BuildContext context, Juego juego) {
    context.read<CobroBloc>().add(InsertCobro(juego.idProgramacionJuego));
    fl.appFullLoading(context);
  }
}
