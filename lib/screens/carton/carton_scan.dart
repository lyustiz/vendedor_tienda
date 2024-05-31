import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/carton/carton_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/screens/carton/carton_menu.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';

class CartonScan extends StatefulWidget {
  const CartonScan({super.key});

  @override
  State<CartonScan> createState() => _CartonScanState();
}

class _CartonScanState extends State<CartonScan> {
  late Carton carton;
  late Juego juego;

  @override
  Widget build(BuildContext context) {
    carton = context.read<ItemsBloc>().state.cartonSelected;
    juego = context.read<ItemsBloc>().state.juegoSelected;
    return BlocProvider(
      create: (context) => CartonBloc(),
      child: BlocBuilder<CartonBloc, CartonState>(
        builder: (context, state) {
          return AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title: 'Scanear Carton',
              leading: IconButton(
                  onPressed: () => navigateTo(context, 'carton_list'),
                  icon: const Icon(Icons.chevron_left)),
              helpScreen: 'Scanear Carton',
            ),
            drawer: const CartonMenu(),
            child: Container(
              alignment: Alignment.center,
              child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(14),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 150,
                            child: Container(
                                color: Colors.grey[700],
                                child: const Icon(
                                  Icons.qr_code,
                                  color: Colors.blue,
                                  size: 110,
                                ))),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          color: Colors.amber,
                          margin: const EdgeInsets.all(12),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 150,
                              child: const Center(child: Text('Carton'))),
                        ),
                        const ElevatedButton(
                            onPressed: null, child: Text('Seleccionar Carton'))
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
