import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:vendedor_tienda/blocs/venta/venta_bloc.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/entities/venta.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'ventas_menu.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/utils/format/format_data.dart' as Fd;
import 'package:vendedor_tienda/widgets/layout/app_message.dart' as Msg;
import 'package:vendedor_tienda/widgets/layout/app_dialog.dart' as Dlg;

// ignore: must_be_immutable
class VentaListScreen extends StatelessWidget {
  VentaListScreen({super.key, cartones});

  late Fd.FormatLocale fL;
  late Juego juego;
  final textFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    juego = context.read<ItemsBloc>().state.juegoSelected;
    fL = Fd.FormatLocale(locale: juego.moneda);
    return BlocProvider(
      create: (context) => VentaBloc(),
      child: BlocConsumer<VentaBloc, VentaState>(
        buildWhen: (previus, current) {
          if (current is VentaExito) {
            msgAction(context, 'success', current.mensaje);
            return false;
          }

          if (current is VentaError) {
            msgAction(context, 'error', current.error);
            return false;
          }

          if (current is CancelarVentaLoading) {
            msgAction(context, 'loading', 'Cancelando...');
            return false;
          }

          if (current is CancelarVentaError) {
            msgAction(context, 'error', current.error);
            return false;
          }

          if (current is ReenvioVentaLoading) {
            msgAction(context, 'loading', 'Enviando...');
            return false;
          }

          if (current is ReenvioVentaExito) {
            msgAction(context, 'success', current.mensaje);
            return false;
          }

          if (current is ReenvioVentaError) {
            msgAction(context, 'error', current.error);
            return false;
          }

          if (current is ActualizarDatosLoading) {
            msgAction(context, 'loading', 'Actualizando...');
            return false;
          }

          if (current is ActualizarDatosExito) {
            msgAction(context, 'success', current.mensaje);
            return false;
          }

          if (current is ActualizarDatosError) {
            msgAction(context, 'error', current.error);
            return false;
          }

          return true;
        },
        listener: (context, stateVenta) {
          if (stateVenta is CancelarVentaExito) {
            msgAction(context, 'success', stateVenta.mensaje);
            context
                .read<VentaBloc>()
                .add(GetResumenVentas(juego.idProgramacionJuego));
          }
        },
        builder: (context, state) {
          if (state is VentaInitial) {
            context
                .read<VentaBloc>()
                .add(GetResumenVentas(juego.idProgramacionJuego));
          }
          return AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title: 'Ventas juego ${juego.idProgramacionJuego}',
              leading: IconButton(
                  onPressed: () => navigateTo(context, 'juego'),
                  icon: const Icon(Icons.chevron_left)),
              helpScreen: 'Cartones',
            ),
            drawer: const VentaMenu(),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () => context
                    .read<VentaBloc>()
                    .add(GetResumenVentas(juego.idProgramacionJuego)),
                child: const Icon(Icons.refresh)),
            child: Container(
                padding: const EdgeInsets.only(top: 6),
                child: listaVentas(context, state, juego)),
          );
        },
      ),
    );
  }

  Widget listaVentas(BuildContext context, VentaState state, Juego juego) {
    if (state is VentaError) {
      return Text(state.error);
    }
    if (state is ResumenVentasLoaded) {
      var resumenVenta = state.resumenVenta;
      var ventas = resumenVenta.listVentas;
      return Scrollbar(
        interactive: true,
        trackVisibility: true,
        radius: const Radius.circular(30),
        thickness: 10,
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 4),
            itemCount: ventas.length,
            itemBuilder: (BuildContext context, int index) {
              return itemsVentas(context, ventas[index]);
            }),
      );
    }
    return const LinearProgressIndicator();
  }

  Widget itemsVentas(BuildContext context, Venta venta) {
    String numeros = venta.listVentaDetalles
        .map((vd) => vd.carton.numero.toString().padLeft(4, '0'))
        .toList()
        .join('  ');

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primaryContainer
          ],
        ),
        color: Colors.white,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ListTile(
            leading: const SizedBox(width: 25),
            title: Text(venta.nombreCliente.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color:
                      (venta.estado == 'C') ? Colors.redAccent : Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                )),
            subtitle: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  width: double.infinity,
                  child: Text(
                    numeros,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total: ${Fd.formatNumber(venta.totalVenta)} ',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Text(
                        Fd.formatDateTimeShort(venta.fecha),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            trailing: PopupMenuButton(
                elevation: 16,
                onSelected: (accion) {
                  accionMenu(context, accion.toString(), venta);
                },
                color: Colors.white,
                itemBuilder: (context) => venta.estado == 'C'
                    ? [
                        PopupMenuItem(
                          value: 'info',
                          child: Row(children: [
                            Container(
                                padding: const EdgeInsets.only(right: 8),
                                child: const Icon(Icons.info,
                                    color: Colors.redAccent)),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(venta.observaciones ?? 'Cancelado',
                                  style:
                                      const TextStyle(color: Colors.redAccent)),
                            ),
                          ]),
                        )
                      ]
                    : [
                        PopupMenuItem(
                          value: 'reenviar',
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: const Icon(Icons.send,
                                      color: Colors.blueAccent)),
                              const Text('Reenviar Correo',
                                  style: TextStyle(color: Colors.blueAccent)),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'envioWhatsapp',
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: const Icon(Icons.phone_forwarded_sharp,
                                      color: Colors.green)),
                              const Text('Reenviar Whatsapp',
                                  style: TextStyle(color: Colors.green)),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'cancelar',
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: const Icon(Icons.cancel,
                                      color: Colors.redAccent)),
                              const Text(
                                'Cancelar Venta',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'actualizarCorreo',
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: const Icon(Icons.mail,
                                      color: Colors.purple)),
                              const Text('Actualizar Correo',
                                  style: TextStyle(color: Colors.purple)),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'actualizarTelefono',
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: const Icon(Icons.phone_iphone_rounded,
                                      color: Colors.green)),
                              const Text('Actualizar Celular',
                                  style: TextStyle(color: Colors.green)),
                            ],
                          ),
                        ),
                      ],
                icon: venta.estado == 'C'
                    ? Icon(Icons.info_outline_rounded,
                        color: Colors.red.shade600)
                    : const Icon(Icons.settings, color: Colors.white),
                iconSize: 30),
          ),
          Positioned(
            top: -3.3,
            child: Container(
              width: 50,
              height: 88.5,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.secondaryContainer
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30),
                        color: (venta.estado == 'C')
                            ? Colors.redAccent
                            : Colors.lightGreen),
                    child: Icon(
                      (venta.estado == 'C')
                          ? Icons.money_off
                          : Icons.monetization_on_sharp,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  Text(
                    venta.idVenta.toString().padLeft(4, '0'),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void msgAction(BuildContext context, String type, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(Msg.appMessage(context, type, message));
  }

  void accionMenu(BuildContext context, String accion, Venta venta) {
    switch (accion) {
      case 'reenviar':
        confirmReenvio(context, venta);
        break;
      case 'envioWhatsapp':
        confirmWhatsapp(context, venta);
        break;
      case 'cancelar':
        confirmCancelar(context, venta);
        break;
      case 'actualizarCorreo':
        confirmActualizarCorreo(context, venta);
        break;
      case 'actualizarTelefono':
        confirmActualizarTelefono(context, venta);
        break;
      default:
    }
  }

  void confirmCancelar(BuildContext context, Venta venta) async {
    List<Widget> content = [
      infoConfirm(context, venta),
      FormBuilderTextField(
        name: 'motivoCancelacion',
        key: textFieldKey,
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: Colors.amber),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Motivo de Cancelacion',
          labelStyle: const TextStyle(color: Colors.amber),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          isDense: true,
          suffixIcon: const Icon(Icons.info),
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
              errorText: 'Se requiere el movivo de la cancelacion'),
          FormBuilderValidators.minLength(3,
              errorText: 'Indique una descripcion válida')
        ]),
      ),
    ];

    bool? isConfirm = await Dlg.appDialog(
        context, 'Cancelar Venta Nro ${venta.idVenta}', content,
        action: 'Confirmar');

    if (isConfirm ?? false) {
      bool valid = textFieldKey.currentState!.isValid;
      if (valid) {
        cancelarVenta(context, venta, textFieldKey.currentState!.value);
      } else {
        msgAction(context, 'error', 'No se indico motivo cancelacion');
      }
    }
  }

  void confirmWhatsapp(BuildContext context, Venta venta) async {
    List<Widget> content = [
      infoConfirm(context, venta),
    ];

    bool? isConfirm = await Dlg.appDialog(
        context, 'Reenvio Whatsapp Venta Nro ${venta.idVenta}', content,
        action: 'Confirmar');

    if (isConfirm ?? false) {
      bool valid = true;
      if (valid) {
        reenviarWhatsapp(context, venta.idVenta, '');
      }
    }
  }

  void confirmReenvio(BuildContext context, Venta venta) async {
    List<Widget> content = [
      infoConfirm(context, venta),
      FormBuilderTextField(
        name: 'motivoReenvio',
        key: textFieldKey,
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: Colors.amber),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Motivo de Reenvio',
          labelStyle: const TextStyle(color: Colors.amber),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          isDense: true,
          suffixIcon: const Icon(Icons.info),
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
              errorText: 'Se requiere el motivo del reenvio'),
          FormBuilderValidators.minLength(3,
              errorText: 'Indique una descripcion válida')
        ]),
      ),
    ];

    bool? isConfirm = await Dlg.appDialog(
        context, 'Reenvio Venta Nro ${venta.idVenta}', content,
        action: 'Confirmar');

    if (isConfirm ?? false) {
      bool valid = textFieldKey.currentState!.isValid;
      if (valid) {
        reenviarVenta(context, venta.idVenta, textFieldKey.currentState!.value);
      } else {
        msgAction(context, 'error', 'No se indico motivo reenvio');
      }
    }
  }

  void confirmActualizarCorreo(BuildContext context, Venta venta) async {
    List<Widget> content = [
      infoConfirm(context, venta),
      FormBuilderTextField(
        name: 'nuevoCorreo',
        key: textFieldKey,
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: Colors.amber),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Nuevo Correo',
          labelStyle: const TextStyle(color: Colors.amber),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          isDense: true,
          suffixIcon: const Icon(Icons.info),
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
              errorText: 'Se requiere el nuevo correo'),
          FormBuilderValidators.email(errorText: 'Indique un correo válido')
        ]),
      ),
    ];

    bool? isConfirm = await Dlg.appDialog(
        context, 'Actualizar correo Venta Nro ${venta.idVenta}', content,
        action: 'Confirmar');

    if (isConfirm ?? false) {
      bool valid = textFieldKey.currentState!.isValid;
      if (valid) {
        actualizarCorreo(
            context, venta.idVenta, textFieldKey.currentState!.value);
      } else {
        msgAction(context, 'error', 'No se indico nuevo correo');
      }
    }
  }

  void confirmActualizarTelefono(BuildContext context, Venta venta) async {
    List<Widget> content = [
      infoConfirm(context, venta),
      FormBuilderTextField(
        name: 'nuevoTelefono',
        key: textFieldKey,
        autofocus: true,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.amber),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: 'Nuevo Telefono',
          labelStyle: const TextStyle(color: Colors.amber),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          isDense: true,
          suffixIcon: const Icon(Icons.info),
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '(${juego.prefijoTelefonico})',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
              errorText: 'Se requiere el nuevo celular'),
          FormBuilderValidators.numeric(errorText: 'Indique un celular válido')
        ]),
      ),
    ];

    bool? isConfirm = await Dlg.appDialog(
        context, 'Actualizar Celular Venta Nro ${venta.idVenta}', content,
        action: 'Confirmar');

    if (isConfirm ?? false) {
      bool valid = textFieldKey.currentState!.isValid;
      if (valid) {
        actualizarTelefono(
            context, venta.idVenta, textFieldKey.currentState!.value);
      } else {
        msgAction(context, 'error', 'No se indico nuevo celular');
      }
    }
  }

  void cancelarVenta(BuildContext context, Venta venta, String obsv) {
    context
        .read<VentaBloc>()
        .add(CancelarVenta(venta, juego.idProgramacionJuego, obsv));
  }

  void reenviarVenta(BuildContext context, int idventa, String obsv) {
    context.read<VentaBloc>().add(ReenviarCartonesVenta(idventa, obsv));
  }

  void reenviarWhatsapp(BuildContext context, int idventa, String obsv) {
    context.read<VentaBloc>().add(ReenviarWhatsappVenta(idventa, obsv));
  }

  void actualizarCorreo(BuildContext context, int idventa, String correo) {
    context
        .read<VentaBloc>()
        .add(ActualizarCorreoVenta(juego.idProgramacionJuego, idventa, correo));
  }

  void actualizarTelefono(BuildContext context, int idventa, String telefono) {
    context.read<VentaBloc>().add(
        ActualizarTelefonoVenta(juego.idProgramacionJuego, idventa, telefono));
  }

  Widget infoConfirm(BuildContext context, Venta venta) {
    return Column(
      children: [
        ListTile(
          dense: true,
          title: const Text('Cliente'),
          subtitle: Text(venta.nombreCliente,
              style: const TextStyle(color: Colors.white)),
        ),
        ListTile(
          dense: true,
          title: const Text('Correo'),
          subtitle: Text(venta.correoCliente ?? '',
              style: const TextStyle(color: Colors.white)),
        ),
        ListTile(
          dense: true,
          title: const Text('Celular'),
          subtitle: Text(venta.telefonoCliente ?? '',
              style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
