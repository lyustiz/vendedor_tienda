import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/carton/carton_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/screens/carton/carton_detalle.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'carton_menu.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/widgets/layout/app_dialog.dart' as Dlg;

class CartonVendidoListScreen extends StatelessWidget {
  const CartonVendidoListScreen({super.key, cartones});

  @override
  Widget build(BuildContext context) {
    final Juego juego = context.read<ItemsBloc>().state.juegoSelected;
    return BlocProvider(
      create: (context) => CartonBloc(),
      child: BlocBuilder<CartonBloc, CartonState>(
        builder: (context, state) {
          if (state is CartonInitial) {
            context
                .read<CartonBloc>()
                .add(GetCartonesVendidos(juego.idProgramacionJuego));
          }
          return AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title: 'Cartones Vendidos',
              leading: IconButton(
                  onPressed: () => navigateTo(context, 'juego'),
                  icon: const Icon(Icons.chevron_left)),
              helpScreen: 'Cartones',
            ),
            drawer: const CartonMenu(),
            child: Container(
                padding: const EdgeInsets.only(top: 6),
                child: listCartones(context, state, juego)),
          );
        },
      ),
    );
  }

  Widget listCartones(BuildContext context, CartonState state, Juego juego) {
    if (state is CartonesLoaded) {
      int vendidos = state.cartones.length;
      String nroJuego = juego.idProgramacionJuego.toString().padLeft(3, '0');
      return (state.cartones.isNotEmpty)
          ? Column(
              children: [
                SizedBox(
                  height: 25,
                  child: Text(
                    'Juego $nroJuego - Total Vendidos: $vendidos',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                Expanded(child: list(context, state)),
              ],
            )
          : Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: const Text('No Exiten Cartones Vendidos',
                  style: TextStyle(fontSize: 20)));
    }
    return const LinearProgressIndicator();
  }

  Widget list(BuildContext context, CartonesLoaded state) {
    return ListView.builder(
        itemCount: state.cartones.length,
        itemBuilder: (BuildContext context, int index) {
          Carton carton = state.cartones[index];
          return Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: itemCarton(context, carton));
        });
  }

  Widget itemCarton(BuildContext context, Carton carton) {
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
        dense: true,
        leading: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.6),
          radius: 24,
          child: Icon(
            Icons.grid_on_rounded,
            size: 35,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
        title: Text(
          'Carton: ${carton.numero.toString().padLeft(3, '0')}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
            shadows: const [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 4.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
        subtitle: Text(carton.nombreCliente!,
            style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.secondaryContainer)),
        trailing: GestureDetector(
            onTap: () =>
                cardPreview(context, carton, context.read<CartonBloc>()),
            child: Icon(Icons.search,
                color: Theme.of(context).colorScheme.secondary, size: 40)),
      ),
    );
  }

  void cardPreview(context, Carton carton, CartonBloc cartonBloc) {
    List<Widget> content = [CartonDetalle(carton: carton)];
    Dlg.appDialog(
        context, 'Carton ${carton.numero.toString().padLeft(3, '0')}', content,
        showCancel: false);
  }
}
