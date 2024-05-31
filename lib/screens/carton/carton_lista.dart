import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'carton_menu.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/blocs/carton/carton_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';

class CartonListaScreen extends StatelessWidget {
  CartonListaScreen({super.key, cartones});

  final mensaje = SnackBar(
      content: Row(children: [
        const Icon(
          Icons.warning,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.only(left: 6),
          child: const Text(
            'Juego Finalizado',
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

  @override
  Widget build(BuildContext context) {
    const String estado = 'V';
    final Juego juegoPremio = context.read<ItemsBloc>().state.juegoSelected;
    return BlocProvider(
      create: (context) => CartonBloc(),
      child: BlocBuilder<CartonBloc, CartonState>(
        builder: (context, state) {
          if (state is CartonInitial) {
            context
                .read<CartonBloc>()
                .add(GetAllCarton(juegoPremio.idProgramacionJuego, ''));
          }
          return AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title:
                  (estado == 'D') ? 'Cartones  Consulta' : 'Cartones Consulta',
              leading: IconButton(
                  onPressed: () => navigateTo(context, 'juego'),
                  icon: const Icon(Icons.chevron_left)),
              helpScreen: 'Cartones',
            ),
            drawer: const CartonMenu(),
            child: Container(
                padding: const EdgeInsets.only(top: 6),
                child: listCartones(context, state)),
          );
        },
      ),
    );
  }

  Widget listCartones(BuildContext context, CartonState state) {
    if (state is CartonesLoaded) {
      return (state.cartones.isNotEmpty)
          ? list(context, state)
          : Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: const Text('Sin Cartones', style: TextStyle(fontSize: 20)));
    }
    return const LinearProgressIndicator();
  }

  Widget list(context, state) {
    return ListView.builder(
        itemCount: state.cartones.length,
        itemBuilder: (BuildContext context, int index) {
          Carton carton = state.cartones[index];
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(mensaje);
            },
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: itemCarton(context, carton)),
          );
        });
  }

  Widget itemCarton(BuildContext context, Carton carton) {
    bool isVendido = (carton.estado == 'V');
    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primary,
            ],
          )),
      child: ListTile(
        leading: const Icon(
          Icons.grid_on,
          size: 40,
          color: Colors.red,
        ),
        title: Text(
          'Carton: ${carton.numero}',
          style: const TextStyle(fontSize: 22),
        ),
        subtitle: Text((isVendido) ? 'Vendido' : 'No Vendido',
            style: const TextStyle(fontSize: 18)),
        trailing: Icon(
          (isVendido) ? Icons.check_circle : Icons.remove_circle,
          color: (isVendido) ? Colors.green : Colors.red,
          size: 30,
        ),
      ),
    );
  }
}
