import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/auth/auth_bloc.dart';
import 'package:vendedor_tienda/blocs/enviocartones/enviocartones_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/entities/cliente.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/screens/carton/witget/carton_bingo.dart';
import 'package:vendedor_tienda/widgets/layout/app_container.dart';
import 'package:vendedor_tienda/widgets/layout/app_message.dart' as Msg;
import 'package:vendedor_tienda/utils/format/format_data.dart' as Fd;

class CartonDetalle extends StatefulWidget {
  final Carton carton;
  const CartonDetalle({super.key, required this.carton});

  @override
  State<CartonDetalle> createState() => _CartonDetalleState();
}

class _CartonDetalleState extends State<CartonDetalle> {
  Cliente? cliente;
  late Juego juego;
  late Fd.FormatLocale fL;
  late int idUsuario;

  @override
  Widget build(BuildContext context) {
    juego = context.read<ItemsBloc>().state.juegoSelected;
    fL = Fd.FormatLocale(locale: juego.moneda);

    AuthState authState = context.read<AuthBloc>().state;
    if (authState is AuthLogged) {
      idUsuario = authState.usuario.idUsuario;
    }

    return BlocProvider(
        create: (context) => EnviocartonesBloc(),
        child: BlocBuilder<EnviocartonesBloc, EnviocartonesState>(
            builder: (context, state) {
          return Column(
            children: [
              (state is EnviocartonesLoading)
                  ? const LinearProgressIndicator()
                  : Container(),
              (state is EnviocartonesExito)
                  ? Text(state.mensaje,
                      style: const TextStyle(
                          color: Colors.greenAccent, fontSize: 12))
                  : Container(),
              (state is EnviocartonesError)
                  ? Text(state.error,
                      style: const TextStyle(
                          color: Colors.redAccent, fontSize: 12))
                  : Container(),
              ListTile(
                title: const Text('Cliente:'),
                subtitle: Text(widget.carton.nombreCliente ?? 'No Vendido'),
                dense: true,
              ),
              AppContainer(
                child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: CartonBingo(
                      carton: widget.carton,
                      encabezado: juego.encabezadoCartones,
                    )),
              ),
              (widget.carton.estado == 'V' &&
                      widget.carton.idSucursal == idUsuario)
                  ? Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () => sendMail(context, widget.carton,
                              context.read<EnviocartonesBloc>()),
                          backgroundColor: Colors.redAccent,
                          mini: true,
                          child: const Icon(Icons.mail),
                        ),
                        FloatingActionButton(
                          onPressed: () => sendWhatsApp(context, widget.carton,
                              context.read<EnviocartonesBloc>()),
                          backgroundColor: Colors.green,
                          mini: true,
                          child: const Icon(Icons.phone_android),
                        ),
                      ],
                    )
                  : Container()
            ],
          );
        }));
  }

  void sendMail(context, Carton carton, EnviocartonesBloc enviocartonesBloc) {
    enviocartonesBloc.add(EnvioCartonesCorreo(1));
  }

  void sendWhatsApp(
      context, Carton carton, EnviocartonesBloc enviocartonesBloc) {
    /*enviocartonesBloc.add(EnvioCartonesCorreo(carton.idProgramacionJuego,
        idUsuario, carton.idCliente!, [carton.idCarton]));*/
    ScaffoldMessenger.of(context)
        .showSnackBar(Msg.appMessage(context, 'warning', 'Por Implementar'));
  }
}
