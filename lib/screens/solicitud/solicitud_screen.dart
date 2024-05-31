import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/solicitud/solicitud_bloc.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/entities/solicitud.dart';
import 'package:vendedor_tienda/screens/solicitud/solicitud_form.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'package:vendedor_tienda/widgets/layout/app_message.dart' as Msg;
import 'package:vendedor_tienda/widgets/menus/app_menu.dart';

class SolicitudScreen extends StatelessWidget {
  const SolicitudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Juego juego = context.read<ItemsBloc>().state.juegoSelected;
    return BlocProvider(
      create: (context) => SolicitudBloc(),
      child: BlocBuilder<SolicitudBloc, SolicitudState>(
        builder: (context, state) {
          if (state is SolicitudInitial) {
            context
                .read<SolicitudBloc>()
                .add(GetAllSolicitud(juego.idProgramacionJuego, ''));
          }
          return AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title:
                  'Solicitudes Juego ${juego.idProgramacionJuego.toString().padLeft(3, '0')}',
              leading: IconButton(
                  onPressed: () => navigateTo(context, 'juego'),
                  icon: const Icon(Icons.chevron_left)),
            ),
            drawer: const AppMenu(itemsMenu: []),
            floatingActionButton: const FloatingActionButton(
              backgroundColor: Colors.grey,
              onPressed:
                  null /*() =>
                  addSolicitud(context, context.read<SolicitudBloc>(), juego),*/
              ,
              child: Icon(Icons.add),
            ),
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                padding: const EdgeInsets.all(12),
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
                child: listSolicitudes(
                    context, context.read<SolicitudBloc>(), juego)),
          );
        },
      ),
    );
  }

  Widget listSolicitudes(context, SolicitudBloc solicitudBloc, Juego juego) {
    SolicitudState solState = solicitudBloc.state;

    if (solState is SolicitudesLoaded) {
      if (solState.solicitudes.isNotEmpty) {
        return ListView.builder(
            itemCount: solState.solicitudes.length,
            itemBuilder: (context, index) {
              Solicitud solicitud = solState.solicitudes[index];
              return solicitudItem(context, solicitud);
            });
      } else {
        return const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Text(
              'No existen solicitudes para este juego',
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ));
      }
    }

    return const LinearProgressIndicator();
  }

  Widget solicitudItem(context, Solicitud solicitud) {
    final bool isPendiente = (solicitud.estado == 'P');
    final Map<String, dynamic> tipo = {
      'M': {
        'nombre': 'Modulos',
        'icono': Icons.view_module_rounded,
        'color': Theme.of(context).colorScheme.secondary
      },
      'C': {
        'nombre': 'Cartones',
        'icono': Icons.table_view_rounded,
        'color': Theme.of(context).colorScheme.secondaryContainer
      }
    };
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: ListTile(
        selected: true,
        leading: Icon(
          tipo[solicitud.tipoSolicitud]['icono'],
          color: tipo[solicitud.tipoSolicitud]['color'],
          size: 42,
        ),
        title: Text(
            'Solicitud ${solicitud.idSolicitudVendedor.toString().padLeft(4, '0')}'),
        subtitle: Text(
          '${solicitud.cantidad} ${tipo[solicitud.tipoSolicitud]['nombre']}',
          style: TextStyle(
              color: tipo[solicitud.tipoSolicitud]['color'], fontSize: 18),
        ),
        trailing: Icon(
          isPendiente ? Icons.schedule : Icons.check_circle,
          color: isPendiente ? Colors.orange : Colors.green,
          size: 34,
        ),
      ),
    );
  }

  void addSolicitud(
      BuildContext context, SolicitudBloc solicitudBloc, Juego juego) async {
    SolicitudState solState = solicitudBloc.state;

    bool isPending = false;

    if (solState is SolicitudesLoaded) {
      isPending = solState.solicitudes
          .where((solicitud) => solicitud.estado == 'P')
          .isNotEmpty;
    }

    if (isPending) {
      ScaffoldMessenger.of(context).showSnackBar(
          Msg.appMessage(context, 'warning', 'Existen Solicitudes Pendientes'));
    } else {
      bool isCreated =
          await pushScreenData(context, const SolicitudForm()) ?? false;
      if (isCreated) {
        ScaffoldMessenger.of(context).showSnackBar(
            Msg.appMessage(context, 'success', 'Solicitud Creada'));
      }
      solicitudBloc.add(GetAllSolicitud(juego.idProgramacionJuego, ''));
    }
  }
}
