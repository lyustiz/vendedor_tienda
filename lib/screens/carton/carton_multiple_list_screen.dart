import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/bloqueocartones/bloqueocartones_bloc.dart';
import 'package:vendedor_tienda/blocs/carton/carton_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/blocs/notificacion/notificacion_bloc.dart';
import 'package:vendedor_tienda/blocs/promocion/promocion_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/models/promocion.dart';
import 'package:vendedor_tienda/screens/carton/witget/cartones_arguments.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/screens/carton/witget/carton_numero_check.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'carton_menu.dart';
import 'package:vendedor_tienda/widgets/layout/app_message.dart' as Msg;

import 'witget/carton_container.dart';

// ignore: must_be_immutable
class CartonMultipleListScreen extends StatelessWidget {
  CartonMultipleListScreen({super.key, cartones});

  late Juego juego;
  late int idUsuario;
  BuildContext? dcontext;

  @override
  Widget build(BuildContext context) {
    const String estado = 'D';
    juego = context.read<ItemsBloc>().state.juegoSelected;

    return AppScaffold(
        color: 'white',
        titleBar: AppTitleBarVariant(
          title: (estado == 'D') ? 'Cartones Venta' : 'Cartones Vendidos',
          leading: IconButton(
              onPressed: () => navigateTo(context, 'juego'),
              icon: const Icon(Icons.chevron_left)),
          helpScreen: 'cartones',
          nroNotifications: context.read<NotificacionBloc>().state.type.count,
        ),
        drawer: const CartonMenu(),
        child: dataBuilder(context));
  }

  Widget dataBuilder(context) {
    return BlocProvider(
        create: (context) => CartonBloc(),
        child: BlocBuilder<CartonBloc, CartonState>(
            buildWhen: (previous, current) {
          if (current is CartonExito) {
            ScaffoldMessenger.of(context).showSnackBar(
                Msg.appMessage(context, 'success', current.mensaje));
            return false;
          }
          if (current is CartonError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(Msg.appMessage(context, 'error', current.error));
            return false;
          }
          return true;
        }, builder: (context, state) {
          if (state is CartonInitial) {
            context
                .read<CartonBloc>()
                .add(GetAllCarton(juego.idProgramacionJuego, ''));
          }

          if (state is CartonesLoaded) {
            List<Carton> cartones = state.cartones;

            return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => PromocionBloc(),
                  ),
                  BlocProvider(
                    create: (context) => BloqueoCartonesBloc(),
                  ),
                ],
                child: BlocBuilder<PromocionBloc, PromocionState>(
                    builder: (context, stateP) {
                  if (stateP is PromocionInitial) {
                    context
                        .read<PromocionBloc>()
                        .add(GetPromociones(cartones, 1));
                  }
                  if (stateP is PromocionesLoaded) {
                    return BlocBuilder<BloqueoCartonesBloc,
                        BloqueoCartonesState>(buildWhen: (previous, current) {
                      if (current is BloqueoCartonesError) {
                        if (dcontext != null) {
                          Navigator.pop(dcontext!);
                        }
                        showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              dcontext = context;
                              return mensajeError(context, current.error);
                            });

                        return false;
                      }
                      if (current is BloqueoCartonesLoading) {
                        showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              dcontext = context;
                              return mensajeValidando(context);
                            });
                      }
                      if (current is BloqueoCartonesExito) {
                        navigateTo(context, 'carton_multiple',
                            CartonesArguments(current.cartonesBloqueados));
                        return false;
                      }
                      return true;
                    }, builder: (context, stateb) {
                      return grupoCartones(context, stateP);
                    });
                  }
                  return const LinearProgressIndicator();
                }));
          }
          return const LinearProgressIndicator();
        }));
  }

  Widget grupoCartones(BuildContext context, PromocionesLoaded state) {
    PromocionBloc promocionBloc = context.read<PromocionBloc>();
    List<Promocion> promociones = state.promociones;

    if (promociones.isEmpty) {
      return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          color: Theme.of(context).colorScheme.secondary,
          child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No hay Cartones Disponibles para la Venta para el juego ${juego.idProgramacionJuego}',
                    style: const TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              )));
    }

    List<ExpansionPanel> grupos = promociones
        .map((promocion) => ExpansionPanel(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            canTapOnHeader: true,
            headerBuilder: (context, isOpen) {
              return headerGrupoCartones(
                  context, promociones, promocion, isOpen);
            },
            isExpanded: promocion.isExpanded,
            body: contendGridCartones(context, promocion)))
        .toList();

    return Stack(
      children: [
        ListView(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: ExpansionPanelList(
              children: grupos,
              elevation: 0,
              materialGapSize: 8,
              expandedHeaderPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              expansionCallback: (int index, bool isExpanded) {
                Promocion promocion =
                    promociones[index].copyWith(isExpanded: isExpanded);
                promocionBloc
                    .add(UpdatePromocionesIndex(promociones, promocion, index));
              },
            ),
          ),
        ]),
        Positioned(
          bottom: 15,
          right: 6,
          child: FloatingActionButton(
            onPressed: () => {seleccionarCartones(context, promociones, juego)},
            backgroundColor: Colors.green,
            tooltip: 'Seleccionar',
            elevation: 15,
            child: const Icon(Icons.monetization_on_rounded, size: 40),
          ),
        )
      ],
    );
  }

  Widget headerGrupoCartones(BuildContext context, List<Promocion> promociones,
      Promocion promocion, bool isOpen) {
    PromocionBloc promocionBloc = context.read<PromocionBloc>();
    List<Widget> contend = promocion.cartones
        .map((carton) => Text(
              '${carton.numero}'.padLeft(4, '0'),
              style: TextStyle(
                  color: isOpen ? Colors.amberAccent : Colors.white,
                  fontWeight: FontWeight.bold),
            ))
        .toList();

    var chk = Checkbox(
      value: promocion.isSelected,
      onChanged: (bool? isSelected) {
        Promocion updPromocion = promocion.copyWith(isSelected: isSelected!);
        promocionBloc.add(UpdatePromocionesItem(promociones, updPromocion));
      },
    );

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [chk],
          ),
          ...contend
        ],
      ),
    );
  }

  Widget contendGridCartones(context, Promocion promocion) {
    return SizedBox(
      width: double.maxFinite,
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: promocion.cartones
                .map(
                  (carton) => Container(
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.only(left: 2, bottom: 2),
                    child: Stack(
                      children: [
                        CartonContainer(
                          carton: carton,
                          tipojuego: juego.tipoJuego,
                          encabezado: juego.encabezadoCartones,
                        ),
                        Positioned(
                          top: 2,
                          left: 7,
                          child: CartonNumeroCheck(
                              carton: carton, isVendido: promocion.isSelected),
                        ),
                      ],
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }

  void seleccionarCartones(
      BuildContext context, List<Promocion> promociones, Juego juego) {
    if (juego.isCerrado()) {
      ScaffoldMessenger.of(context).showSnackBar(
          Msg.appMessage(context, 'warning', 'El Juego esta Cerrado'));
      return;
    }
    if (juego.isCobrado()) {
      ScaffoldMessenger.of(context).showSnackBar(Msg.appMessage(
          context, 'warning', 'Ya se ejecuto el cobro del Vendedor'));
      return;
    }

    var seleccionadas = promociones.where((p) => p.isSelected).toList();
    var bstate = context.read<BloqueoCartonesBloc>().state;

    List<Carton> cartones = [];
    for (Promocion item in seleccionadas) {
      cartones.addAll(item.cartones);
    }

    if (cartones.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(Msg.appMessage(
          context, 'warning', 'NO se han seleccionado cartones'));
      return;
    }

    if (bstate is BloqueoCartonesLoading) return;

    context.read<BloqueoCartonesBloc>().add(BloquearCartones(
        juego.idProgramacionJuego, cartones.first.idVendedor, cartones));
  }

  Widget mensajeValidando(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: const Text('Validando Cartones', textAlign: TextAlign.center),
      content: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()]),
    );
  }

  Widget mensajeError(BuildContext context, String error) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: const Text('Atencion', textAlign: TextAlign.center),
      content:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Icon(Icons.warning, color: Colors.amberAccent),
        Text(error, style: const TextStyle(color: Colors.amberAccent))
      ]),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Aceptar'))
      ],
    );
  }
}
