import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/carton/carton_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/blocs/notificacion/notificacion_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/entities/cliente.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/screens/carton/witget/add_cliente_button.dart';
import 'package:vendedor_tienda/screens/carton/witget/cliente_button.dart';
import 'package:vendedor_tienda/screens/carton/witget/valor_venta.dart';
import 'package:vendedor_tienda/screens/carton/witget/vender_button.dart';
import 'package:vendedor_tienda/screens/juego/juego_screen.dart';
import 'package:vendedor_tienda/screens/carton/carton_menu.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'package:vendedor_tienda/widgets/layout/app_message.dart' as Msg;
import 'package:vendedor_tienda/widgets/layout/app_dialog.dart' as Dlg;
import 'witget/carton_rombo.dart';
import 'package:vendedor_tienda/utils/format/format_data.dart' as Fd;

class CartonScreen extends StatefulWidget {
  const CartonScreen({super.key});

  @override
  State<CartonScreen> createState() => _CartonScreenState();
}

class _CartonScreenState extends State<CartonScreen> {
  Cliente? cliente;
  late Carton carton;
  late Juego juego;
  late Fd.FormatLocale fL;

  @override
  Widget build(BuildContext context) {
    carton = context.read<ItemsBloc>().state.cartonSelected;
    juego = context.read<ItemsBloc>().state.juegoSelected;
    fL = Fd.FormatLocale(locale: juego.moneda);
    return BlocProvider(
      create: (context) => CartonBloc(),
      child: BlocBuilder<CartonBloc, CartonState>(
        builder: (context, stateCarton) {
          return AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title: 'Carton',
              leading: IconButton(
                  onPressed: () => navigateTo(context, 'carton_list'),
                  icon: const Icon(Icons.chevron_left)),
              helpScreen: 'carton',
              nroNotifications:
                  context.read<NotificacionBloc>().state.type.count,
            ),
            drawer: const CartonMenu(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(14),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Theme.of(context).colorScheme.primaryContainer,
                              Theme.of(context).colorScheme.primary,
                            ],
                          )),
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/fondo_carton.png'),
                              alignment: Alignment.center,
                              fit: BoxFit.cover),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 3),
                              width: MediaQuery.of(context).size.width * 0.95,
                              alignment: Alignment.center,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/marco_carton.png'),
                                      alignment: Alignment.center,
                                      fit: BoxFit.fill),
                                ),
                                child: CartonRombo(
                                  carton: carton,
                                ),
                              ),
                            ),
                            Positioned(
                              top: -11,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.white),
                                  child: Text(
                                    carton.numero.toString().padLeft(4, '0'),
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (cliente == null)
                    GestureDetector(
                      onTap: () => selectCliente(context),
                      child: const AddClienteButton(),
                    ),
                  if (cliente != null)
                    GestureDetector(
                      onTap: () => selectCliente(context),
                      child: ClienteButton(
                          cliente: cliente,
                          replace: stateCarton is! CartonExito),
                    ),
                  const SizedBox(
                    height: 5,
                  ),
                  ValorVenta(valor: juego.valorCarton, moneda: juego.moneda),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: (cliente is Cliente)
                        ? () => confirm(context, carton, cliente!,
                            context.read<CartonBloc>())
                        : () => needCliente(context),
                    child: const VenderButton(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void selectCliente(context) async {
    var response = await pushScreenData(context, JuegoScreen());
    if (response != null) {
      setState(() {
        cliente = response as Cliente;
      });
    }
    print('response $response');
  }

  void needCliente(context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(Msg.appMessage(context, 'warning', 'Seleccione Cliente'));
  }

  void confirm(
      context, Carton carton, Cliente cliente, CartonBloc cartonBloc) async {
    List<Widget> content = [
      ListTile(
        title: const Text('Cliente'),
        subtitle: Text(cliente.nombre),
      ),
      ListTile(
        title: const Text('Nro. Carton'),
        subtitle: Text(
          carton.numero.toString().padLeft(3, '0'),
        ),
      ),
      ListTile(
        title: const Text('Monto'),
        subtitle: Text(fL.currency(juego.valorCarton)),
      ),
      ListTile(
          title: const Text('Fecha'),
          subtitle: Text(fL.formatDateTime(DateTime.now()))),
    ];

    bool? isConfirm = await Dlg.appDialog(context, 'Confirmar Venta', content,
        action: 'Vender');

    if (isConfirm ?? false) {
      onSave(context, carton, cliente, cartonBloc);
    }
  }

  void onSave(BuildContext context, Carton carton, Cliente cliente,
      CartonBloc cartonBloc) {
    final bool isHoraCierre = DateTime.now().isAfter(juego.horaCierre);
    if (isHoraCierre) {
      ScaffoldMessenger.of(context).showSnackBar(
          Msg.appMessage(context, 'warning', 'Ventas Cerrada (Hora Cumplida)'));
    } else {
      Carton updCarton = carton.copyWith(
          idCliente: cliente.idCliente,
          estado: 'V',
          actualizado: DateTime.now());
      cartonBloc.add(UpdateCarton(updCarton, ''));
      /*context
          .read<NotificacionBloc>()
          .add(SetNotification(ntype: NTypes.cartones));*/
      ScaffoldMessenger.of(context).showSnackBar(Msg.appMessage(
          context,
          'success',
          'Carton ${carton.numero.toString().padLeft(3, '0')} Vendido'));
      navigateTo(context, 'carton_list');
    }
  }
}
