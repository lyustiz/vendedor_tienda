import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/carton/carton_bloc.dart';
import 'package:vendedor_tienda/blocs/filter/filter_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/blocs/notificacion/notificacion_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/models/filtro.dart';
import 'package:vendedor_tienda/models/notification_type.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/screens/carton/witget/carton_container.dart';
import 'package:vendedor_tienda/screens/carton/witget/carton_numero_check.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'witget/carton_input_search.dart';
import 'carton_menu.dart';
import 'package:vendedor_tienda/models/estatus_venta.dart';
import 'package:vendedor_tienda/widgets/layout/app_message.dart' as Msg;
import 'package:vendedor_tienda/widgets/layout/app_dialog.dart' as Dlg;
import 'package:vendedor_tienda/utils/format/format_data.dart' as Ft;

// ignore: must_be_immutable
class CartonListScreen extends StatelessWidget {
  CartonListScreen({super.key, cartones});

  late Juego juego;

  @override
  Widget build(BuildContext context) {
    const String estado = 'D';
    juego = context.read<ItemsBloc>().state.juegoSelected;
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilterBloc>(
          create: (BuildContext context) => FilterBloc(),
        ),
        BlocProvider<CartonBloc>(
          create: (BuildContext context) => CartonBloc(),
        ),
      ],
      child: BlocBuilder<CartonBloc, CartonState>(
        builder: (context, state) {
          if (state is CartonInitial) {
            context
                .read<CartonBloc>()
                .add(GetAllCarton(juego.idProgramacionJuego, 'A'));
          }
          return BlocBuilder<FilterBloc, FilterState>(
            buildWhen: (previous, current) {
              if (previous.count != current.count) {
                String estado =
                    current.filtros.contains(TipoFiltro.vendido) ? 'V' : 'A';
                context
                    .read<CartonBloc>()
                    .add(GetAllCarton(juego.idProgramacionJuego, estado));
              }
              return true;
            },
            builder: (context, filterstate) {
              return AppScaffold(
                color: 'white',
                titleBar: AppTitleBarVariant(
                  title:
                      (estado == 'D') ? 'Cartones Venta' : 'Cartones Vendidos',
                  leading: IconButton(
                      onPressed: () => navigateTo(context, 'juego'),
                      icon: const Icon(Icons.chevron_left)),
                  helpScreen: 'cartones',
                  nroNotifications:
                      context.read<NotificacionBloc>().state.type.count,
                ),
                drawer: const CartonMenu(),
                bottomSheet: CartonInputSearch(juego: juego),
                child: Container(
                    padding: const EdgeInsets.only(top: 6),
                    child: listCartones(context, state,
                        context.read<FilterBloc>(), filterstate)),
              );
            },
          );
        },
      ),
    );
  }

  Widget listCartones(BuildContext context, CartonState state,
      FilterBloc filterBloc, FilterState filterstate) {
    if (state is CartonesLoaded) {
      return (state.cartones.isNotEmpty)
          ? Container(
              margin: const EdgeInsets.only(bottom: 65),
              child: Stack(
                children: [
                  gridCartones(context, state),
                  Positioned(
                    right: 8,
                    child: BlocBuilder<FilterBloc, FilterState>(
                      builder: (context, filterState) {
                        return buttonFilter(
                            filterState, context.read<FilterBloc>());
                      },
                    ),
                  ),
                ],
              ))
          : Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          buttonFilter(filterstate, context.read<FilterBloc>()),
                        ],
                      ),
                      Text(
                        filterstate.count > 0
                            ? 'No hay Cartones Vendidos'
                            : 'No hay Cartones Disponibles',
                        style: const TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )));
    }
    return const LinearProgressIndicator();
  }

  Widget gridCartones(BuildContext context, state) {
    CartonBloc cartonBloc = context.read<CartonBloc>();
    ItemsBloc itemsBloc = context.read<ItemsBloc>();

    return Scrollbar(
      thumbVisibility: true,
      interactive: true,
      trackVisibility: true,
      radius: const Radius.circular(30),
      thickness: 10,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: state.cartones.length,
          itemBuilder: (BuildContext context, int index) {
            Carton carton = state.cartones[index];
            bool isVendido = carton.estado == 'V';
            return GestureDetector(
              onTap: () {
                EstatusVenta estatusVenta =
                    getEstatusVentaCarton(carton, juego);
                estatusAccion(
                    context, estatusVenta, itemsBloc, cartonBloc, carton);
              },
              child: Stack(children: [
                CartonContainer(
                  carton: carton,
                  tipojuego: juego.tipoJuego,
                  encabezado: juego.encabezadoCartones,
                ),
                Positioned(
                  top: 4,
                  left: 7,
                  child:
                      CartonNumeroCheck(carton: carton, isVendido: isVendido),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: cartonAction(context, carton, cartonBloc, itemsBloc))
              ]),
            );
          }),
    );
  }

  Widget cartonAction(
      context, Carton carton, CartonBloc cartonBloc, ItemsBloc itemsBloc) {
    EstatusVenta estatusVenta = getEstatusVentaCarton(carton, juego);

    return FloatingActionButton(
      shape:
          const CircleBorder(side: BorderSide(width: 2, color: Colors.white)),
      tooltip: estatusVenta.name,
      backgroundColor: estatusVenta.color,
      onPressed: () {
        estatusAccion(context, estatusVenta, itemsBloc, cartonBloc, carton);
      },
      heroTag: carton.idCarton,
      mini: true,
      child: Icon(estatusVenta.icon, size: 28),
    );
  }

  FloatingActionButton buttonFilter(
      FilterState filterState, FilterBloc filterBloc) {
    return FloatingActionButton(
        onPressed: () {
          if (filterState.count > 0) {
            filterBloc.add(const RemoveFiltro(filtro: TipoFiltro.vendido));
          } else {
            filterBloc.add(const AddFiltro(filtro: TipoFiltro.vendido));
          }
        },
        heroTag: 0,
        mini: true,
        shape:
            const CircleBorder(side: BorderSide(width: 2, color: Colors.white)),
        elevation: 10,
        backgroundColor: filterState.count > 0 ? Colors.green : Colors.orange,
        child:
            Icon(filterState.count > 0 ? Icons.lens : Icons.monetization_on));
  }

  void estatusAccion(BuildContext context, EstatusVenta estatusVenta,
      ItemsBloc itemsBloc, CartonBloc cartonBloc, Carton carton) {
    switch (estatusVenta.status) {
      case Estatus.venta:
        cartonSelected(context, itemsBloc, carton);
        break;
      case Estatus.ventaSelected:
        cartonSelected(context, itemsBloc, carton);
        break;
      case Estatus.entregado:
        ScaffoldMessenger.of(context).showSnackBar(Msg.appMessage(
            context, 'warning', 'Ya se hizo cierre de ventas del Juego'));
        break;
      case Estatus.devolucion:
        confirm(context, cartonBloc, carton);
        break;
      case Estatus.vendido:
        ScaffoldMessenger.of(context)
            .showSnackBar(Msg.appMessage(context, 'warning', 'Carton Vendido'));
        break;
      case Estatus.cerrado:
        ScaffoldMessenger.of(context)
            .showSnackBar(Msg.appMessage(context, 'warning', 'Juego Cerrado'));
        break;
      case Estatus.cerradoHora:
        ScaffoldMessenger.of(context).showSnackBar(Msg.appMessage(
            context, 'warning', 'Ventas Cerrada (Hora Cumplida)'));
        break;
    }
  }

  void cartonSelected(
      BuildContext context, ItemsBloc itemsBloc, Carton carton) {
    itemsBloc.add(SelectItem(tipoItem: 'carton', item: carton));
    navigateTo(context, 'carton', carton);
  }

  void confirm(context, CartonBloc cartonBloc, Carton carton) async {
    List<Widget> content = [
      ListTile(
        title: const Text('Carton'),
        trailing: Text(
          carton.numero.toString().padLeft(3, '0'),
          style: const TextStyle(fontSize: 20),
        ),
      ),
      ListTile(
          title: const Text('Fecha'),
          subtitle: Text(Ft.formatDateTime(DateTime.now()))),
    ];

    bool? isConfirm = await Dlg.appDialog(
        context, 'Relizar Devolucion', content,
        action: 'Confirmar');

    if (isConfirm ?? false) {
      onReturn(context, carton, cartonBloc);
    }
  }

  void onReturn(BuildContext context, Carton carton, CartonBloc cartonBloc) {
    Carton updCarton = carton.copyWith(
      idCliente: 0,
      estado: 'A',
      actualizado: DateTime.now(),
    );

    cartonBloc.add(UpdateCarton(updCarton, 'V'));
    context
        .read<NotificacionBloc>()
        .add(const SetNotification(ntype: NTypes.cartones));
    ScaffoldMessenger.of(context).showSnackBar(
      Msg.appMessage(context, 'success',
          'Carton ${carton.numero.toString().padLeft(3, '0')} Devuelto'),
    );
  }

  EstatusVenta getEstatusVentaCarton(Carton carton, Juego juego) {
    if (juego.estado == 'C') {
      return EstatusVenta.getEstatusVenta(Estatus.cerrado);
    }
    if (juego.cobrado != 'N') {
      return EstatusVenta.getEstatusVenta(Estatus.entregado);
    }
    if (DateTime.now().isAfter(juego.horaCierre)) {
      return EstatusVenta.getEstatusVenta(Estatus.cerradoHora);
    }
    if (carton.estado == 'A') {
      return EstatusVenta.getEstatusVenta(Estatus.venta);
    } else {
      if (juego.permitirDevolucion == 'S') {
        return EstatusVenta.getEstatusVenta(Estatus.devolucion);
      } else {
        return EstatusVenta.getEstatusVenta(Estatus.vendido);
      }
    }
  }
}
